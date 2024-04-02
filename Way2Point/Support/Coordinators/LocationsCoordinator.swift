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
        
        viewModel.showLocationDetails = { [weak self] location, images in
            self?.showLocationDetailsScreen(view, with: location, images)
        }
        return navigationController
    }
    
    
    private func showLocationDetailsScreen(_ parent: UIViewController, with location: TheLocation, _ images: [UIImage?]) {
        
        let viewModel = LocationDetailsViewModel(locations: location, images: images)
        let view = LocationDetailsView(viewModel: viewModel)
        
        parent.navigationController?.pushViewController(view, animated: true)
    }
}
