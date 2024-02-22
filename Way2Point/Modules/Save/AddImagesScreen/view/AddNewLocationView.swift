import UIKit

//MARK: - Final class SaveTitleView

final class AddNewLocationView: UIViewController {
    
    
//MARK: - Properties of class
    
    private let viewModel: AddNewLocationViewModelProtocol
    
    private let imageContainerView = UIView()
    private let titleImageView = UIImageView()
    private let addImageButton = UIButton()
    private let collectionsBackgroundView = UIView()
    private let imagesCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    private let blurEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .extraLight))
    
    private let descriptionContainerView = UIView()
    private let nameOfLocationTextField = UITextField()
    private let descriptionOfLocationTextView = UITextView()
    
    
    
//MARK: - Initializator
    
    init(viewModel: AddNewLocationViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
//MARK: - Lifecycle of controller
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews()
        setConstraintes()
        configureUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        configureNavigationBar()
    }
    
    
    
//MARK: - Configurations of Navigation bar
    
    private func configureNavigationBar() {
        
        navigationItem.hidesBackButton = true
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Add new"
        
        let saveButton = UIBarButtonItem(systemItem: .save, primaryAction: UIAction(handler: { _ in
            
        }))
        
        saveButton.tintColor = UIColor.violetRose
        saveButton.style = .done
        navigationController?.topViewController?.navigationItem.rightBarButtonItem = saveButton
        
        navigationController?.topViewController?.navigationItem.leftBarButtonItem = UIBarButtonItem(systemItem: .close, primaryAction: UIAction(handler: { _ in
            
        }))
    }
    
    
    
//MARK: - Add subviews
    
    private func addSubviews() {
        
        view.addSubviews(views: imageContainerView, descriptionContainerView)
        
        imageContainerView.addSubviews(views: titleImageView, addImageButton, collectionsBackgroundView)
        imageContainerView.bringSubviewToFront(addImageButton)
        collectionsBackgroundView.addSubviews(views: blurEffectView, imagesCollectionView)
        
        descriptionContainerView.addSubviews(views: nameOfLocationTextField, descriptionOfLocationTextView)
    }
    
    
    
//MARK: - Setting of constraintes
    
    private func setConstraintes() {
        
        imageContainerView.translatesAutoresizingMaskIntoConstraints = false
        imageContainerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 33).isActive = true
        imageContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        imageContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.35).isActive = true
        
        descriptionContainerView.translatesAutoresizingMaskIntoConstraints = false
        descriptionContainerView.topAnchor.constraint(equalTo: imageContainerView.bottomAnchor, constant: 33).isActive = true
        descriptionContainerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -33).isActive = true
        descriptionContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        descriptionContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        
        
        //imageContainerView's subviews
        titleImageView.translatesAutoresizingMaskIntoConstraints = false
        titleImageView.topAnchor.constraint(equalTo: imageContainerView.topAnchor).isActive = true
        titleImageView.centerXAnchor.constraint(equalTo: imageContainerView.centerXAnchor).isActive = true
        titleImageView.centerYAnchor.constraint(equalTo: imageContainerView.centerYAnchor).isActive = true
        titleImageView.widthAnchor.constraint(equalTo: imageContainerView.widthAnchor).isActive = true
        titleImageView.heightAnchor.constraint(equalTo: imageContainerView.heightAnchor).isActive = true
        
        addImageButton.translatesAutoresizingMaskIntoConstraints = false
        addImageButton.topAnchor.constraint(equalTo: imageContainerView.topAnchor, constant: 12).isActive = true
        addImageButton.trailingAnchor.constraint(equalTo: imageContainerView.trailingAnchor, constant: -12).isActive = true
        addImageButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        addImageButton.widthAnchor.constraint(equalToConstant: 45).isActive = true
        
        collectionsBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        collectionsBackgroundView.bottomAnchor.constraint(equalTo: imageContainerView.bottomAnchor).isActive = true
        collectionsBackgroundView.leadingAnchor.constraint(equalTo: imageContainerView.leadingAnchor).isActive = true
        collectionsBackgroundView.trailingAnchor.constraint(equalTo: imageContainerView.trailingAnchor).isActive = true
        collectionsBackgroundView.heightAnchor.constraint(equalTo: imageContainerView.heightAnchor, multiplier: 0.40).isActive = true
        
        blurEffectView.frame = collectionsBackgroundView.bounds
        
        imagesCollectionView.translatesAutoresizingMaskIntoConstraints = false
        imagesCollectionView.topAnchor.constraint(equalTo: collectionsBackgroundView.topAnchor, constant: 8).isActive = true
        imagesCollectionView.bottomAnchor.constraint(equalTo: collectionsBackgroundView.bottomAnchor, constant: -9).isActive = true
        imagesCollectionView.leadingAnchor.constraint(equalTo: collectionsBackgroundView.leadingAnchor, constant: 9).isActive = true
        imagesCollectionView.trailingAnchor.constraint(equalTo: collectionsBackgroundView.trailingAnchor, constant: -9).isActive = true
        
        
        //descriptionContainerView's subviews
        nameOfLocationTextField.translatesAutoresizingMaskIntoConstraints = false
        nameOfLocationTextField.topAnchor.constraint(equalTo: descriptionContainerView.topAnchor, constant: 9).isActive = true
        nameOfLocationTextField.leadingAnchor.constraint(equalTo: descriptionContainerView.leadingAnchor, constant: 9).isActive = true
        nameOfLocationTextField.trailingAnchor.constraint(equalTo: descriptionContainerView.trailingAnchor, constant: -9).isActive = true
        nameOfLocationTextField.heightAnchor.constraint(equalTo: descriptionContainerView.heightAnchor, multiplier: 0.18).isActive = true

        descriptionOfLocationTextView.translatesAutoresizingMaskIntoConstraints = false
        descriptionOfLocationTextView.topAnchor.constraint(equalTo: nameOfLocationTextField.bottomAnchor, constant: 9).isActive = true
        descriptionOfLocationTextView.leadingAnchor.constraint(equalTo: descriptionContainerView.leadingAnchor, constant: 9).isActive = true
        descriptionOfLocationTextView.trailingAnchor.constraint(equalTo: descriptionContainerView.trailingAnchor, constant: -9).isActive = true
        descriptionOfLocationTextView.bottomAnchor.constraint(equalTo: descriptionContainerView.bottomAnchor, constant: -9).isActive = true
    }
    
    
    
