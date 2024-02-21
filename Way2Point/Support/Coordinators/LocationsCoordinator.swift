import UIKit

final class LocationsCoordinator {
    
    let navigationController: UINavigationController
    
    init() {
        self.navigationController = UINavigationController()
    }
    
    
    func start() -> UIViewController {
        let viewModel = LocationsViewModel()
        let view = LocationsView(viewModel: viewModel)
        navigationController.setViewControllers([view], animated: false)
        
        viewModel.showLocationDetails = { [weak self] in
            self?.showLocationDetailsScreen(view)
        }
        return navigationController
    }
    
    
    func showLocationDetailsScreen(_ parent: UIViewController) {
        
        let view = LocationDetailsView()
        let viewModel = LocationDetailsViewModel()
        view.viewModel = viewModel
        
        parent.navigationController?.pushViewController(view, animated: true)
    }
}
