import UIKit

protocol Coordinator: AnyObject {
    var childCoordinator: [Coordinator] { get set }
    func start()
}

extension Coordinator {
    func add(coordinator: Coordinator) {
        childCoordinator.append(coordinator)
    }
    
    func remove(coordinator: Coordinator){
        childCoordinator = childCoordinator.filter{ $0 !== coordinator}
    }
}
