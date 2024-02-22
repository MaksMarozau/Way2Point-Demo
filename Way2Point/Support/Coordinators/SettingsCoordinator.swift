import UIKit

final class SettingsCoordinator {
    
    private let navigationController: UINavigationController
    
    init() {
        self.navigationController = UINavigationController()
    }
    
    
    func start() -> UIViewController {
        
        let view = SettingsView()
        
        navigationController.pushViewController(view, animated: true)
        
        return navigationController
    }
}
