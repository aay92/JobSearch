import UIKit

class BaseCoordinator: Coordinator {
    var childCoordinator: [Coordinator] = []
    func start() {}
    func startTabBar(){}
}
