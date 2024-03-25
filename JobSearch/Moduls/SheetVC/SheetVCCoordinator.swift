import UIKit

class SheetVCCoordinator: BaseCoordinator {
    
    private var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        let vc = SheetVC()
        vc.sheetVCCoordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
}
