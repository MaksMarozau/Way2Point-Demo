import UIKit

//MARK: - Final class LocationsCoordinator

final class LocationsCoordinator {
    
    private let navigationController: UINavigationController
    
    
    init() {
        self.navigationController = UINavigationController()
    }
    
    
    func start() -> UIViewController {
        let viewModel = LocationsListViewModel()
        let view = LocationsListView(viewModel: viewModel)
        
        navigationController.setViewControllers([view], animated: false)
        
        viewModel.showLocationDetails = { [weak self] in
            self?.showLocationDetailsScreen(view)
        }
        return navigationController
    }
    
    
    private func showLocationDetailsScreen(_ parent: UIViewController) {
        
        let viewModel = LocationDetailsViewModel()
        let view = LocationDetailsView(viewModel: viewModel)
        
        parent.navigationController?.pushViewController(view, animated: true)
    }
}
