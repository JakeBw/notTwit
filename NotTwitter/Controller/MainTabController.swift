//
//  MainTabController.swift
//  NotTwitter
//
//  Created by Jake on 2023-05-27.
//

import UIKit

class MainTabController: UITabBarController {

    let actionButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.backgroundColor = .twitterBlue
        button.setImage(UIImage(named: "new_tweet"), for: .normal)
        button.addTarget(self, action: #selector(actionButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewControllers()
        uiTabBarSetting()
        configureUI()
    }
    
    @objc func actionButtonTapped() {
        print("To be worked on later")
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
    
    func configureUI() {
        view.addSubview(actionButton)
        actionButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor,
                            paddingBottom: 64, paddingRight: 16, width: 56, height: 56)
        actionButton.layer.cornerRadius = 56 / 2
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
        nav3.tabBarItem.image = UIImage(named: "like_unselected")
        nav3.title = "Notifications"
        
        let conversations = ConversationsController()
        let nav4 = templateNavigationController(image: UIImage?.none, rootViewController: conversations)
        nav4.tabBarItem.image = UIImage(named: "mail 1")
        nav4.title = "Messages"
        
        viewControllers = [nav1, nav2, nav3, nav4]
    }
}
