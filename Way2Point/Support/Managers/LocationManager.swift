import MapKit

//MARK: - Location manager's protocol to get cerrent latitude/longitude

protocol LocationManagerProtocol {
    func getCurrentLatitude() -> Double
    func getCurrentLongitude() -> Double
}


//MARK: - Final class LocationManager

final class LocationManager: NSObject, CLLocationManagerDelegate {
        
    
//MARK: - Properties of class
    
    private let locationManager = CLLocationManager()
    private var longitude = Double()
    private var latitude = Double()
    
    
//MARK: - Initialization
    
    override init() {
        super.init()
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestAlwaysAuthorization()
        
        DispatchQueue.global().async { [self] in
            if CLLocationManager.locationServicesEnabled() {
                locationManager.delegate = self
                locationManager.desiredAccuracy = kCLLocationAccuracyBest
                locationManager.startUpdatingLocation()
            }
        }
    }
    
    
//MARK: - Updating of current location
    
    internal func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last?.coordinate {
            self.latitude = location.latitude
            self.longitude = location.longitude
        }
    }
}


//MARK: - Implemendation of protocol's methods

extension LocationManager : LocationManagerProtocol {
    
    func getCurrentLatitude() -> Double {
        return latitude
    }
        
    func getCurrentLongitude() -> Double {
        return longitude
    }
}
