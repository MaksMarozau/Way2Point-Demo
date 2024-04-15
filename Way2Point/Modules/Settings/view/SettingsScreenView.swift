import UIKit

//MARK: - Final class SettingsScreenView

final class SettingsScreenView: UIViewController {

    
//MARK: - Properties of class
    
    private let viewModel: SettingsScreenViewModelProtocol
    
    private let soundButton = UIButton()
    private let vibroButton = UIButton()
    private let soundLabel = UILabel()
    private let vibroLabel = UILabel()
    
    
//MARK: - Initialization
    
    init(viewModel: SettingsScreenViewModelProtocol) {
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
        super.viewWillAppear(animated)
        configureNavigationBar()
    }
    
    
//MARK: - Configurations of Navigation bar
        
    private func configureNavigationBar() {
        navigationController?.customColorsScheme()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Settings"
    }
    
    
//MARK: - Adding of subViews
    private func addSubViews() {
        view.addSubviews(views: soundLabel, soundButton, vibroLabel, vibroButton)
    }
    
    
//MARK: - Setting of constraintes
    
    private func setConstraintes() {
        soundButton.translatesAutoresizingMaskIntoConstraints = false
        soundButton.bottomAnchor.constraint(equalTo: view.centerYAnchor, constant: -30).isActive = true
        soundButton.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 50).isActive = true
        soundButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.2).isActive = true
        soundButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        vibroButton.translatesAutoresizingMaskIntoConstraints = false
        vibroButton.topAnchor.constraint(equalTo: view.centerYAnchor, constant: 30).isActive = true
        vibroButton.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 50).isActive = true
        vibroButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.2).isActive = true
        vibroButton.heightAnchor.constraint(equalToConstant: 40).isActive = true

        soundLabel.translatesAutoresizingMaskIntoConstraints = false
        soundLabel.centerYAnchor.constraint(equalTo: soundButton.centerYAnchor).isActive = true
        soundLabel.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -30).isActive = true
        
        vibroLabel.translatesAutoresizingMaskIntoConstraints = false
        vibroLabel.centerYAnchor.constraint(equalTo: vibroButton.centerYAnchor).isActive = true
        vibroLabel.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -30).isActive = true
    }
    
    
//MARK: - Configuration of UI
    
    private func configureUI() {
        soundButton.backgroundColor = .clear
        let buttonsImage: UIImage? = UserDefaultsManager.instance.isSound ? UIImage(named: "on") : UIImage(named: "off")
        soundButton.setImage(buttonsImage, for: .normal)
        soundButton.addTarget(self, action: #selector(soundButtonTapped), for: .touchUpInside)
        
        vibroButton.backgroundColor = .clear
        let image: UIImage? = UserDefaultsManager.instance.isVibro ? UIImage(named: "on") : UIImage(named: "off")
        vibroButton.setImage(image, for: .normal)
        vibroButton.addTarget(self, action: #selector(vibroButtonTapped), for: .touchUpInside)

        soundLabel.textColor = .violetFlower
        soundLabel.font = UIFont.custome(of: 32, .vagroundedmbold)
        soundLabel.text = "Sound"
        
        vibroLabel.textColor = .violetFlower
        vibroLabel.font = UIFont.custome(of: 32, .vagroundedmbold)
        vibroLabel.text = "Vibration"
    }
    
    
//MARK: - Buttons ations
    
    @objc private func soundButtonTapped() {
        UserDefaultsManager.instance.isSound.toggle()
        let buttonsImage: UIImage? = UserDefaultsManager.instance.isSound ? UIImage(named: "on") : UIImage(named: "off")
        soundButton.setImage(buttonsImage, for: .normal)
        createStandartFeedbackEffects()
    }
    
    @objc private func vibroButtonTapped() {
        UserDefaultsManager.instance.isVibro.toggle()
        let image: UIImage? = UserDefaultsManager.instance.isVibro ? UIImage(named: "on") : UIImage(named: "off")
        vibroButton.setImage(image, for: .normal)
        createStandartFeedbackEffects()
    }
    
    
//MARK: - Implemendation of sounds and vibros
                        
    private func createStandartFeedbackEffects() {
        SoundsManager.instance.basicSound(by: "lightHit")
        VibrationsManager.instance.craftBasicVibro()
    }
}
