import UIKit

//MARK: - Protocol for expansion AddNewLocationViewModel class with mrthods , wich useing for implemendation logic of the view.

protocol AddNewLocationViewModelProtocol {
    
    func closePage()
    func addNewImage(to viewController: UIViewController)
    
    var addImage: ((UIImage) -> Void)? { get set }
}



//MARK: - Final class AddNewLocationViewModel

final class AddNewLocationViewModel {
    
    
//MARK: - Properties of class
    
    var movieToStartAppScreen: (() -> Void)?
    var addImage: ((UIImage) -> Void)?
    
    private let imagePicker: ImagePickerView
    private var image: UIImage?
    
    
//MARK: - Initializator
    
    init(imagePicker: ImagePickerView) {
        self.imagePicker = imagePicker
    }
    
    
//MARK: - Show ActionSheet method to coose the adding picture method
    
    private func showActionSheet(on viewController: UIViewController) {
        let actionSheet = UIAlertController(title: "Add new image from:", message: "", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Gallery", style: .default, handler: { _ in
            self.imagePicker.showImagePickerController(on: viewController, with: .gallery)
            self.imagePicker.onImagePicked = { image in
                self.image = image
                self.provideImage()
            }
        }))
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { _ in
            self.imagePicker.showImagePickerController(on: viewController, with: .camera)
            self.imagePicker.onImagePicked = { image in
                self.image = image
                self.provideImage()
            }
        }))
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        viewController.present(actionSheet, animated: true)
    }
    
    
    private func provideImage() {
        if let image {
            addImage?(image)
        }
    }
}



//MARK: - Impemendation of the AddNewLocationViewModelProtocol

extension AddNewLocationViewModel: AddNewLocationViewModelProtocol {
    
    func addNewImage(to viewController: UIViewController) {
        showActionSheet(on: viewController)
    }
    
    
    func closePage() {
        movieToStartAppScreen?()
    }
    
    
}
