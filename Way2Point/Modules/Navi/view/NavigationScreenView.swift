import UIKit
import CoreLocation

//MARK: - Final class NavigationScreenView

final class NavigationScreenView: UIViewController {

//MARK: - Properties of class
    
    private var viewModel: NavigationScreenViewModelProtocol
    
    private let arrowImageView = UIImageView()
    private var lastArrowStatus: CLLocationDegrees = 0
    
    
//MARK: - Initialization
    
    init(viewModel: NavigationScreenViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

//MARK: - Lifecycles
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addSubViews()
        setConstraintes()
        configureUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        getangleBinding()
        viewModel.createDeflexionAngle()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        viewModel.stopUpdatingPosition()
    }

    
//MARK: - Add subviews

    private func addSubViews() {
        view.addSubview(arrowImageView)
    }
    
    
//MARK: - Setting of constraintes

    private func setConstraintes() {
        arrowImageView.translatesAutoresizingMaskIntoConstraints = false
        arrowImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        arrowImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        arrowImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        arrowImageView.heightAnchor.constraint(equalTo: arrowImageView.widthAnchor, multiplier: 1).isActive = true
    }
    
    
//MARK: - Configuration of User Interface

    private func configureUI() {
        arrowImageView.image = UIImage(named: "gpsArrow")
        arrowImageView.contentMode = .scaleAspectFit
    }
    
    
//MARK: - turning of compas's arrow with animation
    
    private func turnArrow(to angle: CLLocationDegrees) {
        UIView.animate(withDuration: 1) {
            self.arrowImageView.transform = CGAffineTransform(rotationAngle: angle)
        }
    }
    
    
//MARK: - ViewModel's bindings
    
    private func getangleBinding() {
        viewModel.provideDeflexionangle = { [weak self] angle in
            let angleRad = angle.radians
            self?.turnArrow(to: angleRad)
        }
    }
}
