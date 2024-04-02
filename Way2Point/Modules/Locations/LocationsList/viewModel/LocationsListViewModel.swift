import UIKit

//MARK: - Protocol for expansion LocationsListViewModel class with mrthods , wich useing for implemendation logic of the view.

protocol LocationListViewModelProtocol {
    
    func showDetails(with location: TheLocation, _ images: [UIImage?])
    func loadData()
    
    var showNotificationsAlert: ((UIAlertController) -> Void)? { get set }
    var updateData: (([TheLocation], [[UIImage?]]) -> Void)? { get set }
}



//MARK: - Final class LocationsViewModel

final class LocationsListViewModel {
    
    var locations: [TheLocation] = []
    var images: [[UIImage?]] = []
    
    var showLocationDetails: ((TheLocation, [UIImage?]) -> Void)?
    var showNotificationsAlert: ((UIAlertController) -> Void)?
    var updateData: (([TheLocation], [[UIImage?]]) -> Void)?
    
    
    private func loadingLocations() {
        let result = CoreDataManager.instance.loadLocations()
        switch result {
        case .success(let locations):
            self.locations = locations
            for location in locations {
                frtchImages(from: location)
            }
        case .failure(let failure):
            let alert = UserNotificationsManager.instance.showAlertWithError(by: .error, wiht: failure.description())
            showNotificationsAlert?(alert)
        }
    }
    
    private func frtchImages(from location: TheLocation) {
        var imagesArray: [UIImage?] = []
        guard let images = location.imagesRelationship?.allObjects as? [TheImages] else { return }
        for image in images {
            if let data = image.image {
                imagesArray.append(UIImage(data: data))
            }
        }
        self.images.append(imagesArray)
    }
}



//MARK: - Impemendation of the LocationListViewModelProtocol

extension LocationsListViewModel: LocationListViewModelProtocol {
    
    func loadData() {
        loadingLocations()
        updateData?(locations, images)
    }
    
    func showDetails(with location: TheLocation, _ images: [UIImage?]) {
        showLocationDetails?(location, images)
    }
}
