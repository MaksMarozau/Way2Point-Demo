import UIKit.UIAlertController


final class UserNotificationsManager {
    
    static let instance = UserNotificationsManager()
    
    private init() { }
    
    
    enum NotificationType: String {
        case empetyTextField = "Text field is empty"
        case noImage = "Image of the location is missing"
        case gpsNotAvailable = "GPS is not available"
        case error = "Error"
        case saved = "Congratulate!"
        
        
        func description() -> String {
            switch self {
            case .empetyTextField:
                let description = "Every text field must be filled in"
                return description
            case .noImage:
                let description = "You need to set at least on image for the location"
                return description
            case .gpsNotAvailable:
                let description = "You must allow the useing of GPS in your phone settings"
                return description
            case .error:
                let description = ""
                return description
            case .saved:
                let description = "Your save was successful"
                return description
            }
        }
    }
    
    
    func showAlert(by notification: NotificationType) -> UIAlertController {
        
        let title = notification.rawValue
        let message = notification.description()
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel))
        
        return alert
    }
    
    
    func showAlertWithError(by notification: NotificationType, wiht error: String) -> UIAlertController {
        
        let title = notification.rawValue
        let message = error
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel))
        
        return alert
    }
    
    
    func showAlertWithSuccess(by notification: NotificationType, with compleation: @escaping(() -> Void)) -> UIAlertController {
        
        let title = notification.rawValue
        let message = notification.description()
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: { _ in
            compleation()
        }))
        
        return alert
    }
}
