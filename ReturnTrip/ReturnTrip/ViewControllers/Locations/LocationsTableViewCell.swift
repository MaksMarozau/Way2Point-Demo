import UIKit

//MARK: - Final class LocationsTableViewCell

class LocationsTableViewCell: UITableViewCell {
    
    
//MARK: - Properties of class
    
    //MARK: - Properties for UI creating
    
    //global views
    private let markedVisualEffectView = UIView()
    private let globalVisualEffectView = UIView()
    private let globalContainerView = UIView()
    
    //struct SubViews
    private let topView = UIView()
    private let photosVisualEffectView = UIView()
    private let photosCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    private let sepparatorView = UIView()
    private let descriptionView = UIView()
    
    //topView's SubViews
    private let topStackView = UIStackView()
    private let topButton = UIButton()
    private let numberLabel = UILabel()
    
    //descriptionView's SubViews
    private let descriptionLabel = UILabel()
    private let openDescriptionButton = UIButton()
    
    //topStackView's SubViews
    private let nameLable = UILabel()
    private let gpsOfLocationsLabel = UILabel()
    
    
    
    //MARK: - Supporting properties
    
    var openCloseDescriptionSupport: (() -> ())?
    
    
    
//MARK: - Initializations
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubViews()
        setConstraintes()
        configureUI()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
//MARK: - Adding of subViews
    
    private func addSubViews() {
        
        contentView.addSubviews(views: markedVisualEffectView, globalVisualEffectView, globalContainerView)
        
        globalContainerView.addSubviews(views: topView, photosVisualEffectView, photosCollectionView, sepparatorView, descriptionView)
        
        topView.addSubviews(views: topButton, topStackView, numberLabel)
        descriptionView.addSubviews(views: descriptionLabel, openDescriptionButton)
        
        topStackView.addArrangedSubviews(views: nameLable, gpsOfLocationsLabel)
    }
    
    
    
//MARK: - Constraintes
    
