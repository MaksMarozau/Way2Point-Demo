import UIKit

//MARK: - Final class AddNewLocationCollectionViewCell

final class AddNewLocationCollectionViewCell: UICollectionViewCell {
    
    
//MARK: - Properties of class
    
    private let containerView = UIView()
    private let imageView = UIImageView()
    
    
    
//MARK: - Initializators
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(containerView)
        containerView.addSubview(imageView)
        
        setConstraintes()
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
//MARK: - Setting of constraintes
    
    private func setConstraintes() {
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 3).isActive = true
        imageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 3).isActive = true
        imageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -3).isActive = true
        imageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -3).isActive = true
    }
    
    
    
//MARK: - Configuration of UI
    
    private func configureUI() {
        
        containerView.backgroundColor = .clear
        
        imageView.layer.cornerRadius = 12
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.standartBlack.cgColor
        imageView.contentMode = .scaleAspectFill
    }
    
    

//MARK: - Add content
    
    public func addImage(_ image: UIImage?) {
        imageView.image = image
    }
}
