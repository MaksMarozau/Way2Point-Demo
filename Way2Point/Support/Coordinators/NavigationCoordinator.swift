import UIKit

//MARK: - Final class NavigationCoordinator

final class NavigationCoordinator {
    
    private let navigationController: UINavigationController
    
    init() {
        self.navigationController = UINavigationController()
    }
    
    
    func start() -> UIViewController {
        
        let view = NavigationView()
        
        navigationController.pushViewController(view, animated: true)
        
        return navigationController
    }
}
