import UIKit

//MARK: - Final class AppCoordinator - Creating and managing for TabBarController

final class AppCoordinator {
    
    
//MARK: - Properties of class
    
    let window: UIWindow
    let tabBarController = UITabBarController()
    
    private var locationsCoordinator: LocationsCoordinator?
    private var saveCoordinator: SaveCoordinator?
    private var navigationCoordinator: NavigationCoordinator?
    private var toolsCoordinator: ToolsCoordinator?
    private var settingsCoordinator: SettingsCoordinator?

    private var controllers: [UIViewController] = []
    
    
// MARK: - Initializator of class
    
    init(window: UIWindow) {
        self.window = window
    }
    
    
//MARK: - Start of coordinator
    
    func start() {
        tabBarController.customeColorsScheme()
        
        createLocationController()
        createSaveController()
        createNaviController()
        createToolsController()
        createSettingsController()
        
        tabBarController.viewControllers = controllers
        
        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
    }
}



//MARK: - Extension for AppCoordinator - Adding private methods, which created UIViewControllers as rootViewControllers for each of the TabBar Items.

private extension AppCoordinator {
    
    //locationController
    private func createLocationController() {
        locationsCoordinator = LocationsCoordinator()
        
        guard let locationController = locationsCoordinator?.start() else { return }
        locationController.tabBarItem = UITabBarItem(title: "Locations", image: UIImage(systemName: "location.fill.viewfinder"), tag: 0)
        
        controllers.append(locationController)
    }
    
    
    //saveController
    private func createSaveController() {
        saveCoordinator = SaveCoordinator(appCoordinator: self)
        
        guard let saveController = saveCoordinator?.start() else { return }
        saveController.tabBarItem = UITabBarItem(title: "Save", image: UIImage(systemName: "square.and.arrow.down"), tag: 1)
        
        controllers.append(saveController)
    }
    
    
    //naviController
    private func createNaviController() {
        navigationCoordinator = NavigationCoordinator()
        
        guard let naviController = navigationCoordinator?.start() else { return }
        naviController.tabBarItem = UITabBarItem(title: "Navi", image: UIImage(systemName: "location.fill"), tag: 2)
        
        controllers.append(naviController)
    }
    
    
    //toolsController
    private func createToolsController() {
        toolsCoordinator = ToolsCoordinator()
        
        guard let toolsController = toolsCoordinator?.start() else { return }
        toolsController.tabBarItem = UITabBarItem(title: "Tools", image: UIImage(systemName: "squareshape.split.2x2"), tag: 3)
        
        controllers.append(toolsController)
    }
    
    
    //settingController
    private func createSettingsController() {
        settingsCoordinator = SettingsCoordinator()
        
        guard let settingsController = settingsCoordinator?.start() else { return }
        settingsController.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "slider.horizontal.3"), tag: 4)
        
        controllers.append(settingsController)
    }
}
