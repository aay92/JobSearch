import UIKit

class AppCoordinator: BaseCoordinator {
    private var window: UIWindow
    
    private var navigationController: UINavigationController = {
        let navigationController = UINavigationController()
        return navigationController
    }()
    
    init(window: UIWindow) {
        self.window = window
        self.window.rootViewController = navigationController
        self.window.makeKeyAndVisible()
    }
    
    override func start() {
        let loginCoordinator = LoginCoordinator(
            navigationController: navigationController)
        add(coordinator: loginCoordinator)
        loginCoordinator.start()
    }
}


