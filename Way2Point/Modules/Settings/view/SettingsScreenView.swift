import UIKit

final class SettingsScreenView: UIViewController {

    private let viewModel: SettingsScreenViewModelProtocol
    
    init(viewModel: SettingsScreenViewModelProtocol) {
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
