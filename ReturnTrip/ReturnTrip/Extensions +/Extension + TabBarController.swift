import UIKit.UITabBarController

extension UITabBarController {
    
    func colorsScheme() {
        
        view.backgroundColor = .white
        
        UITabBar.appearance().backgroundColor = .white
        UITabBar.appearance().tintColor = .blue
        UITabBar.appearance().unselectedItemTintColor = .darkGray
    }
}
