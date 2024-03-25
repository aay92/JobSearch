import UIKit

class LoginCoordinator: BaseCoordinator {
    
    private var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        let login = LoginVC()
        login.loginCoordinator = self
        navigationController.pushViewController(login, animated: true)
    }
    
    func moveSendCodeVC(){
        let sendCode = SendCodeCoordinator(
            navigationController: navigationController)
        add(coordinator: sendCode)
        sendCode.start()
        sendCode.remove(coordinator: sendCode)
    }
}
