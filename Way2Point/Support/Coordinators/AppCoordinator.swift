import UIKit

//MARK: - Final class AppCoordinator - Creating and managing for TabBarController

final class AppCoordinator {
    
    
//MARK: - Properties of class
    
    let window: UIWindow
    
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
        let tabBarController = UITabBarController()
        tabBarController.customeColorsScheme()
        
        createLocationController()
        let saveController = createSaveController()
        let naviController = createNaviController()
        let toolsController = createToolsController()
        let settingsController = createSettingsController()
        
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
    private func createSaveController() -> UIViewController {
        saveCoordinator = SaveCoordinator()
        
        guard let saveController = saveCoordinator?.rootViewController else { return UIViewController()}
        saveController.tabBarItem = UITabBarItem(title: "Save", image: UIImage(systemName: "square.and.arrow.down"), tag: 1)
        
        controllers.append(saveController)

        saveCoordinator?.start()
        return saveController
    }
    
    
    //naviController
    private func createNaviController() -> UIViewController {
        navigationCoordinator = NavigationCoordinator()
        
        guard let naviController = navigationCoordinator?.rootViewController else { return UIViewController()}
        naviController.tabBarItem = UITabBarItem(title: "Navi", image: UIImage(systemName: "location.fill"), tag: 2)
        
        controllers.append(naviController)

        navigationCoordinator?.start()
        return naviController
    }
    
    
    //toolsController
    private func createToolsController() -> UIViewController {
        toolsCoordinator = ToolsCoordinator()
        
        guard let toolsController = toolsCoordinator?.rootViewController else { return UIViewController()}
        toolsController.tabBarItem = UITabBarItem(title: "Tools", image: UIImage(systemName: "squareshape.split.2x2"), tag: 3)
        
        controllers.append(toolsController)

        toolsCoordinator?.start()
        return toolsController
    }
    
    
    //settingController
    private func createSettingsController() -> UIViewController {
        settingsCoordinator = SettingsCoordinator()
        
        guard let settingsController = settingsCoordinator?.rootViewController else { return UIViewController()}
        settingsController.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "slider.horizontal.3"), tag: 4)
        
        controllers.append(settingsController)

        settingsCoordinator?.start()
        return settingsController
    }
}
