import UIKit
import CoreLocation

//MARK: - Protocol for expansion LocationDetailsViewModel class with mrthods , wich useing for implemendation logic of the view.

protocol LocationDetailsViewModelProtocol {
    func getData()
    func moveToNavigationScreen()
    var updateData: ((TheLocation, [UIImage?]) -> Void)? { get set }
}


//MARK: - Final class LocationDetailsViewModel

final class LocationDetailsViewModel {
    
    private let location: TheLocation
    private let images: [UIImage?]
    
    var updateData: ((TheLocation, [UIImage?]) -> Void)?
    var showNavigationScreen: ((CLLocationCoordinate2D) -> Void)?
    
    
    init(locations: TheLocation, images: [UIImage?]) {
        self.location = locations
        self.images = images
    }
    
    
    private func getGPSCoordinate() -> CLLocationCoordinate2D {
        let latitude = location.locLatitude
        let longitude = location.locLongitude
        let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        return coordinate
    }
}


//MARK: - Impemendation of the LocationDetailsViewModelProtocol

extension LocationDetailsViewModel: LocationDetailsViewModelProtocol {
    
    func moveToNavigationScreen() {
        let coordinate = getGPSCoordinate()
        showNavigationScreen?(coordinate)
    }
    
    func getData() {
        updateData?(location, images)
    }
}
