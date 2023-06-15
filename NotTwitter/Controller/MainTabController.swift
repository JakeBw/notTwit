//
//  MainTabController.swift
//  NotTwitter
//
//  Created by Jake on 2023-05-27.
//

import UIKit

class MainTabController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewControllers()
        uiTabBarSetting()
        


        // Do any additional setup after loading the view.
    }
    
    func uiTabBarSetting() {
        if #available(iOS 15.0, *){
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = .white
            tabBar.standardAppearance = appearance
            tabBar.scrollEdgeAppearance = appearance
        }
    }
    
    func templateNavigationController(image: UIImage?, rootViewController: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.tabBarItem.image = image
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white
        
        nav.navigationBar.standardAppearance = appearance
        nav.navigationBar.scrollEdgeAppearance = nav.navigationBar.standardAppearance
        
        return nav
    }
    
    func configureViewControllers() {
        
        let feed = FeedController()
        let nav1 = templateNavigationController(image: UIImage?.none, rootViewController: feed)
        nav1.tabBarItem.image = UIImage(named: "home_unselected")
        nav1.title = "Home"
        
        let explore = ExploreController()
        let nav2 = templateNavigationController(image: UIImage?.none, rootViewController: explore)
        nav2.tabBarItem.image = UIImage(named: "search_unselected")
        nav2.title = "Explore"
        
        let notifications = NotificationsController()
        let nav3 = templateNavigationController(image: UIImage?.none, rootViewController: notifications)
        nav3.tabBarItem.image = UIImage(named: "search_unselected")
        nav3.title = "Notifications"
        
        let conversations = ConversationsController()
        let nav4 = templateNavigationController(image: UIImage?.none, rootViewController: conversations)
        nav4.tabBarItem.image = UIImage(named: "search_unselected")
        nav4.title = "Messages"
        
        viewControllers = [nav1, nav2, nav3, nav4]
    }
}
