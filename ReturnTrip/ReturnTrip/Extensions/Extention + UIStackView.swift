import UIKit.UIStackView

extension UIStackView {
    
    func addArrangedSubviews(views view: UIView...) {
        view.forEach({ addArrangedSubview($0) })
    }
    
}
