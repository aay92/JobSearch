import UIKit

class MainViewControllerCoordinator: BaseCoordinator {
    
    private var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        let mainViewController = MainViewController()
        mainViewController.mainViewControllerCoordinator = self
        navigationController.pushViewController(mainViewController, animated: true)
    }
    
    func moveDetailsVC(){
        let coordinator = DitaileCoordinator(navigationController: navigationController)
        add(coordinator: coordinator)
        coordinator.start()
        coordinator.remove(coordinator: coordinator)
    }
}