    private func setConstraintes() {
        
        //contentView SubViews constraintes:
        //markedVisualEffectView
        markedVisualEffectView.translatesAutoresizingMaskIntoConstraints = false
        markedVisualEffectView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        markedVisualEffectView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        markedVisualEffectView.widthAnchor.constraint(equalToConstant: 55).isActive = true
        markedVisualEffectView.heightAnchor.constraint(equalToConstant: 55).isActive = true
//        markedVisualEffectView.isHidden = true
        
        
        //globalVisualEffectView
        globalVisualEffectView.translatesAutoresizingMaskIntoConstraints = false
        globalVisualEffectView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15).isActive = true
        globalVisualEffectView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        globalVisualEffectView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        globalVisualEffectView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        
        //globalContainerView
        globalContainerView.translatesAutoresizingMaskIntoConstraints = false
        globalContainerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 17).isActive = true
        globalContainerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        globalContainerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        globalContainerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        

        
        //globalContainerView's subViews constraintes:
        //topView
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.topAnchor.constraint(equalTo: globalContainerView.topAnchor, constant: 5).isActive = true
        topView.leadingAnchor.constraint(equalTo: globalContainerView.leadingAnchor, constant: 12).isActive = true
        topView.trailingAnchor.constraint(equalTo: globalContainerView.trailingAnchor, constant: -12).isActive = true
        topView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
 
        //photosVisualEffectView
        photosVisualEffectView.translatesAutoresizingMaskIntoConstraints = false
        photosVisualEffectView.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 5).isActive = true
        photosVisualEffectView.leadingAnchor.constraint(equalTo: globalContainerView.leadingAnchor, constant: 10).isActive = true
        photosVisualEffectView.trailingAnchor.constraint(equalTo: globalContainerView.trailingAnchor).isActive = true
        photosVisualEffectView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        
        //photosCollectionView
        photosCollectionView.translatesAutoresizingMaskIntoConstraints = false
        photosCollectionView.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 7).isActive = true
        photosCollectionView.leadingAnchor.constraint(equalTo: globalContainerView.leadingAnchor, constant: 14).isActive = true
        photosCollectionView.trailingAnchor.constraint(equalTo: globalContainerView.trailingAnchor).isActive = true
        photosCollectionView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        
        //sepparatorView
        sepparatorView.translatesAutoresizingMaskIntoConstraints = false
        sepparatorView.topAnchor.constraint(equalTo: photosCollectionView.bottomAnchor,constant: 5).isActive = true
        sepparatorView.widthAnchor.constraint(equalTo: globalContainerView.widthAnchor).isActive = true
        sepparatorView.heightAnchor.constraint(equalToConstant: 3).isActive = true
        

        //descriptionView
        descriptionView.translatesAutoresizingMaskIntoConstraints = false
        descriptionView.topAnchor.constraint(equalTo: sepparatorView.bottomAnchor).isActive = true
        descriptionView.leadingAnchor.constraint(equalTo: globalContainerView.leadingAnchor).isActive = true
        descriptionView.trailingAnchor.constraint(equalTo: globalContainerView.trailingAnchor).isActive = true
        descriptionView.bottomAnchor.constraint(equalTo: globalContainerView.bottomAnchor).isActive = true
        descriptionView.heightAnchor.constraint(greaterThanOrEqualToConstant: 60).isActive = true
        
        
        
        //topView's subViews constraintes:
        //topStackView
        topStackView.translatesAutoresizingMaskIntoConstraints = false
        topStackView.centerXAnchor.constraint(equalTo: topView.centerXAnchor).isActive = true
        topStackView.centerYAnchor.constraint(equalTo: topView.centerYAnchor).isActive = true
        topStackView.heightAnchor.constraint(equalTo: topView.heightAnchor, multiplier: 1).isActive = true
        topStackView.widthAnchor.constraint(equalTo: topView.widthAnchor, multiplier: 0.7).isActive = true
        
        
        //topbutton
        topButton.translatesAutoresizingMaskIntoConstraints = false
        topButton.centerYAnchor.constraint(equalTo: topView.centerYAnchor).isActive = true
        topButton.trailingAnchor.constraint(equalTo: topView.trailingAnchor).isActive = true
        topButton.widthAnchor.constraint(equalTo: topView.widthAnchor, multiplier: 0.15).isActive = true
        topButton.heightAnchor.constraint(equalTo: topButton.heightAnchor).isActive = true
        
        
        //numberLabel
        numberLabel.translatesAutoresizingMaskIntoConstraints = false
        numberLabel.centerYAnchor.constraint(equalTo: topView.centerYAnchor).isActive = true
        numberLabel.leadingAnchor.constraint(equalTo: topView.leadingAnchor).isActive = true
        numberLabel.widthAnchor.constraint(equalTo: topView.widthAnchor, multiplier: 0.15).isActive = true
        numberLabel.heightAnchor.constraint(equalTo: topButton.heightAnchor).isActive = true
        
        
        
        //descriptionView's subViews constraintes:
        //descriptionLabel
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.topAnchor.constraint(equalTo: descriptionView.topAnchor, constant: 5).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: descriptionView.leadingAnchor, constant: 12).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: descriptionView.trailingAnchor, constant: -12).isActive = true
        
        
        //openDescriptionButton
        openDescriptionButton.translatesAutoresizingMaskIntoConstraints = false
        openDescriptionButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 5).isActive = true
        openDescriptionButton.bottomAnchor.constraint(equalTo: descriptionView.bottomAnchor, constant: -5).isActive = true
        openDescriptionButton.widthAnchor.constraint(equalTo: descriptionView.widthAnchor, multiplier: 1).isActive = true
    }
    
    

