import UIKit

class AppCoordinator {
    
    let window: UIWindow
    var locationsCoordinator: LocationsCoordinator?
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let tabBarController = UITabBarController()
        var controllers: [UIViewController] = []

        let locationController = createLocationController()
        
        controllers.append(locationController)
        
        tabBarController.viewControllers = controllers
        
        tabBarController.customeColorsScheme()
        
        
        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
    }
    
    
    
    private func createLocationController() -> UIViewController {
        locationsCoordinator = LocationsCoordinator()
        
        guard let locationController = locationsCoordinator?.rootViewController else { return UIViewController()}
        locationController.tabBarItem = UITabBarItem(title: "Locations", image: UIImage(systemName: "location.fill.viewfinder"), tag: 0)
        
        locationsCoordinator?.start()
        return locationController
    }
    
//    func showLocationViewController() {
//        let locationsCoordinator = LocationsCoordinator(window: window, rootViewController: rootViewController)
//        locationsCoordinator.start()
//    }
    
    
//    private func setupTabBar() {
//        let tabBarController = UITabBarController()
//        var controllers: [UIViewController] = []
//        
//        guard let locationsViewController = locationCoordinator?.rootViewController else { return }
//        locationsViewController.tabBarItem = UITabBarItem(title: "Locations", image: UIImage(systemName: "location.fill.viewfinder"), tag: 0)
//        controllers.append(locationsViewController)
//        
//        tabBarController.viewControllers = controllers
//        
//        tabBarController.customeColorsScheme()
//        
//        
//    }
    
    
    private func createMainLocationController() -> UIViewController {
        let view = LocationsView()
        let viewModel = LocationListViewModel()
        view.viewModel = viewModel
        
        let clearNavigationController = UINavigationController(rootViewController: view)
        return clearNavigationController
    }
    
    
    private func responceControllers() -> [UIViewController] {
        
        var controllersArray: [UIViewController] = []
        let mainLocationController = createMainLocationController()
        controllersArray.append(mainLocationController)
        
        
        let saveViewController = SaveView()
        let naviViewController = NaviViewController()
        let toolsViewController = ToolsViewController()
        let settingsViewController = SettingsViewController()
        
        let saveNavigationController = UINavigationController(rootViewController: saveViewController)
        let toolsNavigationController = UINavigationController(rootViewController: toolsViewController)
        
        controllersArray.append(saveNavigationController)
        controllersArray.append(naviViewController)
        controllersArray.append(toolsNavigationController)
        controllersArray.append(settingsViewController)

        return controllersArray
    }
}
