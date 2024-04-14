import UIKit

//MARK: - Final class ToolsCoordinator

final class ToolsCoordinator {
    
    private let navigationController: UINavigationController
    
    init() {
        self.navigationController = UINavigationController()
    }
    
    
    func start() -> UIViewController {

        let viewModel = ToolsMainScreenViewModel()
        let view = ToolsMainScreenView(viewModel: viewModel)
        
        navigationController.pushViewController(view, animated: true)
        
        return navigationController
    }
}
