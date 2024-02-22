//MARK: - Protocol for expansion LocationsListViewModel class with mrthods , wich useing for implemendation logic of the view.

protocol LocationListViewModelProtocol {
    
    func showDetails()
}



//MARK: - Final class LocationsViewModel

final class LocationsListViewModel {
    
    var showLocationDetails: (() -> Void)?
}



//MARK: - Impemendation of the LocationListViewModelProtocol

extension LocationsListViewModel: LocationListViewModelProtocol {
    
    func showDetails() {
        showLocationDetails?()
    }
}
