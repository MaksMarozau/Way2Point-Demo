import UIKit

final class SaveCoordinator {
    
    let rootViewController: SaveView
    let navigationController: UINavigationController
    
    init() {
        self.navigationController = UINavigationController()
        rootViewController = SaveView()
        
        let viewModel = SaveViewModel()
        let view = rootViewController
        view.viewModel = viewModel
    }
    
    
    func start() {
        navigationController.pushViewController(rootViewController, animated: true)
    }
}
