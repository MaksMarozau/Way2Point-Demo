import UIKit.UIStackView

//MARK: - Added more then one subViews

extension UIStackView {
    
    func addArrangedSubviews(views view: UIView...) {
        view.forEach({ addArrangedSubview($0) })
    }
    
}
