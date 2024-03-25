import UIKit

class DitaileCoordinator: BaseCoordinator {
    
    private var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        let vc = DetailModul()
        vc.ditaileCoordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func moveSheetVC(){
        let sheetVCCoordinator = SheetVCCoordinator(
            navigationController: navigationController)
        add(coordinator: sheetVCCoordinator)
        sheetVCCoordinator.start()
        sheetVCCoordinator.remove(coordinator: sheetVCCoordinator)
    }
}
