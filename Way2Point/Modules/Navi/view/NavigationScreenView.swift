import UIKit

final class NavigationScreenView: UIViewController {

    private let viewModel: NavigationScreenViewModelProtocol
    
    
    
    init(viewModel: NavigationScreenViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

