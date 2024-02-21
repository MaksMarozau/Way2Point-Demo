protocol LocationListViewModelProtocol: AnyObject {
    
    func showDetails()
}



final class LocationsViewModel {
    
    var showLocationDetails: (() -> Void)?
}



extension LocationsViewModel: LocationListViewModelProtocol {
    
    func showDetails() {
        showLocationDetails?()
    }
    
}
