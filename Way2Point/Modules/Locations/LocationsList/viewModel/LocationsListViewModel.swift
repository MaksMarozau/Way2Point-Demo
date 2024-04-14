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
    

//MARK: - Properties of class
    
    var locations: [TheLocation] = []
    var images: [[UIImage?]] = []
    
    var showLocationDetails: ((TheLocation, [UIImage?]) -> Void)?
    var showNotificationsAlert: ((UIAlertController) -> Void)?
    var updateData: (([TheLocation], [[UIImage?]]) -> Void)?
    

//MARK: - Loading of locations and fetch images from locations
    
    private func loadingLocations() {
        let result = CoreDataManager.instance.loadLocations()
        switch result {
        case .success(let locations):
            self.locations = locations
            let dispatchGroup = DispatchGroup()
            for location in locations {
                dispatchGroup.enter()
                fetchImages(from: location) { [weak self] imagesArray in
                    self?.images.append(imagesArray)
                    dispatchGroup.leave()
                }
            }
            dispatchGroup.notify(queue: .main) { [weak self] in
                self?.update()
            }
        case .failure(let failure):
            let alert = UserNotificationsManager.instance.showAlertWithError(by: .error, wiht: failure.description())
            showNotificationsAlert?(alert)
        }
    }

    private func fetchImages(from location: TheLocation, completion: @escaping ([UIImage?]) -> Void) {
        var imagesArray: [UIImage?] = []
        guard let images = location.imagesRelationship?.allObjects as? [TheImages] else {
            completion(imagesArray)
            return
        }
        let dispatchGroup = DispatchGroup()
        for image in images {
            dispatchGroup.enter()
            if let data = image.image {
                DispatchQueue.main.async {
                    imagesArray.append(UIImage(data: data))
                    dispatchGroup.leave()
                }
            } else {
                dispatchGroup.leave()
            }
        }
        dispatchGroup.notify(queue: .main) {
            completion(imagesArray)
        }
    }
    
    
//MARK: - Update state of view and viewModel's arrays
    private func update() {
        updateData?(locations, images)
        locations = []
        images = []
    }
}


//MARK: - Impemendation of the LocationListViewModelProtocol

extension LocationsListViewModel: LocationListViewModelProtocol {
    
    func loadData() {
        loadingLocations()
    }
    
    func showDetails(with location: TheLocation, _ images: [UIImage?]) {
        showLocationDetails?(location, images)
    }
}
