import UIKit

//MARK: - Final class LocationDetailsView

final class LocationDetailsView: UIViewController {
    
    
//MARK: - Properties of class
    
    private var viewModel: LocationDetailsViewModelProtocol
    
    //the main struct views
    private let globalContainerView = UIView()
    private let topVisualEffectView = UIView()
    private let topContainerView = UIView()
    private let bottomContainerView = UIView()
    
    //topContainerView's subViews
    private let nameLocationLable = UILabel()
    private let assistentInfoView = UIView()
    private let imageCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    private var collectionViewLayout = UICollectionViewFlowLayout()
    private let favoriteButton = UIButton()
    
        //assistentInfoView's subViews
        private let gpsLable = UILabel()
        private let marksVerticalStackView = UIStackView()
    
        private let editButton = UIButton()
        private let ratingButton = UIButton()
        private let shareButton = UIButton()
        
        //marksCollectionView's subViews
        private let iconHorizontalStackView = UIStackView()
        private let titleHorizontalStackView = UIStackView()
        
        private let editIconImageView = UIImageView()
        private let ratingIconImageView = UIImageView()
        private let shareIconImageView = UIImageView()
        
        private let editTitleLabel = UILabel()
        private let ratingTitleLabel = UILabel()
        private let shareTitleLabel = UILabel()

    //bottomContainerView's subViews
    private let topSepatatorView = UIView()
    private let botSeparatorView = UIView()
    private let buttonsView = UIView()
    private let descriptionView = UIView()
    
        //descriptionView's subviews
        private let descriptionScrollView = UIScrollView()
        private let descriptionTitleLabel = UILabel()
        private let descriptionLabel = UILabel()
    
        //buttonsView's subviews
        private let moveButton = UIButton()
        private let deleteButton = UIButton()
    
    private var location = TheLocation() {
        didSet {
            setLocationData(for: location)
        }
    }
    
    private var images: [UIImage?] = [] {
        didSet {
            imageCollectionView.reloadData()
        }
    }
    
    
//MARK: - Initializators
    
