import CoreLocation
import CoreMotion

//MARK: - Protocol for expansion NavigationScreenViewModel class with mrthods , wich useing for implemendation logic of the view.

protocol NavigationScreenViewModelProtocol {
    func createDeflexionAngle()
    func stopUpdatingPosition()
    var provideDeflexionangle: ((CLLocationDegrees) -> Void)? { get set }
}


//MARK: - Final class NavigationScreenViewModel

final class NavigationScreenViewModel {
    
    
//MARK: - Properties of class
    
    private let compassManager = CompassManager()
    private let locationManager: LocationManagerProtocol
    private var motionManager = CMMotionManager()
    
    private var currentCoordinate = CLLocationCoordinate2D()
    private var locationCoordinate = CLLocationCoordinate2D()
    private var headingToNorth = CLLocationDegrees()

    var updatePositionTimer: Timer?
    var deflexionAngle: CLLocationDegrees = 0 {
        didSet {
            provideDeflexionangle?(deflexionAngle)
        }
    }
    var provideDeflexionangle: ((CLLocationDegrees) -> Void)?
    
    
//MARK: - Inititalization
    
    init(locationManager: LocationManagerProtocol) {
        self.locationManager = locationManager
    }
    
    
//MARK: - Set location coordinates
    
    public func setLocationsCoordinates(coordinate: CLLocationCoordinate2D) {
        locationCoordinate = coordinate
    }
    
    
//MARK: - Getting of current gps
        
    private func getGPS() {
        let latitude = locationManager.getCurrentLatitude()
        let longitude = locationManager.getCurrentLongitude()
        currentCoordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    
//MARK: - Calculate the bearing (azimuth) of location relative of current gps with delta by longitude
    
    private func calculateBearing(from currentCoordinate: CLLocationCoordinate2D, to locationCoordinate: CLLocationCoordinate2D) -> CLLocationDegrees {
        let lat1 = currentCoordinate.latitude.radians
        let lon1 = currentCoordinate.longitude.radians
        let lat2 = locationCoordinate.latitude.radians
        let lon2 = locationCoordinate.longitude.radians
        
        let deltaLon = lon2 - lon1
        
        let yRepresentation = sin(deltaLon) * cos(lat2)
        let xRepresentation = cos(lat1) * sin(lat2) - sin(lat1) * cos(lat2) * cos(deltaLon)
        var azimuth = atan2(yRepresentation, xRepresentation)
        azimuth = azimuth.degrees
        let normalizedAzimuth = (azimuth + 360).truncatingRemainder(dividingBy: 360)
       return normalizedAzimuth
    }
    
    
//MARK: - Update deflexion angel with 0.5 sec timer to slow turn the arrow on the screen
    
    func updateDeflexionAngleState() {
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            self.getGPS()
            let locationAzimuth = self.calculateBearing(from: self.currentCoordinate, to: self.locationCoordinate)
            compassManager.startUpdatingHeadingToNorth { [weak self] angle in
                self?.headingToNorth = angle
            }
            deflexionAngle = locationAzimuth - headingToNorth
        }
    }
}


//MARK: - Impemendation of the NavigationScreenViewModelProtocol

extension NavigationScreenViewModel: NavigationScreenViewModelProtocol {
    
    func stopUpdatingPosition() {
        updatePositionTimer?.invalidate()
    }
    
    func createDeflexionAngle() {
        updateDeflexionAngleState()
    }
}
