import UIKit

final class ToolsCoordinator {
    
    private let navigationController: UINavigationController
    
    init() {
        self.navigationController = UINavigationController()
    }
    
    
    func start() -> UIViewController {

        let view = ToolsView()
        
        navigationController.pushViewController(view, animated: true)
        
        return navigationController
    }
}
