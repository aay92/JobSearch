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
    
//    override func start() {
//        let vc = SheetVC()
//        vc.sheetVCCoordinator = self
//        vc.modalPresentationStyle = .formSheet
//        let sheet = vc.sheetPresentationController
//        let multiplier = 0.20
//        let fraction = UISheetPresentationController.Detent.custom { context in
//            400
//        }
//        sheet?.detents = [fraction]
//        navigationController.present(vc, animated: true)
//    }
    
//    func start(){
//        let sendCode = SendCodeCoordinator(
//            navigationController: navigationController)
//        add(coordinator: sendCode)
//        sendCode.start()
//        sendCode.remove(coordinator: sendCode)
//        
//    }
}
