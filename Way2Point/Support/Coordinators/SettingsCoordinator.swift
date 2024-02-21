import UIKit

final class SettingsCoordinator {
    
    let rootViewController: SettingsView
    let navigationController: UINavigationController
    
    init() {
        self.navigationController = UINavigationController()
        self.rootViewController = SettingsView()
        
//        let viewModel = SaveViewModel()
        let view = rootViewController
//        view.viewModel = viewModel
    }
    
    
    func start() {
        navigationController.pushViewController(rootViewController, animated: true)
    }
}
