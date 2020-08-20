//
//  MainTabViewController.swift
//  TwitterClone
//
//  Created by Aman Jaiswal on 19/08/20.
//  Copyright © 2020 Aman Jaiswal. All rights reserved.
//

import UIKit

class MainTabViewController: UITabBarController {

    let actionButton : UIButton = {
        
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.backgroundColor = .twitterBlue
        button.setImage(UIImage(named: "new_tweet"), for: .normal)
        
        button.addTarget(self, action: #selector(actionButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        configureViewController()
        configureUI()
    }
    
// MARK: - Selectors
    
    @objc func actionButtonTapped(){
        
        print("Button pressed working!")
    }

//MARK: - Helpers.
    
    func configureUI(){
        
        view.addSubview(actionButton)
        actionButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingBottom: 64, paddingRight: 16, width: 56, height: 56)
        
        actionButton.layer.cornerRadius = 56 / 2
    }
//    function to create all view controllers programatically.
    
    func configureViewController(){
        
        let feed = FeedController()
        
        let nav1 = templetNavigationController(image: UIImage(named: "home_unselected"), rootViewController: feed)
        
        let explore = ExploreController()
        
        let nav2 = templetNavigationController(image: UIImage(named: "search_unselected"), rootViewController: explore)
        
        let notification = NotificationContorller()
        
        let nav3 = templetNavigationController(image: UIImage(named: "like_unselected"), rootViewController: notification)
        
        let conversation = ConversationController()
        
        let nav4 = templetNavigationController(image: UIImage(named: "ic_mail_outline_white_2x-1"), rootViewController: conversation)
        
        
        viewControllers = [nav1, nav2, nav3, nav4]
    }
    
    func templetNavigationController(image: UIImage?, rootViewController: UIViewController) -> UINavigationController
    {
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.tabBarItem.image = image
        nav.navigationBar.barTintColor = .white
        return nav
        
    }
}
