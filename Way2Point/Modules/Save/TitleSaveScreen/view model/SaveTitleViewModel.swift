//MARK: - Protocol for expansion SaveTitleViewModel class with mrthods , wich useing for implemendation logic of the view.

protocol SaveTitleViewModelProtocol {
    func saveCurrentLocation()
}


//MARK: - Final class SaveTitleViewModel

final class SaveTitleViewModel {
    
    var showAddLocationScreen: (() -> Void)?
}


//MARK: - Impemendation of the SaveTitleViewModelProtocol

extension SaveTitleViewModel: SaveTitleViewModelProtocol {
    
    func saveCurrentLocation() {
        showAddLocationScreen?()
    }
}
