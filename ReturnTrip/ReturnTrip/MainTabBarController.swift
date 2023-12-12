import UIKit

final class MainTabBarController: UITabBarController {
    
    private let locationsViewController = LocationsViewController()
    private let saveViewController = SaveViewController()
    private let naviViewController = NaviViewController()
    private let toolsViewController = ToolsViewController()
    private let settingsViewController = SettingsViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configItemsUI()
        addControllers()
    }
    
    
    
//MARK: - Configuration of items UI
    
    private func configItemsUI() {
        
        locationsViewController.tabBarItem = UITabBarItem(title: "Locations", image: UIImage(systemName: "location.fill.viewfinder"), tag: 0)
        saveViewController.tabBarItem = UITabBarItem(title: "Save", image: UIImage(systemName: "square.and.arrow.down.fill"), tag: 1)
        naviViewController.tabBarItem = UITabBarItem(title: "Navi", image: UIImage(systemName: "location.fill"), tag: 2)
        toolsViewController.tabBarItem = UITabBarItem(title: "Tools", image: UIImage(systemName: "squareshape.split.2x2"), tag: 3)
        settingsViewController.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "slider.horizontal.3"), tag: 4)
    }

    
    
//MARK: - Add controllers
    
    private func addControllers() {
        
        let locationsNavigationController = UINavigationController(rootViewController: locationsViewController)
        let saveNavigationController = UINavigationController(rootViewController: saveViewController)
        let toolsNavigationController = UINavigationController(rootViewController: toolsViewController)
        
        self.viewControllers = [locationsNavigationController, saveNavigationController, naviViewController, toolsNavigationController, settingsViewController]
    }
}
