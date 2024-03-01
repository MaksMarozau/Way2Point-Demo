import UIKit

//MARK: - Final class SaveCoordinator

final class SaveCoordinator {
    
    private let navigationController: UINavigationController
    private let appCoordinator: AppCoordinator
    
    
    init(appCoordinator: AppCoordinator) {
        self.appCoordinator = appCoordinator
        self.navigationController = UINavigationController()
    }
    
    
    func start() -> UIViewController {
        
        let viewModel = SaveTitleViewModel()
        let view = SaveTitleView(viewModel: viewModel)
        
        navigationController.setViewControllers([view], animated: false)
        
        viewModel.showAddLocationScreen = { [weak self] in
            self?.showAddLocationScreen(view)
        }
        
        return navigationController
    }
    
    
    private func showAddLocationScreen(_ parent: UIViewController) {
        
        let imagePicker = ImagePickerView()
        let locationManager = LocationManager()
        let viewModel = AddNewLocationViewModel(imagePicker: imagePicker, locationManager: locationManager)
        let view = AddNewLocationView(viewModel: viewModel)
        
        parent.navigationController?.pushViewController(view, animated: true)
        
        viewModel.movieToStartAppScreen = { [weak self] in
            parent.navigationController?.popToRootViewController(animated: false)
            self?.appCoordinator.tabBarController.selectedIndex = 0
        }
    }
}
