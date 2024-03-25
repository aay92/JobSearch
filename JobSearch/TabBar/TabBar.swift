import UIKit

class TabBar: UITabBarController, UITabBarControllerDelegate {

    weak var tabBarCoordinator: TabBarCoordinator?

    var boolIs = false
    
    private let arraysVC = [MainViewController(),
                            FavoriteVC(),
                            DetailModul(),
                            UIViewController(),
                            UIViewController()]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        createItemsTabBar(vcArr: arraysVC)
        colorTint()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        isEnableItemsInTabs(tabBar: tabBar, isEnable: boolIs)
    }
    
    private func colorTint(){
        tabBar.barTintColor = AppColor.colorTabBarBG
        tabBar.tintColor = AppColor.colorTabBarBlue
        tabBar.unselectedItemTintColor = AppColor.colorTabBarGray4
    }
    
    
    func isEnableItemsInTabs(tabBar: UITabBar, isEnable: Bool){
        if isEnable {
            if let items = tabBar.items {
                items.forEach { $0.isEnabled = false }
            }
        }
    }
   //Create items
    /// Можно через цикл сделать функцию,
    /// чтобы метод был короче и красивее и не было повторяющегося кода,
    /// но не хватило времени : - (
    private func createItemsTabBar(vcArr: [UIViewController]){
        let item1 = vcArr[0]
        let icon1 = UITabBarItem(title: "Поиск",
                                 image: UIImage(named: "loop"),
                                 selectedImage: UIImage(named: "loop"))
        item1.tabBarItem = icon1
        
        let item2 = vcArr[1]
        item2.view.backgroundColor = AppColor.bdColorShadows
        let icon2 = UITabBarItem(title: "Избраное",
                                 image: UIImage(named: "Heart"),
                                 selectedImage: UIImage(named: "Heart"))
        item2.tabBarItem = icon2
        
        let item3 = vcArr[2]
        item3.view.backgroundColor = AppColor.bdColorShadows
        let icon3 = UITabBarItem(title: "Отклики",
                                 image: UIImage(named: "massage"),
                                 selectedImage: UIImage(named: "massage"))
        item3.tabBarItem = icon3
        
        let item4 = vcArr[3]
        item4.view.backgroundColor = AppColor.bdColorShadows
        let icon4 = UITabBarItem(title: "Сообщение",
                                 image: UIImage(named: "cloud"),
                                 selectedImage: UIImage(named: "cloud"))
        item4.tabBarItem = icon4
        
        let item5 = vcArr[4]
        item4.view.backgroundColor = AppColor.bdColorShadows
        let icon5 = UITabBarItem(title: "Профиль",
                                 image: UIImage(named: "Icon"),
                                 selectedImage: UIImage(named: "Icon"))
        item5.tabBarItem = icon5
        
        let controllers = [item1, item2, item3, item4, item5]
        self.viewControllers = controllers
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        print("Should select viewController: \(viewController.title ?? "") ?")
        return true;
    }
}
