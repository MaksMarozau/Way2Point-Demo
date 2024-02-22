import UIKit

//MARK: - Final class SettingsCoordinator

final class SettingsCoordinator {
    
    private let navigationController: UINavigationController
    
    init() {
        self.navigationController = UINavigationController()
    }
    
    
    func start() -> UIViewController {
        
        let viewModel = SettingsScreenViewModel()
        let view = SettingsScreenView(viewModel: viewModel)
        
        navigationController.pushViewController(view, animated: true)
        
        return navigationController
    }
}
