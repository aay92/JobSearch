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
    
    func moveTabBar(){
        navigationController.popToRootViewController( animated: true )
        navigationController.viewControllers.removeAll()
        DispatchQueue.main.asyncAfter(deadline: .now()+1) {
            UIView.animate(withDuration: 0.5) {
                let tabBar = TabBarCoordinator(navigationController: self.navigationController)
                tabBar.add(coordinator: tabBar)
                tabBar.start()
                tabBar.remove(coordinator: tabBar)
            }
        }
    }
}