//MARK: - Configuration of User Interface
    
    private func configureUI() {
        
        imageContainerView.backgroundColor = .clear
        imageContainerView.layer.cornerRadius = 10
        imageContainerView.layer.borderWidth = 3
        imageContainerView.layer.borderColor = UIColor.violetFlower.cgColor
        imageContainerView.layer.shadowColor = UIColor.violetRose.cgColor
        imageContainerView.layer.shadowOffset = CGSize(width: 3, height: 3)
        imageContainerView.layer.shadowOpacity = 0.5
        imageContainerView.layer.shadowRadius = 8
        
        descriptionContainerView.backgroundColor = .backgroundCell
        descriptionContainerView.layer.cornerRadius = 10
        descriptionContainerView.layer.borderWidth = 3
        descriptionContainerView.layer.borderColor = UIColor.violetFlower.cgColor
        descriptionContainerView.layer.shadowColor = UIColor.violetRose.cgColor
        descriptionContainerView.layer.shadowOffset = CGSize(width: 3, height: 3)
        descriptionContainerView.layer.shadowOpacity = 0.5
        descriptionContainerView.layer.shadowRadius = 8
        
        
        //imageContainerView's subviews
        titleImageView.backgroundColor = .backgroundBar
        titleImageView.layer.cornerRadius = 10
        
        addImageButton.backgroundColor = .clear
        addImageButton.setBackgroundImage(UIImage(systemName: "plus"), for: .normal)
        addImageButton.tintColor = .itemUnselected
        addImageButton.addTarget(self, action: #selector(addImageTapped), for: .touchUpInside)
        
        collectionsBackgroundView.layer.cornerRadius = 10
        collectionsBackgroundView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        collectionsBackgroundView.clipsToBounds = true
        
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        imagesCollectionView.backgroundColor = .backgroundCell
        imagesCollectionView.layer.borderWidth = 1
        imagesCollectionView.layer.borderColor = UIColor.violetFlower.cgColor
        
        
        //descriptionContainerView's subviews
        nameOfLocationTextField.backgroundColor = .backgroundCellSupport
        nameOfLocationTextField.layer.borderWidth = 1
        nameOfLocationTextField.layer.borderColor = UIColor.violetFlower.cgColor
        nameOfLocationTextField.textAlignment = .center
        nameOfLocationTextField.borderStyle = .line
        nameOfLocationTextField.textColor = .standartBlack
        nameOfLocationTextField.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        nameOfLocationTextField.placeholder = "Enter the name of location, please"
        
        descriptionOfLocationTextView.backgroundColor = .backgroundCellSupport
        descriptionOfLocationTextView.layer.borderWidth = 1
        descriptionOfLocationTextView.layer.borderColor = UIColor.violetFlower.cgColor
        descriptionOfLocationTextView.delegate = self
        descriptionOfLocationTextView.text = "Enter the description of location, please"
        descriptionOfLocationTextView.textColor = .placeholderText
        descriptionOfLocationTextView.font = UIFont.systemFont(ofSize: 17)
        descriptionOfLocationTextView.textAlignment = .center
    }
    
    
    
//MARK: - Actions
    
    @objc private func addImageTapped() {
        
        print("AddImageTapp!")
    }
}



//MARK: - Extension for class AddNewLocationView with UITextView's delegate protocol to put/put away a placeholder

extension AddNewLocationView: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if descriptionOfLocationTextView.text == "Enter the description of location, please" {
            descriptionOfLocationTextView.text = nil
            descriptionOfLocationTextView.textColor = .standartBlack
            descriptionOfLocationTextView.textAlignment = .left
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if descriptionOfLocationTextView.text.isEmpty {
            descriptionOfLocationTextView.text = "Enter the description of location, please"
            descriptionOfLocationTextView.textColor = .lightGray
            descriptionOfLocationTextView.textAlignment = .center
        }
    }
}
