import UIKit

//MARK: - Public enum SourceType, witch provides a choise for method of geting the image

enum SourceType {
    case camera
    case gallery
}



//MARK: - Final class ImagePickerView

final class ImagePickerView: NSObject {
    
    
//MARK: - Properties of class
    
    private var imagePickerController = UIImagePickerController()
    var onImagePicked: ((UIImage) -> Void)?
    
    
    
//MARK: - The show method (present of the image picker)
    
    func showImagePickerController(on viewController: UIViewController, with sourceType: SourceType) {
        imagePickerController.delegate = self
        switch sourceType {
        case .camera:
            imagePickerController.sourceType = .camera
        case .gallery:
            imagePickerController.sourceType = .photoLibrary
        }
        viewController.present(imagePickerController, animated: true, completion: nil)
    }
}



//MARK: - Extension for ImagePickerView with protocols UIImagePickerControllerDelegate & UINavigationControllerDelegate

extension ImagePickerView: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //when picker was used
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            self.onImagePicked?(image)
        }
        picker.dismiss(animated: true)
    }
    
    //when user cliced "cancel"
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
}
