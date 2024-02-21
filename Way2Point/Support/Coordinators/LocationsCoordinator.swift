import UIKit

final class LocationsCoordinator {
    
    let rootViewController: LocationsView
    let navigationController: UINavigationController
    
    init() {
        self.navigationController = UINavigationController()
        rootViewController = LocationsView()
        
        let viewModel = LocationListViewModel()
        let view = rootViewController
        view.viewModel = viewModel
    }
    
    
    func start() {
        navigationController.pushViewController(rootViewController, animated: true)
    }
}
