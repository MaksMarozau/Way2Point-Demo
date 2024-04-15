import UIKit

//MARK: - Final class SaveTitleView

final class AddNewLocationView: UIViewController {
    
    
//MARK: - Properties of class
    
    private var viewModel: AddNewLocationViewModelProtocol
    
    private let contentScrollView = UIScrollView()
    
    private let imageContainerView = UIView()
    private let titleImageView = UIImageView()
    private let addImageButton = UIButton()
    private let collectionsBackgroundView = UIView()
    private let imagesCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    private let blurEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .light))
    
    private let descriptionContainerView = UIView()
    private let nameOfLocationTextField = UITextField()
    private let descriptionOfLocationTextView = UITextView()
    
    private let collectionViewLayout = UICollectionViewFlowLayout()
    
    private var imagesArray: [UIImage] = [] {
        didSet {
            self.imagesCollectionView.reloadData()
        }
    }
    
    
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
        appointmentExecutors()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavigationBar()
        addNotificationCenterObservers()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupFlowLoyaut()
        addImage()
        showNotificationsAlert()
        setHardLayers()
    }
    
    
//MARK: - Configurations of Navigation bar
    
    private func configureNavigationBar() {
        navigationItem.hidesBackButton = true
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Add new"
        
        let saveButton = UIBarButtonItem(systemItem: .save, primaryAction: UIAction(handler: { _ in
            self.createHardFeedbackEffects()
            let name = self.nameOfLocationTextField.text ?? ""
            let description = self.descriptionOfLocationTextView.text ?? ""
            self.viewModel.saveCurrentLocation(with: name, description)
        }))
        saveButton.tintColor = UIColor.violetRose
        saveButton.style = .done
        navigationController?.topViewController?.navigationItem.rightBarButtonItem = saveButton
        
        let closeButton = UIBarButtonItem(systemItem: .close, primaryAction: UIAction(handler: { _ in
            self.createStandartFeedbackEffects()
            UIView.animate(withDuration: 0.7) {
                self.view.alpha = 0
            } completion: { _ in
                self.viewModel.closePage()
            }
        }))
        closeButton.tintColor = UIColor.violetRose
        closeButton.style = .done
        navigationController?.topViewController?.navigationItem.leftBarButtonItem = closeButton
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
        
        descriptionContainerView.backgroundColor = .backgroundCell
        descriptionContainerView.layer.cornerRadius = 10
        descriptionContainerView.layer.borderWidth = 3
        descriptionContainerView.layer.borderColor = UIColor.violetFlower.cgColor
        
        //imageContainerView's subviews
        titleImageView.backgroundColor = .backgroundBar
        titleImageView.contentMode = .scaleAspectFill
        titleImageView.layer.cornerRadius = 10
        titleImageView.clipsToBounds = true
        
        addImageButton.backgroundColor = .clear
        addImageButton.setBackgroundImage(UIImage(systemName: "plus"), for: .normal)
        addImageButton.tintColor = .itemUnselected
        addImageButton.addTarget(self, action: #selector(addImageTapped), for: .touchUpInside)
        
        collectionsBackgroundView.backgroundColor = .clear
        collectionsBackgroundView.layer.cornerRadius = 10
        collectionsBackgroundView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        collectionsBackgroundView.clipsToBounds = true
        
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        imagesCollectionView.backgroundColor = .clear
        
        //descriptionContainerView's subviews
        nameOfLocationTextField.backgroundColor = .backgroundCellSupport
        nameOfLocationTextField.layer.borderWidth = 1
        nameOfLocationTextField.layer.borderColor = UIColor.violetFlower.cgColor
        nameOfLocationTextField.textAlignment = .center
        nameOfLocationTextField.borderStyle = .line
        nameOfLocationTextField.textColor = .standartBlack
        nameOfLocationTextField.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        nameOfLocationTextField.placeholder = "Enter the name of location, please"
        nameOfLocationTextField.isUserInteractionEnabled = true
        
        descriptionOfLocationTextView.backgroundColor = .backgroundCellSupport
        descriptionOfLocationTextView.layer.borderWidth = 1
        descriptionOfLocationTextView.layer.borderColor = UIColor.violetFlower.cgColor
        descriptionOfLocationTextView.text = "Enter the description of location, please"
        descriptionOfLocationTextView.textColor = .placeholderText
        descriptionOfLocationTextView.font = UIFont.systemFont(ofSize: 17)
        descriptionOfLocationTextView.textAlignment = .center
        descriptionOfLocationTextView.isUserInteractionEnabled = true
    }
    
    
//MARK: - Setting of hard shadows and animations
    
    private func setHardLayers() {
        let imageShadowPath = UIBezierPath(rect: imageContainerView.bounds)
        imageContainerView.layer.shadowPath = imageShadowPath.cgPath
        
        let descriptionShadowPath = UIBezierPath(rect: descriptionContainerView.bounds)
        descriptionContainerView.layer.shadowPath = descriptionShadowPath.cgPath
        
        imageContainerView.layer.shadowColor = UIColor.violetRose.cgColor
        imageContainerView.layer.shadowOffset = CGSize(width: 5, height: 5)
        imageContainerView.layer.shadowOpacity = 0.6
        imageContainerView.layer.shadowRadius = 10
        
        descriptionContainerView.layer.shadowColor = UIColor.violetRose.cgColor
        descriptionContainerView.layer.shadowOffset = CGSize(width: 5, height: 5)
        descriptionContainerView.layer.shadowOpacity = 0.6
        descriptionContainerView.layer.shadowRadius = 10
    }
    
    
//MARK: - Appointment of delegates and data sources
    
    private func appointmentExecutors() {
        imagesCollectionView.register(AddNewLocationCollectionViewCell.self, forCellWithReuseIdentifier: "AddNewLocationCollectionViewCell")
        imagesCollectionView.dataSource = self
        imagesCollectionView.delegate = self
        
        nameOfLocationTextField.delegate = self
        descriptionOfLocationTextView.delegate = self
    }
    
    
//MARK: - Setup flow layouts fot collection view
    
    private func setupFlowLoyaut() {
        let width = imagesCollectionView.frame.width * 0.35
        let height = imagesCollectionView.frame.height
        collectionViewLayout.itemSize = CGSize(width: width, height: height)
        collectionViewLayout.scrollDirection = .horizontal
        collectionViewLayout.minimumLineSpacing = 7
        imagesCollectionView.collectionViewLayout = collectionViewLayout
    }
    
    
//MARK: - Adding of observers from the Notification center
    
    private func addNotificationCenterObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    
//MARK: - Actions
    
    @objc private func addImageTapped() {
        viewModel.addNewImage(to: self)
    }
    
    @objc private func keyboardShow(_ sender: Notification) {
        if let keyboardFrame = sender.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHight = keyboardRectangle.height
            if view.frame.origin.y == 0 {
                view.frame.origin.y -= (keyboardHight + 12)
                
                UIView.animate(withDuration: 0.3) {
                    self.view.layoutIfNeeded()
                }
            }
        }
    }
    
    @objc private func keyboardHide() {
        if view.frame.origin.y != 0 {
            view.frame.origin.y = 0
            
            UIView.animate(withDuration: 0.3) {
                self.view.layoutIfNeeded()
            }
        }
    }
    
    
