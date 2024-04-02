import UIKit

//MARK: - Protocol for expansion LocationDetailsViewModel class with mrthods , wich useing for implemendation logic of the view.

protocol LocationDetailsViewModelProtocol {
    func getData()
    var updateData: ((TheLocation, [UIImage?]) -> Void)? { get set }
}



//MARK: - Final class LocationDetailsViewModel

final class LocationDetailsViewModel {
    
    private let locations: TheLocation
    private let images: [UIImage?]
    
    var updateData: ((TheLocation, [UIImage?]) -> Void)?
    
    init(locations: TheLocation, images: [UIImage?]) {
        self.locations = locations
        self.images = images
    }
}



//MARK: - Impemendation of the LocationDetailsViewModelProtocol

extension LocationDetailsViewModel: LocationDetailsViewModelProtocol {
    
    func getData() {
        updateData?(locations, images)
    }
}
