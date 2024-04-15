import UIKit

final class VibrationsManager {
    
    static let instance = VibrationsManager()
    private init() { }
    
    private let vibrationsSours = UINotificationFeedbackGenerator()

    func craftBasicVibro() {
        if UserDefaultsManager.instance.isVibro {
            vibrationsSours.notificationOccurred(.success)
        }
    }
}
