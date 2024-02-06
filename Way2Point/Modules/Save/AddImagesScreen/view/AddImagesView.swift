import UIKit

//MARK: - Final class SaveView

final class AddImagesView: UIViewController {
    
    
//MARK: - Properties of class
    
    private let imageContainerView = UIView()
    private let titleImageView = UIImageView()
    private let addImageButton = UIButton()
    private let collectionsBackgroundView = UIView()
    private let imagesCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    private let blurEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .extraLight))
    
    
    
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
    }
    
    
    
//MARK: - Add subviews
    
    private func addSubviews() {
        
        view.addSubviews(views: imageContainerView)
        
        imageContainerView.addSubviews(views: titleImageView, addImageButton, collectionsBackgroundView)
        imageContainerView.bringSubviewToFront(addImageButton)
        collectionsBackgroundView.addSubviews(views: blurEffectView, imagesCollectionView)
    }
    
    
    
//MARK: - Setting of constraintes
    
    private func setConstraintes() {
        
        imageContainerView.translatesAutoresizingMaskIntoConstraints = false
        imageContainerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 33).isActive = true
        imageContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageContainerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        imageContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        imageContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.35).isActive = true
        
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
    }
    
    
    
//MARK: - Actions
    
    @objc private func addImageTapped() {
        
        print("AddImageTapp!")
    }
}
