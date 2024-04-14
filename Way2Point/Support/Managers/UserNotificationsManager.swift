import UIKit.UIAlertController

//MARK: - Final class UserNotificationsManager

final class UserNotificationsManager {
    
    static let instance = UserNotificationsManager()
    private init() { }
    
    
//MARK: - Enum with notification types where returns some description of notification
    
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
    

//MARK: - Method to show simple alert on some screen (public)
    
    public func showAlert(by notification: NotificationType) -> UIAlertController {
        let title = notification.rawValue
        let message = notification.description()
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel))
        
        return alert
    }
    
    
//MARK: - Method to show alert with error on some screen (public)
    
    public func showAlertWithError(by notification: NotificationType, wiht error: String) -> UIAlertController {
        let title = notification.rawValue
        let message = error
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel))
        
        return alert
    }
    

//MARK: - Method to show alert with notification of some successful operation on some screen (public)
    
    public func showAlertWithSuccess(by notification: NotificationType, with compleation: @escaping(() -> Void)) -> UIAlertController {
        let title = notification.rawValue
        let message = notification.description()
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: { _ in
            compleation()
        }))
        
        return alert
    }
}