//MARK: - Implementation of viewModel bindings
    
    private func addImage() {
        viewModel.addImage = { [weak self] image in
            self?.imagesArray.append(image)
            self?.titleImageView.image = self?.imagesArray.last
        }
    }
    
    private func showNotificationsAlert() {
        viewModel.showNotificationsAlert = { [weak self] alert in
            self?.present(alert, animated: true)
        }
    }
    
    
//MARK: - Implemendation of sounds and vibros
                    
    private func createHardFeedbackEffects() {
        SoundsManager.instance.basicSound(by: "hardTap")
        VibrationsManager.instance.craftBasicVibro()
    }
    
    private func createStandartFeedbackEffects() {
        SoundsManager.instance.basicSound(by: "tap")
        VibrationsManager.instance.craftBasicVibro()
    }
}


//MARK: - Extension for class AddNewLocationView with UITextField's delegate protocol

extension AddNewLocationView: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameOfLocationTextField.resignFirstResponder()
        return true
    }
}


//MARK: - Extension for class AddNewLocationView with UITextView's delegate protocol to put / put away a placeholder

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
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if (text == "\n") {
            descriptionOfLocationTextView.resignFirstResponder()
            return false
        }
        return true
    }
}


//MARK: - Extension for AddNewLocationView to expand with UICollectionView's protocols

extension AddNewLocationView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagesArray.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let image = imagesArray[indexPath.item]
        
        guard let cell = imagesCollectionView.dequeueReusableCell(withReuseIdentifier: "AddNewLocationCollectionViewCell", for: indexPath) as? AddNewLocationCollectionViewCell else { return UICollectionViewCell() }
        
        cell.backgroundColor = .clear
        cell.addImage(image)
        
        return cell
    }
}
