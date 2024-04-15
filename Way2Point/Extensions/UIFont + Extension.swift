import UIKit.UIFont

extension UIFont {
    
    enum CustomeFont: String {
        case vagroundedmbold = "18vagroundedmbold"
    }
    
    static func custome(of size: CGFloat, _ type: CustomeFont) -> UIFont {
        return UIFont(name: type.rawValue, size: size) ?? .systemFont(ofSize: size)
    }
}
