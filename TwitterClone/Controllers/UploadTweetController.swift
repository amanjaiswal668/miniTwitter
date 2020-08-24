//
//  UploadTweetController.swift
//  TwitterClone
//
//  Created by Aman Jaiswal on 22/08/20.
//  Copyright © 2020 Aman Jaiswal. All rights reserved.
//

import UIKit

class UploadTweetController: UIViewController{
    
    //    MARK: -
    private let user: User
    
    //    Setting up tweet button.
    private lazy var actionButton: UIButton = {
        
        let button = UIButton(type: .system)
        button.backgroundColor = .twitterBlue
        button.setTitle("Tweet", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = .boldSystemFont(ofSize: 16)
        button.setTitleColor(.white, for: .normal)
        
        button.frame = CGRect(x: 0, y: 0, width: 64, height: 32)
        button.layer.cornerRadius = 32 / 2
        
        button.addTarget(self, action: #selector(handelUploadTweet), for: .touchUpInside)
        
        return button
    }()
    
    //    Setting up profile image view.
    
    private let profileImageView: UIImageView = {
        
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.setDimensions(width: 50, height: 50)
        iv.layer.cornerRadius = 50 / 2
        //        iv.backgroundColor = .twitterBlue
        return iv
    }()
    
    //    MAARK: - Calling captionTextView.
    private let captionText = captionTextView()
    
    // initializing user.
    
    init(user: User) {
        
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
        print("user is : - \(user.username)")
    }
    
    
    //    MARK: - API creation and calling.
    
    
    //    MARK: - Selectors
    
    @objc func handleCancel() {
        
        dismiss(animated: true, completion: nil)
        
    }
    
    @objc func handelUploadTweet(){
        
        //        print("Upload tweets.")
        guard let caption = captionText.text else {return}
        tweetService.shared.uploadTweet(caption: caption) { (error, ref) in
            
            if let error = error{
                
                print("Error creasting tweets. \(error.localizedDescription)")
                return
            }
            self.dismiss(animated: true, completion: nil)
        }
    }
    //    MARK: - Helpers
    //    Function for cnfiguring UI.
    
    func configureUI(){
        
        view.backgroundColor = .white
        navigationBar()
        
        let stack = UIStackView(arrangedSubviews: [profileImageView,
                                                   captionText])
        stack.axis = .horizontal
        stack.spacing = 12
        
        view.addSubview(stack)
        stack.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                     left: view.leftAnchor,
                     right: view.rightAnchor,
                     paddingTop: 16,
                     paddingLeft: 16,
                     paddingRight: 16)
        
        profileImageView.sd_setImage(with: user.profileImageUrl, completed: nil)
    }
    
    //    MARK: - Function for configuring navigation bar.
    
    func navigationBar(){
        
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.isTranslucent = false
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel,
                                                           target: self,
                                                           action: #selector(handleCancel))
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: actionButton)
        
    }
}
