import UIKit

//MARK: - Final class SaveCoordinator

final class SaveCoordinator {
    
    private let navigationController: UINavigationController
    
    
    init() {
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
        
        let viewModel = AddNewLocationViewModel()
        let view = AddNewLocationView(viewModel: viewModel)
        
        parent.navigationController?.pushViewController(view, animated: true)
    }
}
