import UIKit

final class NavigationCoordinator {
    
    let rootViewController: NavigationView
    let navigationController: UINavigationController
    
    init() {
        self.navigationController = UINavigationController()
        self.rootViewController = NavigationView()
        
//        let viewModel = SaveViewModel()
        let view = rootViewController
//        view.viewModel = viewModel
    }
    
    
    func start() {
        navigationController.pushViewController(rootViewController, animated: true)
    }
}
