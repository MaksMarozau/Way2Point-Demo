import UIKit

//MARK: - Protocol for expansion AddNewLocationViewModel class with mrthods , wich useing for implemendation logic of the view.

protocol AddNewLocationViewModelProtocol {
    
    func closePage()
    func addNewImage(to viewController: UIViewController)
    func saveCurrentLocation(with name: String?, description: String?)

    var addImage: ((UIImage) -> Void)? { get set }
}



//MARK: - Final class AddNewLocationViewModel

final class AddNewLocationViewModel {
    
    
//MARK: - Properties of class
    
    private let imagePicker: ImagePickerView
    private let locationManager: LocationManager
    
    var movieToStartAppScreen: (() -> Void)?
    var addImage: ((UIImage) -> Void)?
    
    private var imagesArray: [UIImage] = []
    private var latitude: Double = 0
    private var longitude: Double = 0
    
    
    
//MARK: - Initializator
    
    init(imagePicker: ImagePickerView, locationManager: LocationManager) {
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
        case .success(let success):
            print("Saved")
        case .failure(let failure):
            print(failure)
        }
    }
}



//MARK: - Impemendation of the AddNewLocationViewModelProtocol

extension AddNewLocationViewModel: AddNewLocationViewModelProtocol {
    
    func saveCurrentLocation(with name: String?, description: String?) {
        
        getGPS()
        
        guard let name, let description else { return }
        guard longitude != 0.0 && latitude != 0.0 else { return }
        guard !imagesArray.isEmpty else { return }
        
        saveData(name: name, description: description, latitude: latitude, longitude: longitude, imagesArray: imagesArray)
    }
    
    func addNewImage(to viewController: UIViewController) {
        showActionSheet(on: viewController)
    }
    
    
    func closePage() {
        movieToStartAppScreen?()
    }
}
