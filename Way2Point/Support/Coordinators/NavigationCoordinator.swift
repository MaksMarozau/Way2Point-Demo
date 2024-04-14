import UIKit
import CoreLocation

//MARK: - Final class NavigationCoordinator

final class NavigationCoordinator {
    
    private let navigationController: UINavigationController
    private var coordinate: CLLocationCoordinate2D
    var getCoordinate: ((CLLocationCoordinate2D) -> Void)?
    
    init(coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
        self.navigationController = UINavigationController()
        
        getCoordinate = { coordinate in
            self.coordinate = coordinate
        }
    }
    
    func start() -> UIViewController {
        
        let locationManager = LocationManager()
        let viewModel = NavigationScreenViewModel(locationManager: locationManager)
        let view = NavigationScreenView(viewModel: viewModel)
        
        viewModel.setLocationsCoordinates(coordinate: coordinate)
        
        navigationController.pushViewController(view, animated: true)
        
        return navigationController
    }
    
    func reBuilding() {
        
        navigationController.viewControllers.removeAll()
        let locationManager = LocationManager()
        let viewModel = NavigationScreenViewModel(locationManager: locationManager)
        let view = NavigationScreenView(viewModel: viewModel)
        
        viewModel.setLocationsCoordinates(coordinate: coordinate)
        
        navigationController.pushViewController(view, animated: true)
    }
}
