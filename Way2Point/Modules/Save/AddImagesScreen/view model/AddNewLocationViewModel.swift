import UIKit

//MARK: - Protocol for expansion AddNewLocationViewModel class with mrthods , wich useing for implemendation logic of the view.

protocol AddNewLocationViewModelProtocol {
    
    func closePage()
    func addNewImage(to viewController: UIViewController)
    func saveCurrentLocation(with name: String, _ description: String)

    var addImage: ((UIImage) -> Void)? { get set }
    var showNotificationsAlert: ((UIAlertController) -> Void)? { get set }
}



//MARK: - Final class AddNewLocationViewModel

final class AddNewLocationViewModel {
    
    
//MARK: - Properties of class
    
    private let imagePicker: ImagePickerView
    private let locationManager: LocationManagerProtocol
    
    var movieToStartAppScreen: (() -> Void)?
    var addImage: ((UIImage) -> Void)?
    var showNotificationsAlert: ((UIAlertController) -> Void)?
    
    private var imagesArray: [UIImage] = []
    private var latitude: Double = 0
    private var longitude: Double = 0
    
    
    
//MARK: - Initializator
    
    init(imagePicker: ImagePickerView, locationManager: LocationManagerProtocol) {
        self.imagePicker = imagePicker
        self.locationManager = locationManager
    }
    
    
    
//MARK: - Show ActionSheet to coose the adding picture method and provide the current picture to view
    
    private func showActionSheet(on viewController: UIViewController) {
        let actionSheet = UIAlertController(title: "Add new image from:", message: "", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Gallery", style: .default, handler: { _ in
            self.imagePicker.showImagePickerController(on: viewController, with: .gallery)
            self.imagePicker.onImagePicked = { image in
                self.imagesArray.append(image)
                self.provideImage(image)
            }
        }))
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { _ in
            self.imagePicker.showImagePickerController(on: viewController, with: .camera)
            self.imagePicker.onImagePicked = { image in
                self.imagesArray.append(image)
                self.provideImage(image)
            }
        }))
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        viewController.present(actionSheet, animated: true)
    }
    
    
    private func provideImage(_ image: UIImage?) {
        if let image {
            addImage?(image)
        }
    }
    
    
    
//MARK: - Getting of current gps
    
    private func getGPS() {
        latitude = locationManager.getLocationsLatitude()
        longitude = locationManager.getLocationsLongitude()
    }
    
    
    
//MARK: - Transform the imagesArray to Data
    
    private func transformImageArrayToData() {
        
    }
    
    
    
//MARK: - Save data with CoreData Manager
    
    private func saveData(name: String, description: String, latitude: Double, longitude: Double, imagesArray: [UIImage]) {
        
        print(imagesArray.count)
        
        let result = CoreDataManager.instance.saveLocation(name: name, description: description, latitude: latitude, longitude: longitude, imagesArray: imagesArray)
        switch result {
        case .success(_):
            print("Saved")
            movieToStartAppScreen?()
        case .failure(let failure):
            print(failure)
            showUserNotification(notificationType: .error, errorDescription: failure.description())
        }
    }
    
    
    
//MARK: - Show notification on the screen
    
    private func showUserNotification(notificationType type : UserNotificationsManager.NotificationType, errorDescription error: String?) {
        
        switch type {
        case .error:
            let alert = UserNotificationsManager.instance.showAlertWithError(wiht: error ?? "")
        default:
            let alert = UserNotificationsManager.instance.showAlert(by: type)
            showNotificationsAlert?(alert)
        }
    }
}



//MARK: - Impemendation of the AddNewLocationViewModelProtocol

extension AddNewLocationViewModel: AddNewLocationViewModelProtocol {
    
    
//MARK: - Save the current location
    
    func saveCurrentLocation(with name: String, _ description: String) {
        
        getGPS()
        
        guard name != "" && description != "Enter the description of location, please" && description !=  "" else {
            showUserNotification(notificationType: .empetyTextField, errorDescription: nil)
            return
        }
        guard longitude != 0.0 && latitude != 0.0 else {
            showUserNotification(notificationType: .gpsNotAvailable, errorDescription: nil)
            return
        }
        guard !imagesArray.isEmpty else {
            showUserNotification(notificationType: .noImage, errorDescription: nil)
            return
        }
        
        saveData(name: name, description: description, latitude: latitude, longitude: longitude, imagesArray: imagesArray)
    }
    
    
    
//MARK: - Adding of new image to view
    
    func addNewImage(to viewController: UIViewController) {
        showActionSheet(on: viewController)
    }
    
    
    
//MARK: - Close current page(module) method
    
    func closePage() {
        movieToStartAppScreen?()
    }
}
