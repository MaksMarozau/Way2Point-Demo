import UIKit.UIView

extension UIView {
    
    func addSubviews(views view: UIView...) {
        view.forEach({ addSubview($0) })
    }
}
