import UIKit

class SendCodeCoordinator: BaseCoordinator {
    
    private var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        let sendCodeVC = SendCodeVC()
        sendCodeVC.sendCodeVC = self
        navigationController.pushViewController(sendCodeVC, animated: true)
    }
}
