import UIKit.UIButton

//MARK: - Set the opportunity to change some attributes for system images apply to a button

extension UIButton {
    
    func setAttributedSysImage(imageSize size: CGSize, image: UIImage?, attributes attrs: [NSAttributedString.Key : Any], state: UIControl.State) {
        let attachement = NSTextAttachment()
        let size = size
        attachement.image = image?.withRenderingMode(.alwaysTemplate)
        attachement.bounds = CGRect(origin: .zero, size: size)
        let attachementString = NSAttributedString(attachment: attachement)
        let attributedString = NSMutableAttributedString(attributedString: attachementString)
        attributedString.addAttributes(attrs, range: NSRange(location: 0, length: attributedString.length))
        setAttributedTitle(attributedString, for: state)
    }
}
