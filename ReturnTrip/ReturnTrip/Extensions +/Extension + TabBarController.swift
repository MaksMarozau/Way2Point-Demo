import UIKit.UITabBarController

//MARK: - Change to the custom color scheme of tab bar with Appearance-property

extension UITabBarController {
    
    func customeColorsScheme() {
        
        view.backgroundColor = .backgroundView

        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        
        appearance.backgroundColor = .backgroundBar
        appearance.stackedLayoutAppearance.normal.iconColor = .itemUnselected
        appearance.stackedLayoutAppearance.selected.iconColor = .itemSelected
        
        tabBar.standardAppearance = appearance
        tabBar.scrollEdgeAppearance = appearance
    }
}
