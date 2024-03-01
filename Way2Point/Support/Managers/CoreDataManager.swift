import CoreData
import UIKit

final class CoreDataManager: NSCopying {

    static let instance = CoreDataManager()
    
    private init() { }
    
    func copy(with zone: NSZone? = nil) -> Any {
        self
    }
    
    
    func saveLocation(name: String, description: String, latitude: Double, longitude: Double, imagesArray: [UIImage]) -> Result<Void, CoreDataError> {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return .failure(.appDelegateError) }
        
        let managedContext = appDelegate.persistentContainer.viewContext
    }
}
