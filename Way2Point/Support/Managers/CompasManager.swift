import CoreLocation
import CoreMotion

//MARK: - Final class CompassManager

final class CompassManager: NSObject {
    private let locationManager = CLLocationManager()
    private let motionManager = CMMotionManager()
    private var headingCallback: ((CLLocationDirection) -> Void)?

    
//MARK: - Initialization
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.startUpdatingHeading()
    }
    

//MARK: - Update HeadingToNorth (public)
    
    public func startUpdatingHeadingToNorth(completion: @escaping (CLLocationDirection) -> Void) {
        headingCallback = completion
    }
}


//MARK: - Extension with CLLocationManagerDelegate's delegate to update heading state

extension CompassManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        let heading = newHeading.magneticHeading
        headingCallback?(heading)
    }
}