    init(viewModel: LocationDetailsViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
//MARK: - Lifecycle of controller
    
    override func viewDidLoad() {
        super.viewDidLoad()
        appointmentExecutors()
        addSubViews()
        setConstraintes()
        configureUI()
        setButtonsTargets()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavigationBar()
        updateDataBinding()
        viewModel.getData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupCollectionViewFlowLoyaut()
    }
    
    
//MARK: - Configurations of Navigation bar

    private func configureNavigationBar() {
        title = "details"
        navigationController?.customColorsScheme()
    }
    
    
//MARK: - Add subviews to view
    
    private func addSubViews() {
        
        view.addSubview(globalContainerView)
        
        globalContainerView.addSubviews(views: topVisualEffectView, bottomContainerView)
        globalContainerView.sendSubviewToBack(bottomContainerView)
        topVisualEffectView.addSubview(topContainerView)
        
        bottomContainerView.addSubviews(views: topSepatatorView, botSeparatorView, buttonsView, descriptionView)
        topContainerView.addSubviews(views: nameLocationLable, favoriteButton, assistentInfoView, imageCollectionView)
        
        
        assistentInfoView.addSubviews(views: gpsLable, marksVerticalStackView, editButton, ratingButton, shareButton)
        marksVerticalStackView.addArrangedSubviews(views: iconHorizontalStackView, titleHorizontalStackView)
        
        iconHorizontalStackView.addArrangedSubviews(views: editIconImageView, ratingIconImageView, shareIconImageView)
        titleHorizontalStackView.addArrangedSubviews(views: editTitleLabel, ratingTitleLabel, shareTitleLabel)
        
        descriptionView.addSubviews(views: descriptionTitleLabel, descriptionScrollView)
        descriptionScrollView.addSubview(descriptionLabel)
        
        buttonsView.addSubviews(views: moveButton, deleteButton)
    }
    
    
//MARK: - Setting of constraintes
    
    private func setConstraintes() {
        
        //the Main struct views
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
        
        topContainerView.translatesAutoresizingMaskIntoConstraints = false
        topContainerView.topAnchor.constraint(equalTo: topVisualEffectView.topAnchor, constant: 17).isActive = true
        topContainerView.leadingAnchor.constraint(equalTo: topVisualEffectView.leadingAnchor, constant: 14).isActive = true
        topContainerView.trailingAnchor.constraint(equalTo: topVisualEffectView.trailingAnchor, constant: -14).isActive = true
        topContainerView.bottomAnchor.constraint(equalTo: topVisualEffectView.bottomAnchor, constant: -17).isActive = true
        
        bottomContainerView.translatesAutoresizingMaskIntoConstraints = false
        bottomContainerView.topAnchor.constraint(equalTo: topVisualEffectView.bottomAnchor, constant: -15).isActive = true
        bottomContainerView.leadingAnchor.constraint(equalTo: globalContainerView.leadingAnchor).isActive = true
        bottomContainerView.trailingAnchor.constraint(equalTo: globalContainerView.trailingAnchor).isActive = true
        bottomContainerView.bottomAnchor.constraint(equalTo: globalContainerView.bottomAnchor).isActive = true
        
        //topContainerView's subViews
        nameLocationLable.translatesAutoresizingMaskIntoConstraints = false
        nameLocationLable.topAnchor.constraint(equalTo: topContainerView.topAnchor, constant: 5).isActive = true
        nameLocationLable.leadingAnchor.constraint(equalTo: topContainerView.leadingAnchor).isActive = true
        nameLocationLable.trailingAnchor.constraint(equalTo: topContainerView.trailingAnchor).isActive = true
        nameLocationLable.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        assistentInfoView.translatesAutoresizingMaskIntoConstraints = false
        assistentInfoView.bottomAnchor.constraint(equalTo: topContainerView.bottomAnchor, constant: -5).isActive = true
        assistentInfoView.leadingAnchor.constraint(equalTo: topContainerView.leadingAnchor).isActive = true
        assistentInfoView.trailingAnchor.constraint(equalTo: topContainerView.trailingAnchor).isActive = true
        assistentInfoView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        imageCollectionView.translatesAutoresizingMaskIntoConstraints = false
        imageCollectionView.topAnchor.constraint(equalTo: nameLocationLable.bottomAnchor, constant: 12).isActive = true
        imageCollectionView.leadingAnchor.constraint(equalTo: topContainerView.leadingAnchor).isActive = true
        imageCollectionView.trailingAnchor.constraint(equalTo: topContainerView.trailingAnchor).isActive = true
        imageCollectionView.bottomAnchor.constraint(equalTo: assistentInfoView.topAnchor, constant: -12).isActive = true
        
        favoriteButton.translatesAutoresizingMaskIntoConstraints = false
        favoriteButton.centerYAnchor.constraint(equalTo: nameLocationLable.centerYAnchor).isActive = true
        favoriteButton.trailingAnchor.constraint(equalTo: nameLocationLable.trailingAnchor, constant: -5).isActive = true
        favoriteButton.heightAnchor.constraint(equalTo: nameLocationLable.heightAnchor).isActive = true
        favoriteButton.widthAnchor.constraint(equalTo: nameLocationLable.heightAnchor, multiplier: 1).isActive = true
        
        //assistentInfoView's subViews
        gpsLable.translatesAutoresizingMaskIntoConstraints = false
        gpsLable.centerYAnchor.constraint(equalTo: assistentInfoView.centerYAnchor).isActive = true
        gpsLable.leadingAnchor.constraint(equalTo: assistentInfoView.leadingAnchor).isActive = true
        gpsLable.widthAnchor.constraint(equalTo: assistentInfoView.widthAnchor, multiplier: 0.4).isActive = true
        gpsLable.heightAnchor.constraint(equalTo: assistentInfoView.heightAnchor).isActive = true
        
        marksVerticalStackView.translatesAutoresizingMaskIntoConstraints = false
        marksVerticalStackView.centerYAnchor.constraint(equalTo: assistentInfoView.centerYAnchor).isActive = true
        marksVerticalStackView.leadingAnchor.constraint(equalTo: gpsLable.trailingAnchor).isActive = true
        marksVerticalStackView.trailingAnchor.constraint(equalTo: assistentInfoView.trailingAnchor).isActive = true
        marksVerticalStackView.heightAnchor.constraint(equalTo: assistentInfoView.heightAnchor).isActive = true
        
        editButton.translatesAutoresizingMaskIntoConstraints = false
        editButton.leadingAnchor.constraint(equalTo: marksVerticalStackView.leadingAnchor).isActive = true
        editButton.heightAnchor.constraint(equalTo: marksVerticalStackView.heightAnchor).isActive = true
        editButton.widthAnchor.constraint(equalTo: marksVerticalStackView.widthAnchor, multiplier: 0.33).isActive = true
        
        shareButton.translatesAutoresizingMaskIntoConstraints = false
        shareButton.trailingAnchor.constraint(equalTo: marksVerticalStackView.trailingAnchor).isActive = true
        shareButton.heightAnchor.constraint(equalTo: marksVerticalStackView.heightAnchor).isActive = true
        shareButton.widthAnchor.constraint(equalTo: marksVerticalStackView.widthAnchor, multiplier: 0.33).isActive = true
        
        ratingButton.translatesAutoresizingMaskIntoConstraints = false
        ratingButton.leadingAnchor.constraint(equalTo: editButton.trailingAnchor).isActive = true
        ratingButton.trailingAnchor.constraint(equalTo: shareButton.leadingAnchor).isActive = true
        ratingButton.heightAnchor.constraint(equalTo: marksVerticalStackView.heightAnchor).isActive = true
                
        //bottomContainerView's subViews
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
        
        //descriptionView's subViews
        descriptionTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionTitleLabel.topAnchor.constraint(equalTo: descriptionView.topAnchor, constant: 5).isActive = true
        descriptionTitleLabel.leadingAnchor.constraint(equalTo: topSepatatorView.leadingAnchor).isActive = true
        descriptionTitleLabel.trailingAnchor.constraint(equalTo: topSepatatorView.trailingAnchor).isActive = true
        descriptionTitleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        descriptionScrollView.translatesAutoresizingMaskIntoConstraints = false
        descriptionScrollView.topAnchor.constraint(equalTo: descriptionTitleLabel.bottomAnchor, constant:  5).isActive = true
        descriptionScrollView.leadingAnchor.constraint(equalTo: descriptionView.leadingAnchor, constant:  5).isActive = true
        descriptionScrollView.trailingAnchor.constraint(equalTo: descriptionView.trailingAnchor, constant:  -5).isActive = true
        descriptionScrollView.bottomAnchor.constraint(equalTo: descriptionView.bottomAnchor, constant:  -5).isActive = true
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.topAnchor.constraint(equalTo: descriptionScrollView.topAnchor).isActive = true
        descriptionLabel.widthAnchor.constraint(equalTo: descriptionScrollView.widthAnchor, multiplier: 1).isActive = true
        descriptionLabel.bottomAnchor.constraint(equalTo: descriptionScrollView.bottomAnchor).isActive = true
        
        //buttonsView's subviews
        moveButton.translatesAutoresizingMaskIntoConstraints = false
        moveButton.leadingAnchor.constraint(equalTo: buttonsView.leadingAnchor, constant: 10).isActive = true
        moveButton.centerYAnchor.constraint(equalTo: buttonsView.centerYAnchor).isActive = true
        moveButton.widthAnchor.constraint(equalTo: buttonsView.widthAnchor, multiplier: 0.45).isActive = true
        moveButton.heightAnchor.constraint(equalTo: buttonsView.heightAnchor, multiplier: 0.6).isActive = true
        
        deleteButton.translatesAutoresizingMaskIntoConstraints = false
        deleteButton.trailingAnchor.constraint(equalTo: buttonsView.trailingAnchor, constant: -10).isActive = true
        deleteButton.centerYAnchor.constraint(equalTo: buttonsView.centerYAnchor).isActive = true
        deleteButton.widthAnchor.constraint(equalTo: buttonsView.widthAnchor, multiplier: 0.45).isActive = true
        deleteButton.heightAnchor.constraint(equalTo: buttonsView.heightAnchor, multiplier: 0.6).isActive = true
    }
    
    
//MARK: - Appointment of delegates and data sources
        
    private func appointmentExecutors() {
        imageCollectionView.register(DetailLocationCollectionViewCell.self, forCellWithReuseIdentifier: "DetailLocationCollectionViewCell")
        imageCollectionView.dataSource = self
        imageCollectionView.delegate = self
    }
        
        
//MARK: - Setup flow layouts fot collection view
        
    private func setupCollectionViewFlowLoyaut() {
        var width: CGFloat = 0
        var height: CGFloat = 0
        if images.count < 2 {
            width = imageCollectionView.frame.width
            height = imageCollectionView.frame.height
        } else {
            width = imageCollectionView.frame.width * 0.77
            height = imageCollectionView.frame.height * 0.9
        }
        collectionViewLayout.itemSize = CGSize(width: width, height: height)
        collectionViewLayout.scrollDirection = .horizontal
        collectionViewLayout.minimumLineSpacing = 5
        imageCollectionView.collectionViewLayout = collectionViewLayout
    }
    
    
//MARK: - Configuration of User Interface
    
    private func configureUI() {
        //global views
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
        
        topContainerView.backgroundColor = .backgroundCell
        topContainerView.layer.cornerRadius = 12
        topContainerView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        topContainerView.clipsToBounds = true
        
        //topContainerView's subViews
        nameLocationLable.backgroundColor = .clear
        nameLocationLable.font = UIFont(name: "Futura Bold", size: 24)
        nameLocationLable.textColor = .standartBlack
        nameLocationLable.shadowOffset = CGSize(width: 3, height: 3)
        nameLocationLable.shadowColor = .standartWhite
        nameLocationLable.textAlignment = .center
        nameLocationLable.numberOfLines = 1
        
        favoriteButton.setBackgroundImage(UIImage(systemName: "star"), for: .normal)
        favoriteButton.tintColor = .yellow
        
        imageCollectionView.backgroundColor = .clear

        gpsLable.backgroundColor = .clear
        gpsLable.font = UIFont(name: "Hoefler Text Black Italic", size: 17)
        gpsLable.textColor = .violetRose
        gpsLable.textAlignment = .left
        gpsLable.numberOfLines = 3
        
        marksVerticalStackView.axis = .vertical
        marksVerticalStackView.distribution = .fillProportionally
        
        iconHorizontalStackView.axis = .horizontal
        iconHorizontalStackView.distribution = .fillEqually
        
        titleHorizontalStackView.axis = .horizontal
        titleHorizontalStackView.distribution = .fillEqually
        
        //stackViews subViews
        editIconImageView.image = UIImage(systemName: "doc.richtext")
        editIconImageView.contentMode = .scaleAspectFit
        editIconImageView.tintColor = .violetRose
        
        ratingIconImageView.image = UIImage(systemName: "list.number")
        ratingIconImageView.contentMode = .scaleAspectFit
        ratingIconImageView.tintColor = .violetRose

        shareIconImageView.image = UIImage(systemName: "shared.with.you")
        shareIconImageView.contentMode = .scaleAspectFit
        shareIconImageView.tintColor = .violetRose
        
        editTitleLabel.font = .systemFont(ofSize: 15, weight: .bold)
        editTitleLabel.textAlignment = .center
        editTitleLabel.textColor = .violetRose
        editTitleLabel.text = "Edit"
        
        ratingTitleLabel.font = .systemFont(ofSize: 15, weight: .bold)
        ratingTitleLabel.textAlignment = .center
        ratingTitleLabel.textColor = .violetRose
        ratingTitleLabel.text = "Rating"
        
        shareTitleLabel.font = .systemFont(ofSize: 15, weight: .bold)
        shareTitleLabel.textAlignment = .center
        shareTitleLabel.textColor = .violetRose
        shareTitleLabel.text = "Share"
        
        //bottomContainerView's subViews
        topSepatatorView.backgroundColor = .violetFlower
        botSeparatorView.backgroundColor = .violetFlower
        
        buttonsView.backgroundColor = .backgroundCell
        buttonsView.layer.borderWidth = 3
        buttonsView.layer.borderColor = UIColor.violetFlower.cgColor
        buttonsView.layer.cornerRadius = 10
        buttonsView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        buttonsView.clipsToBounds = true
        
        descriptionView.backgroundColor = .backgroundLiteGray
        
        //descriptionView's subViews
        descriptionTitleLabel.backgroundColor = .clear
        descriptionTitleLabel.font = UIFont(name: "Futura Bold", size: 21)
        descriptionTitleLabel.textColor = .standartBlack
        descriptionTitleLabel.shadowOffset = CGSize(width: 3, height: 3)
        descriptionTitleLabel.shadowColor = .standartWhite
        descriptionTitleLabel.textAlignment = .center
        descriptionTitleLabel.numberOfLines = 1
        descriptionTitleLabel.text = "Description"
        
        descriptionScrollView.backgroundColor = .backgroundCellSupport
        
        descriptionLabel.textColor = .standartBlack
        descriptionLabel.font = UIFont.systemFont(ofSize: 14, weight: .black)
        descriptionLabel.numberOfLines = 0
        
        moveButton.backgroundColor = .backgroundCellSupport
        moveButton.setTitle("Move to", for: .normal)
        moveButton.setTitleColor(.itemSelected, for: .normal)
        moveButton.setTitleColor(.itemUnselected, for: .highlighted)
        moveButton.titleLabel?.font = UIFont(name: "Futura Bold", size: 18)
        moveButton.layer.cornerRadius = 10
        moveButton.layer.borderWidth = 1
        moveButton.layer.borderColor = UIColor.violetFlower.cgColor
        
        deleteButton.backgroundColor = .backgroundCellSupport
        deleteButton.setTitle("Delete", for: .normal)
        deleteButton.setTitleColor(.itemUnselected, for: .normal)
        deleteButton.setTitleColor(.itemSelected, for: .highlighted)
        deleteButton.titleLabel?.font = UIFont(name: "Futura Bold", size: 18)
        deleteButton.layer.cornerRadius = 10
        deleteButton.layer.borderWidth = 1
        deleteButton.layer.borderColor = UIColor.violetFlower.cgColor
    }
    
    
//MARK: - Targets for buttons
    
    private func setButtonsTargets() {
        favoriteButton.addTarget(self, action: #selector(favoriteTapped), for: .touchUpInside)
        editButton.addTarget(self, action: #selector(editTapped), for: .touchUpInside)
        ratingButton.addTarget(self, action: #selector(ratingTapped), for: .touchUpInside)
        shareButton.addTarget(self, action: #selector(shareTapped), for: .touchUpInside)
        moveButton.addTarget(self, action: #selector(moveButtonTapped), for: .touchUpInside)
    }
    
    
//MARK: - Actions
    
    @objc private func favoriteTapped() {
        createFeedbackEffects()
        favoriteButton.isSelected.toggle()
        if favoriteButton.isSelected {
            favoriteButton.setBackgroundImage(UIImage(systemName: "star.fill"), for: .normal)
        } else {
            favoriteButton.setBackgroundImage(UIImage(systemName: "star"), for: .normal)
        }
    }
    
    @objc private func editTapped() {
        createFeedbackEffects()
        print("Edit tapped")
    }
    
    @objc private func ratingTapped() {
        createFeedbackEffects()
        print("Rating tapped")
    }
    
    @objc private func shareTapped() {
        createFeedbackEffects()
        print("Share tapped")
    }
    
    @objc private func moveButtonTapped() {
        createFeedbackEffects()
        viewModel.moveToNavigationScreen()
    }
    
    
//MARK: - ViewModel's bindings
    
    private func updateDataBinding() {
        viewModel.updateData = { [weak self] location, images in
            self?.location = location
            self?.images = images
            self?.imageCollectionView.reloadData()
        }
    }
    
    
//MARK: - Set current data
    
    private func setLocationData(for location: TheLocation) {
        let name = location.locName ?? ""
        let longitude = String(format: "%.5f", location.locLongitude)
        let latitude = String(format: "%.5f", location.locLatitude)
        let description = location.locDescpiption
        
        nameLocationLable.text = name
        gpsLable.text = "GPS: \nlat: \(longitude), \nlong: \(latitude)"
        descriptionLabel.text = description
    }
    
    
//MARK: - Implemendation of sounds and vibros
            
    private func createFeedbackEffects() {
        SoundsManager.instance.basicSound(by: "tap")
        VibrationsManager.instance.craftBasicVibro()
    }
}


//MARK: - Extension for LocationDetailsView with CollectionView's protocols

extension LocationDetailsView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let itemCount = images.count
        return itemCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let image = images[indexPath.item]
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailLocationCollectionViewCell", for: indexPath) as? DetailLocationCollectionViewCell else { return UICollectionViewCell() }
        
        cell.addImage(image)
        return cell
    }
}
