import UIKit

//MARK: - Final class SaveTitleView

final class SaveTitleView: UIViewController {
    
    
//MARK: - Properties of class
    
    private let viewModel: SaveTitleViewModelProtocol
    
    private let saveButton = UIButton()
    private let instructionLabel = UILabel()
    
    
    
//MARK: - Initializator
    
    init(viewModel: SaveTitleViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
//MARK: - Lifecycle of controller
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubviews(views: saveButton, instructionLabel)
        
        setConstraintes()
        configureUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        configureNavigationBar()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        setCircleCornerRadius()
        setAnimations()
    }
    
    
    
//MARK: - Configurations of Navigation bar
    
    private func configureNavigationBar() {
        
        navigationController?.customColorsScheme()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Save locations"
    }
    
    
    
//MARK: - Setting of constraintes
    
    private func setConstraintes() {
        
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        saveButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        saveButton.heightAnchor.constraint(equalToConstant: 80).isActive = true
        saveButton.widthAnchor.constraint(equalToConstant: 240).isActive = true
        
        instructionLabel.translatesAutoresizingMaskIntoConstraints = false
        instructionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        instructionLabel.topAnchor.constraint(equalTo: saveButton.bottomAnchor, constant: 100).isActive = true
        instructionLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true
        instructionLabel.widthAnchor.constraint(equalToConstant: 240).isActive = true
    }
    
    
    
//MARK: - Configuration of User Interface
    
    private func configureUI() {
        
        saveButton.backgroundColor = .backgroundCell
        saveButton.setAttributedTitle(setAttributedText("Save"), for: .normal)
        saveButton.layer.borderWidth = 3
        saveButton.layer.borderColor = UIColor.violetFlower.cgColor
        saveButton.layer.shadowColor = UIColor.violetRose.cgColor
        saveButton.layer.shadowOffset = CGSize(width: 5, height: 5)
        saveButton.layer.shadowOpacity = 1
        saveButton.layer.shadowRadius = 50
        saveButton.addTarget(self, action: #selector(saveTouchDown), for: .touchDown)
        saveButton.addTarget(self, action: #selector(saveTouchUp), for: .touchUpInside)
        
        instructionLabel.font = UIFont(name: "Hoefler Text Black Italic", size: 17)
        instructionLabel.textColor = .violetFlower
        instructionLabel.numberOfLines = 2
        instructionLabel.textAlignment = .center
        instructionLabel.text = "Press button\nto save the current location..."
    }
    
    
    private func setCircleCornerRadius() {
        
        saveButton.layer.cornerRadius = saveButton.frame.height / 2
        saveButton.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMaxYCorner]
    }
    
    
    
//MARK: - Attributed text
    
    private func setAttributedText(_ text: String) -> NSAttributedString {
        
        let text = text
        let attributedString = NSMutableAttributedString(string: text)
        let range = (text as NSString).range(of: text)
        let attributes: [NSAttributedString.Key : Any] = [
            .font : UIFont(name: "Futura Bold", size: 32),
            .foregroundColor : UIColor.violetFlower,
            .strokeColor : UIColor.violetRose,
            .strokeWidth : -3,
        ]
        attributedString.addAttributes(attributes, range: range)
        return attributedString
    }
    
    
    
//MARK: - Actions
    
    @objc private func saveTouchDown(_ sender: UIButton) {
        UIView.animate(withDuration: 0.1) {
            sender.layer.shadowOffset = CGSize(width: -5, height: -5)
            sender.backgroundColor = UIColor.backgroundBar
        }
    }
    
    @objc private func saveTouchUp(_ sender: UIButton) {
        UIView.animate(withDuration: 0.1) {
            sender.layer.shadowOffset = CGSize(width: 5, height: 5)
            sender.backgroundColor = .backgroundCell
        } completion: { _ in
            self.viewModel.saveCurrentLocation()
        }
    }
    
    
    
//MARK: - Animations
    
    private func setAnimations() {
        UIView.animate(withDuration: 1.5, delay: 1, options: [.autoreverse, .repeat]) {
            self.instructionLabel.alpha = 0.1
        } completion: { _ in
            self.instructionLabel.alpha = 1
        }
    }
}
