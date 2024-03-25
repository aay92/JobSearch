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
    
    func moveMainVC(){
        let vc = MainViewControllerCoordinator(navigationController: navigationController)
        add(coordinator: vc)
        vc.start()
        vc.remove(coordinator: vc)
    }
}
