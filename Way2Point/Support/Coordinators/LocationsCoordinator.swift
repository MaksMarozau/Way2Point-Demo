import UIKit

//MARK: - Final class LocationsCoordinator

final class LocationsCoordinator {
    
    private let navigationController: UINavigationController
    private let appCoordinator: AppCoordinator
    
    
    init(appCoordinator: AppCoordinator) {
        self.appCoordinator = appCoordinator
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
        
        viewModel.showNavigationScreen = { [weak self] coordinate in
            parent.navigationController?.popToRootViewController(animated: false)
            self?.appCoordinator.navigationCoordinator?.getCoordinate?(coordinate)
            self?.appCoordinator.navigationCoordinator?.reBuilding()
            self?.appCoordinator.tabBarController.selectedIndex = 2
        }
    }
}
