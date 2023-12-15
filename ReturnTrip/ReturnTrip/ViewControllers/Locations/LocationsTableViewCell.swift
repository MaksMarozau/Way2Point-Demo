import UIKit

//MARK: - Final class LocationsTableViewCell

class LocationsTableViewCell: UITableViewCell {
    
    
//MARK: - Properties of class
    
    private let globalContainerView = UIView()
    
    private let nameView = UIView()
    private let gpsView = UIView()
    private let photosCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    private let descriptionView = UIView()
    
    private let topButton = UIButton()
    private let nameLable = UILabel()
    private let markButton = UIButton()
    
    
    
//MARK: - Initializations
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(globalContainerView)
        globalContainerView.addSubwiews(views: nameView, gpsView, photosCollectionView, descriptionView)
        nameView.addSubwiews(views: topButton, nameLable, markButton)
        
        constraintes()
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
//MARK: - Constraintes
    
    private func constraintes() {
        
        //globalContainerView
        globalContainerView.translatesAutoresizingMaskIntoConstraints = false
        globalContainerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        globalContainerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        globalContainerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        globalContainerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true

        
        //globalContainerView's subViews constraintes:
        //nameView
        nameView.translatesAutoresizingMaskIntoConstraints = false
        nameView.topAnchor.constraint(equalTo: globalContainerView.topAnchor, constant: 5).isActive = true
        nameView.leadingAnchor.constraint(equalTo: globalContainerView.leadingAnchor, constant: 12).isActive = true
        nameView.trailingAnchor.constraint(equalTo: globalContainerView.trailingAnchor, constant: -12).isActive = true
        nameView.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        
        //gpsView
        gpsView.translatesAutoresizingMaskIntoConstraints = false
        gpsView.topAnchor.constraint(equalTo: nameView.bottomAnchor, constant: 5).isActive = true
        gpsView.leadingAnchor.constraint(equalTo: globalContainerView.leadingAnchor, constant: 12).isActive = true
        gpsView.trailingAnchor.constraint(equalTo: globalContainerView.trailingAnchor, constant: -12).isActive = true
        gpsView.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        
        //photosCollectionView
        photosCollectionView.translatesAutoresizingMaskIntoConstraints = false
        photosCollectionView.topAnchor.constraint(equalTo: gpsView.bottomAnchor, constant: 5).isActive = true
        photosCollectionView.leadingAnchor.constraint(equalTo: globalContainerView.leadingAnchor, constant: 12).isActive = true
        photosCollectionView.trailingAnchor.constraint(equalTo: globalContainerView.trailingAnchor).isActive = true
        photosCollectionView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        
        //descriptionView
        descriptionView.translatesAutoresizingMaskIntoConstraints = false
        descriptionView.topAnchor.constraint(equalTo: photosCollectionView.bottomAnchor, constant: 5).isActive = true
        descriptionView.leadingAnchor.constraint(equalTo: globalContainerView.leadingAnchor, constant: 12).isActive = true
        descriptionView.trailingAnchor.constraint(equalTo: globalContainerView.trailingAnchor, constant: -12).isActive = true
        descriptionView.bottomAnchor.constraint(equalTo: globalContainerView.bottomAnchor, constant: -5).isActive = true
        descriptionView.heightAnchor.constraint(equalToConstant: 60).isActive = true

        
        //nameView's subViews constraintes:
        //topbutton
        topButton.translatesAutoresizingMaskIntoConstraints = false
        topButton.topAnchor.constraint(equalTo: nameView.topAnchor).isActive = true
        topButton.leadingAnchor.constraint(equalTo: nameView.leadingAnchor).isActive = true
        topButton.bottomAnchor.constraint(equalTo: nameView.bottomAnchor).isActive = true
        topButton.widthAnchor.constraint(equalTo: nameView.widthAnchor, multiplier: 0.1).isActive = true
        
        
        //markButton
        markButton.translatesAutoresizingMaskIntoConstraints = false
        markButton.topAnchor.constraint(equalTo: nameView.topAnchor).isActive = true
        markButton.trailingAnchor.constraint(equalTo: nameView.trailingAnchor).isActive = true
        markButton.bottomAnchor.constraint(equalTo: nameView.bottomAnchor).isActive = true
        markButton.widthAnchor.constraint(equalTo: nameView.widthAnchor, multiplier: 0.1).isActive = true

        
        //nameLable
        nameLable.translatesAutoresizingMaskIntoConstraints = false
        nameLable.topAnchor.constraint(equalTo: nameView.topAnchor).isActive = true
        nameLable.leadingAnchor.constraint(equalTo: topButton.trailingAnchor).isActive = true
        nameLable.trailingAnchor.constraint(equalTo: markButton.leadingAnchor).isActive = true
        nameLable.bottomAnchor.constraint(equalTo: nameView.bottomAnchor).isActive = true
    }
    
    

//MARK: - Configurations UI
    
    private func configureUI() {
        
        globalContainerView.backgroundColor = .backgroundCell
        globalContainerView.layer.borderColor = UIColor.itemUnselected.cgColor
        globalContainerView.layer.borderWidth = 1
        
        nameLable.textColor = .black
        nameLable.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        nameLable.textAlignment = .center
        nameLable.text = "Some Name"
//        nameLable.backgroundColor = .backgroundCell
        
        
        topButton.setAttributedSysImage(imageSize: CGSize(width: 30, height: 30), image: UIImage(systemName: "arrowshape.up.fill"), attributes: [.foregroundColor : UIColor.itemUnselected], state: .normal)
        topButton.setAttributedSysImage(imageSize: CGSize(width: 30, height: 30), image: UIImage(systemName: "arrowshape.up.fill"), attributes: [.foregroundColor : UIColor.itemSelected], state: .highlighted)
        topButton.addTarget(self, action: #selector(topTapped), for: .touchUpInside)
        
        
        
        markButton.setAttributedSysImage(imageSize: CGSize(width: 30, height: 30), image: UIImage(systemName: "star"), attributes: [.foregroundColor : UIColor.itemUnselected], state: .normal)
        markButton.addTarget(self, action: #selector(markTapped), for: .touchUpInside)
        
        
        gpsView.backgroundColor = .backgroundCell
        photosCollectionView.backgroundColor = .systemGray5
        descriptionView.backgroundColor = .backgroundCell
        
    }
    
    @objc func topTapped() {
        print("TOPTOP")
    }
    
    @objc private func markTapped() {
        print("markMark")
        markButton.isSelected.toggle()
        if markButton.isSelected {
            markButton.setAttributedSysImage(imageSize: CGSize(width: 30, height: 30), image: UIImage(systemName: "star.fill"), attributes: [.foregroundColor : UIColor.itemSelected], state: .normal)
            
        } else {
            markButton.setAttributedSysImage(imageSize: CGSize(width: 30, height: 30), image: UIImage(systemName: "star"), attributes: [.foregroundColor : UIColor.itemUnselected], state: .normal)
        }
    }
}
