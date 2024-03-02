import MapKit

protocol LocationManagerProtocol {
    
    func getLocationsLatitude() -> Double
    func getLocationsLongitude() -> Double
}



final class LocationManager: NSObject, CLLocationManagerDelegate {
        
    private let locationManager = CLLocationManager()
    
    private var longitude: Double = 0
    private var latitude: Double = 0
    
    
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
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last?.coordinate {
            self.latitude = location.latitude
            self.longitude = location.longitude
        }
    }
}



extension LocationManager : LocationManagerProtocol {
    
    func getLocationsLatitude() -> Double {
        return latitude
    }
        
        
    func getLocationsLongitude() -> Double {
        return longitude
    }
}
