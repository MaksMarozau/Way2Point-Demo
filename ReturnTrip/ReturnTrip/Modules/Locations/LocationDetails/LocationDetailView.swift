import UIKit

//MARK: - Protocol for extention MainScreenView with MVP-archetecture's methods

protocol LocationDetailViewInputProtocol: AnyObject {
    
}



//MARK: - Final class MainScreenView

final class LocationDetailView: UIViewController {
    
    
//MARK: - Properties of class
    
    private let globalContainerView = UIView()
    
    private let topVisualEffectView = UIView()
    private let topContainerView = UIView()
    private let bottomContainerView = UIView()
    
    private let topSepatatorView = UIView()
    private let botSeparatorView = UIView()
    private let buttonsView = UIView()
    private let descriptionView = UIView()
    
    private let descriptionScrollView = UIScrollView()
    private let descriptionLabel = UILabel()
    
    
    
    
    
    
//MARK: - Lifecycle of controller
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubViews()
        setConstraintes()
        configureUI()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //            configureNavigationBar()
    }
    
    
    
//MARK: - Configurations of Navigation bar

    private func configureNavigationBar() {
        
        
    }
    
   
    
//MARK: - Add subviews to view
    
    private func addSubViews() {
        
        view.addSubview(globalContainerView)
        
        globalContainerView.addSubviews(views: topVisualEffectView, bottomContainerView, buttonsView)
        globalContainerView.sendSubviewToBack(bottomContainerView)
        globalContainerView.bringSubviewToFront(buttonsView)
        
        topVisualEffectView.addSubview(topContainerView)

        bottomContainerView.addSubviews(views: topSepatatorView, botSeparatorView, descriptionView)
        
        descriptionView.addSubview(descriptionScrollView)
        descriptionScrollView.addSubview(descriptionLabel)
    }
    
    
    
//MARK: - Setting of constraintes
    
    private func setConstraintes() {
        
        globalContainerView.translatesAutoresizingMaskIntoConstraints = false
        globalContainerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 12).isActive = true
        globalContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12).isActive = true
        globalContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12).isActive = true
        globalContainerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -12).isActive = true
        
        
        topVisualEffectView.translatesAutoresizingMaskIntoConstraints = false
        topVisualEffectView.topAnchor.constraint(equalTo: globalContainerView.topAnchor).isActive = true
        topVisualEffectView.leadingAnchor.constraint(equalTo: globalContainerView.leadingAnchor, constant: 3).isActive = true
        topVisualEffectView.trailingAnchor.constraint(equalTo: globalContainerView.trailingAnchor, constant: -3).isActive = true
        topVisualEffectView.heightAnchor.constraint(equalTo: globalContainerView.heightAnchor, multiplier: 0.6).isActive = true
        
        bottomContainerView.translatesAutoresizingMaskIntoConstraints = false
        bottomContainerView.topAnchor.constraint(equalTo: topVisualEffectView.bottomAnchor, constant: -15).isActive = true
        bottomContainerView.leadingAnchor.constraint(equalTo: globalContainerView.leadingAnchor).isActive = true
        bottomContainerView.trailingAnchor.constraint(equalTo: globalContainerView.trailingAnchor).isActive = true
        bottomContainerView.bottomAnchor.constraint(equalTo: globalContainerView.bottomAnchor).isActive = true
        
        
        
        topContainerView.translatesAutoresizingMaskIntoConstraints = false
        topContainerView.topAnchor.constraint(equalTo: topVisualEffectView.topAnchor, constant: 17).isActive = true
        topContainerView.leadingAnchor.constraint(equalTo: topVisualEffectView.leadingAnchor, constant: 14).isActive = true
        topContainerView.trailingAnchor.constraint(equalTo: topVisualEffectView.trailingAnchor, constant: -14).isActive = true
        topContainerView.bottomAnchor.constraint(equalTo: topVisualEffectView.bottomAnchor, constant: -17).isActive = true
        
        
        topSepatatorView.translatesAutoresizingMaskIntoConstraints = false
        topSepatatorView.topAnchor.constraint(equalTo: topVisualEffectView.bottomAnchor, constant: 5).isActive = true
        topSepatatorView.leadingAnchor.constraint(equalTo: bottomContainerView.leadingAnchor, constant: 12).isActive = true
        topSepatatorView.trailingAnchor.constraint(equalTo: bottomContainerView.trailingAnchor, constant: -12).isActive = true
        topSepatatorView.heightAnchor.constraint(equalToConstant: 2).isActive = true
        
        botSeparatorView.translatesAutoresizingMaskIntoConstraints = false
        botSeparatorView.bottomAnchor.constraint(equalTo: bottomContainerView.bottomAnchor, constant: -80).isActive = true
        botSeparatorView.leadingAnchor.constraint(equalTo: bottomContainerView.leadingAnchor, constant: 12).isActive = true
        botSeparatorView.trailingAnchor.constraint(equalTo: bottomContainerView.trailingAnchor, constant: -12).isActive = true
        botSeparatorView.heightAnchor.constraint(equalToConstant: 2).isActive = true
        
        buttonsView.translatesAutoresizingMaskIntoConstraints = false
        buttonsView.topAnchor.constraint(equalTo: botSeparatorView.bottomAnchor, constant: 5).isActive = true
        buttonsView.leadingAnchor.constraint(equalTo: bottomContainerView.leadingAnchor, constant: 12).isActive = true
        buttonsView.trailingAnchor.constraint(equalTo: bottomContainerView.trailingAnchor, constant: -12).isActive = true
        buttonsView.bottomAnchor.constraint(equalTo: bottomContainerView.bottomAnchor).isActive = true
        
        descriptionView.translatesAutoresizingMaskIntoConstraints = false
        descriptionView.topAnchor.constraint(equalTo: topSepatatorView.bottomAnchor).isActive = true
        descriptionView.leadingAnchor.constraint(equalTo: topSepatatorView.leadingAnchor).isActive = true
        descriptionView.trailingAnchor.constraint(equalTo: topSepatatorView.trailingAnchor).isActive = true
        descriptionView.bottomAnchor.constraint(equalTo: botSeparatorView.topAnchor).isActive = true
        
        
        descriptionScrollView.translatesAutoresizingMaskIntoConstraints = false
        descriptionScrollView.topAnchor.constraint(equalTo: descriptionView.topAnchor, constant:  5).isActive = true
        descriptionScrollView.leadingAnchor.constraint(equalTo: descriptionView.leadingAnchor, constant:  5).isActive = true
        descriptionScrollView.trailingAnchor.constraint(equalTo: descriptionView.trailingAnchor, constant:  -5).isActive = true
        descriptionScrollView.bottomAnchor.constraint(equalTo: descriptionView.bottomAnchor, constant:  -5).isActive = true
        
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.topAnchor.constraint(equalTo: descriptionScrollView.topAnchor).isActive = true
        descriptionLabel.widthAnchor.constraint(equalTo: descriptionScrollView.widthAnchor, multiplier: 1).isActive = true
        descriptionLabel.bottomAnchor.constraint(equalTo: descriptionScrollView.bottomAnchor).isActive = true
    }
    
    
    
