import CoreData
import UIKit


//MARK: - Final class CoreDataManager

final class CoreDataManager: NSCopying {

    static let instance = CoreDataManager()
    private init() { }
    
    func copy(with zone: NSZone? = nil) -> Any {
        self
    }
    
    
//MARK: - Saving of current location
    
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
    
  
//MARK: - Loading of locations array
    
    func loadLocations() -> Result<[TheLocation], CoreDataError> {

        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return .failure(.appDelegateError) }
        
        let managedContext  = appDelegate.persistentContainer.viewContext
        
        let feetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "TheLocation")
        feetchRequest.relationshipKeyPathsForPrefetching = ["imagesRelationship"]
        
        var locations = [TheLocation]()
        
        do {
            let feetchedObject = try managedContext.fetch(feetchRequest)
            guard let feetchedLocations = feetchedObject as? [TheLocation] else { return .failure(.castError) }
            locations = feetchedLocations
        } catch {
            return .failure(.loadError)
        }
        
        return .success(locations)
    }
    
    
//MARK: - Delete data method
        
    func deleteData(of object: TheLocation) -> Result<Void, CoreDataError> {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return .failure(.appDelegateError) }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        if let images = object.imagesRelationship as? Set<TheImages> {
            for image in images {
                managedContext.delete(image)
            }
        }
        
        managedContext.delete(object)
        
        do {
            try managedContext.save()
        } catch {
            return .failure(.saveError)
        }
        return .success(())
    }
}