//MARK: - Configurations UI
    
    private func configureUI() {
        
        //Global views
        markedVisualEffectView.backgroundColor = .yellow
        markedVisualEffectView.layer.borderColor = UIColor.black.cgColor
        markedVisualEffectView.layer.borderWidth = 1
        
        globalVisualEffectView.backgroundColor = .violetFlower
        globalVisualEffectView.layer.cornerRadius = 50
        globalVisualEffectView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMaxYCorner]
        globalVisualEffectView.clipsToBounds = true
        
        globalContainerView.backgroundColor = .backgroundCell
        globalContainerView.layer.borderColor = UIColor.itemUnselected.cgColor
        globalContainerView.layer.borderWidth = 2
        globalContainerView.layer.cornerRadius = 40
        globalContainerView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMaxYCorner]
        globalContainerView.clipsToBounds = true
        
        
        //globalContainerView's subViews configurations
        topView.backgroundColor = .backgroundCell
        
        topStackView.backgroundColor = .clear
        topStackView.axis = .vertical
        topStackView.distribution = .fillProportionally
        topStackView.spacing = 5
        
        photosVisualEffectView.backgroundColor = .violetFlower
        photosVisualEffectView.layer.cornerRadius = 15
        photosVisualEffectView.layer.maskedCorners = [.layerMinXMinYCorner]
        
        photosCollectionView.backgroundColor = .systemGray5
        photosCollectionView.layer.cornerRadius = 10
        photosCollectionView.layer.maskedCorners = [.layerMinXMinYCorner]
        
        sepparatorView.backgroundColor = .violetRose
        
        descriptionView.backgroundColor = .backgroundCellSupport
        
        
        //nameView's subViews configurations:
        nameLable.backgroundColor = .clear
        nameLable.font = UIFont(name: "Futura Bold", size: 21)
        nameLable.textColor = .standartBlack
        nameLable.shadowOffset = CGSize(width: 2, height: 2)
        nameLable.shadowColor = .standartWhite
        nameLable.textAlignment = .center
        nameLable.text = "Some Name"
        
        gpsOfLocationsLabel.backgroundColor = .clear
        gpsOfLocationsLabel.font = UIFont(name: "Hoefler Text Black Italic", size: 17)
        gpsOfLocationsLabel.textColor = .violetRose
        gpsOfLocationsLabel.textAlignment = .center
        gpsOfLocationsLabel.text = "gps: 47.38547, 6.03875"
        
        topButton.setAttributedSysImage(imageSize: CGSize(width: 25, height: 25), image: UIImage(systemName: "arrowshape.up.fill"), attributes: [.foregroundColor : UIColor.itemUnselected], state: .normal)
        topButton.setAttributedSysImage(imageSize: CGSize(width: 30, height: 30), image: UIImage(systemName: "arrowshape.up.fill"), attributes: [.foregroundColor : UIColor.itemSelected], state: .highlighted)
        topButton.addTarget(self, action: #selector(topTapped), for: .touchUpInside)
        
        numberLabel.backgroundColor = .clear
        numberLabel.font = UIFont(name: "Futura Bold", size: 24)
        numberLabel.textColor = .standartBlack
        numberLabel.shadowOffset = CGSize(width: 2, height: 2)
        numberLabel.shadowColor = .standartWhite
        numberLabel.textAlignment = .center
        numberLabel.text = "#1"


        //descriptionView's subView configurations:
        descriptionLabel.backgroundColor = .clear
        descriptionLabel.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        descriptionLabel.textColor = .standartBlack
        descriptionLabel.textAlignment = .left
        descriptionLabel.numberOfLines = 1
        descriptionLabel.text = "Приятное место на опушке леса, где не водятся комары и есть место для безопасного разведения костра."
        
        openDescriptionButton.backgroundColor = .clear
        openDescriptionButton.setImage(UIImage(systemName: "chevron.compact.down"), for: .normal)
        openDescriptionButton.tintColor = .itemUnselected
        openDescriptionButton.addTarget(self, action: #selector(openTapped), for: .touchUpInside)
    }
    
    
    
//MARK: - Actions
    
    @objc private func topTapped() {
        print("TOPTOP")
    }
    
    
    @objc private func openTapped() {
        openDescriptionButton.isSelected.toggle()
        if openDescriptionButton .isSelected {
            openDescriptionButton.setImage(UIImage(systemName: "chevron.compact.up"), for: .normal)
            descriptionLabel.numberOfLines = 0
            openCloseDescriptionSupport?()
        } else {
            openDescriptionButton.setImage(UIImage(systemName: "chevron.compact.down"), for: .normal)
            descriptionLabel.numberOfLines = 1
            openCloseDescriptionSupport?()
        }
    }
}
