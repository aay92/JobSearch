import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var appCoordinator: AppCoordinator?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        if let window {
            appCoordinator = AppCoordinator(window: window)
            appCoordinator?.start()
        }
//        let window = UIWindow(windowScene: windowScene)
//        startDitaelApp(window: window)
    }
    
//    private func startDitaelApp(window: UIWindow){
//        let ditael = DetailModul()
//        let nav = UINavigationController(rootViewController: ditael)
//        self.window = window
//        self.window?.rootViewController = nav
//        self.window?.makeKeyAndVisible()
//    }
}

