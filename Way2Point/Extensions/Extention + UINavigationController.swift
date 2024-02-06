import UIKit.UINavigationController

//MARK: - Chenge the color scheme of navigation bar with Appearance-property

extension UINavigationController {
    
    func customColorsScheme() {
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        
        appearance.backgroundColor = .backgroundBar
        
        navigationBar.standardAppearance = appearance
        navigationBar.scrollEdgeAppearance = appearance
        navigationBar.compactAppearance = appearance
    }
}
