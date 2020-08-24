//
//  MainTabViewController.swift
//  TwitterClone
//
//  Created by Aman Jaiswal on 19/08/20.
//  Copyright © 2020 Aman Jaiswal. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class MainTabViewController: UITabBarController {
    
    //    MARK: - Setting up action button.
    
    let actionButton : UIButton = {
        
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.backgroundColor = .twitterBlue
        button.setImage(UIImage(named: "new_tweet"),
                        for: .normal)
        
        button.addTarget(self,
                         action: #selector(actionButtonTapped),
                         for: .touchUpInside)
        return button
    }()
    
    //creating and hence setting user inside FeedController.
    
    var user: User? {
        didSet{
            guard let nav = viewControllers?[0] as? UINavigationController else{return}
            guard let feed = nav.viewControllers.first as? FeedController else{return}
            
            feed.user = user
        }
    }
    //    MARK: - ----------------------------------------------------------------------------------------------------------------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .twitterBlue
        authenticateUserAndConfigureUI()
        //                        signOut()
        
    }
    
    //    MARK: - API creation and calling.
    //    Check if user is logged in or not and hence transist user to mainTaViewController or else to login screen.
    
    func authenticateUserAndConfigureUI(){
        if Auth.auth().currentUser == nil {
            
            DispatchQueue.main.async {
                
                let nav = UINavigationController(rootViewController: LoginController())
                nav.modalPresentationStyle = .fullScreen
                self.present(nav, animated: true, completion: nil)
            }
            //            print("User not logged in.")
        }
        else{
            configureUI()
            configureViewController()
            fetchUser()
            print("Welcome User.")
        }
    }
    
    //    function for signing out user from the app.
    
    func signOut(){
        
        do {
            
            try Auth.auth().signOut()
        } catch let error {
            
            print("failed to signout.\(error.localizedDescription)")
        }
    }
    
    //  Calling function for fetching user information from Database.
    
    func fetchUser(){
        
        guard let uid = Auth.auth().currentUser?.uid else {return}
        UserService.shared.fetchUser(uid: uid) { User in
            
            self.user = User
        }
    }
    
    // MARK: - Selectors
    
    @objc func actionButtonTapped(){
        
        print("Button pressed working!")
        
        guard let user = user else {return}
        let controller = UploadTweetController(user: user)
        let nav = UINavigationController(rootViewController: controller)
        nav.modalPresentationStyle = .fullScreen
        present(nav, animated: true, completion: nil)
    }
    
    //MARK: - Helpers.
    
    //    MARK: - Setting up function for configuring UI.
    
    func configureUI(){
        
        view.addSubview(actionButton)
        actionButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor,
                            right: view.rightAnchor,
                            paddingBottom: 64, paddingRight: 16,
                            width: 56, height: 56)
        
        actionButton.layer.cornerRadius = 56 / 2
    }
    
    
    //    MARK: - function for creating all view controllers programatically.
    
    func configureViewController(){
        
        let feed = FeedController(collectionViewLayout: UICollectionViewFlowLayout())
        
        let nav1 = templetNavigationController(image: UIImage(named: "home_unselected"),
                                               rootViewController: feed)
        
        let explore = ExploreController()
        
        let nav2 = templetNavigationController(image: UIImage(named: "search_unselected"),
                                               rootViewController: explore)
        
        let notification = NotificationContorller()
        
        let nav3 = templetNavigationController(image: UIImage(named: "like_unselected"),
                                               rootViewController: notification)
        
        let conversation = ConversationController()
        
        let nav4 = templetNavigationController(image: UIImage(named: "ic_mail_outline_white_2x-1"),
                                               rootViewController: conversation)
        
        
        viewControllers = [nav1, nav2, nav3, nav4]
    }
    
    //    MARK: - Function for setting up navigation controller programatically.
    
    func templetNavigationController(image: UIImage?,
                                     rootViewController: UIViewController) -> UINavigationController
    {
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.tabBarItem.image = image
        nav.navigationBar.barTintColor = .white
        return nav
        
    }
}
