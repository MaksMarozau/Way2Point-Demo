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
        
        guard let theLocationEntity = NSEntityDescription.entity(forEntityName: "TheLocation", in: managedContext) else { return .failure(.entityError) }
        guard let theImagesEntity = NSEntityDescription.entity(forEntityName: "TheImages", in: managedContext) else { return .failure(.entityError)}
        
        let location = NSManagedObject(entity: theLocationEntity, insertInto: managedContext)
        
        location.setValue(name, forKey: "locName")
        location.setValue(description, forKey: "locDescpiption")
        location.setValue(latitude, forKey: "locLatitude")
        location.setValue(longitude, forKey: "locLongitude")
        
        for image in imagesArray {
            let images = NSManagedObject(entity: theImagesEntity, insertInto: managedContext)
            let imageData = image.jpegData(compressionQuality: 1)
            if let imageData {
                images.setValue(imageData, forKey: "image")
                location.mutableSetValue(forKey: "imagesRelationship").add(images)
                images.setValue(location, forKey: "locationRelationship")
            }
        }
        
        do {
            try managedContext.save()
        } catch {
            print("ERROR - \(error.localizedDescription)")
            print("Core Data validation error: \(error)")
            return .failure(.saveError)
        }
        
        return .success(())
    }
}
