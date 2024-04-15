import UIKit

final class UserDefaultsManager: NSObject {

    static let instance = UserDefaultsManager()
    private override init() {
        super.init()
        initialParameters()
    }
    
    private let settingInitialParameters: [String: Any] = [
        DataStorage.isSound.rawValue: true,
        DataStorage.isVibro.rawValue: true
    ]

    private func initialParameters() {
        UserDefaults.standard.register(defaults: settingInitialParameters)
    }

    var isSound: Bool {
        set { UserDefaults.standard.set(newValue, forKey: DataStorage.isSound.rawValue) }
        get { UserDefaults.standard.bool(forKey: DataStorage.isSound.rawValue) }
    }

    var isVibro: Bool {
        set { UserDefaults.standard.set(newValue, forKey: DataStorage.isVibro.rawValue) }
        get { UserDefaults.standard.bool(forKey: DataStorage.isVibro.rawValue) }
    }
}

//MARK: - Bank of defaults cases
extension UserDefaultsManager {
   
    enum DataStorage: String {
        case isSound
        case isVibro
    }
}
