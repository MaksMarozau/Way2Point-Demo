import UIKit.UIView

//MARK: - Added more then one subViews

extension UIView {
    
    func addSubviews(views view: UIView...) {
        view.forEach({ addSubview($0) })
    }
}
