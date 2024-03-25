import UIKit

class TabBarCoordinator: BaseCoordinator {
    
    private var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        let tabBar = TabBar()
        tabBar.tabBarCoordinator = self
        navigationController.pushViewController(tabBar, animated: true)
    }
}
