import UIKit.UIView

extension UIView {
    
    func addSubwiews(views view: UIView...) {
        view.forEach({ addSubview($0) })
    }
}
