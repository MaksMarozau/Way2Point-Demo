import UIKit

final class ToolsCoordinator {
    
    let rootViewController: ToolsView
    let navigationController: UINavigationController
    
    init() {
        self.navigationController = UINavigationController()
        self.rootViewController = ToolsView()
        
//        let viewModel = SaveViewModel()
        let view = rootViewController
//        view.viewModel = viewModel
    }
    
    
    func start() {
        navigationController.pushViewController(rootViewController, animated: true)
    }
}