//MARK: - Configuration of User Interface
    
    private func configureUI() {
        
        view.backgroundColor = .backgroundView
        
        globalContainerView.backgroundColor = .black
        globalContainerView.layer.borderWidth = 3
        globalContainerView.layer.borderColor = UIColor.violetFlower.cgColor
        globalContainerView.layer.cornerRadius = 10
        globalContainerView.clipsToBounds = true
        
        topVisualEffectView.backgroundColor = .backgroundCell
        topVisualEffectView.layer.borderWidth = 3
        topVisualEffectView.layer.borderColor = UIColor.violetFlower.cgColor
        topVisualEffectView.layer.cornerRadius = 12
        topVisualEffectView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        topVisualEffectView.clipsToBounds = true
        
        bottomContainerView.backgroundColor = .backgroundLiteGray
//        bottomContainerView.layer.borderWidth = 12
//        bottomContainerView.layer.borderColor = UIColor.violetFlower.cgColor
        
        
        topContainerView.backgroundColor = .backgroundCell
        topContainerView.layer.cornerRadius = 12
        topContainerView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        topContainerView.clipsToBounds = true
        
        
        
        topSepatatorView.backgroundColor = .violetFlower
        botSeparatorView.backgroundColor = .violetFlower
        
        buttonsView.backgroundColor = .backgroundCell
        buttonsView.layer.borderWidth = 3
        buttonsView.layer.borderColor = UIColor.violetFlower.cgColor
        buttonsView.layer.cornerRadius = 10
        buttonsView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        buttonsView.clipsToBounds = true
        
        descriptionView.backgroundColor = .backgroundCellSupport
        descriptionScrollView.backgroundColor = .clear
        
        descriptionLabel.textColor = .standartBlack
        descriptionLabel.font = UIFont.systemFont(ofSize: 14, weight: .black)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.text = "SomeText __ SomeText __ SomeText __ SomeText __ SomeText __ SomeText __ SomeText __ SomeText __ SomeText __ SomeText __ SomeText __ SomeText __ SomeText __ SomeText __ SomeText __ SomeText __ SomeText __ SomeText __ SomeText __ SomeText __ SomeText __ SomeText __ SomeText __ SomeText __ SomeText __ SomeText __ SomeText __ SomeText __ SomeText __ SomeText __ SomeText __ SomeText __ SomeText __ SomeText __ SomeText __ SomeText __ SomeText __ SomeText __ SomeText __ SomeText __ SomeText __ SomeText __ SomeText __ SomeText __ SomeText __ SomeText __ SomeText __ SomeText __ SomeText __ SomeText __ SomeText __ SomeText __ SomeText __ SomeText __ SomeText __ SomeText __ "
    }
    
    
    
//MARK: - Works out before view will start
    
    private func viewWillStart() {
        
    }
}



//MARK: - Extention Extention for MainScreenView with protocol MainScreenViewInputProtocol

//    extension MainScreenView: MainScreenViewInputProtocol {
    
//    }
