//
//  FeedController.swift
//  TwitterClone
//
//  Created by Aman Jaiswal on 19/08/20.
//  Copyright © 2020 Aman Jaiswal. All rights reserved.
//

import UIKit
import SDWebImage


private let reuseIdentifier = "TweetCell"

class FeedController: UICollectionViewController {
    
    //    Creating and hence calling user from MainTabVIewController to show user in Feed Controller.
    
    var user: User? {
        didSet{
            configureLeftBarButton()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        configureUI()
        fetchTweets()
        
    }
    
//    MARK: - Calling API.
    
//    Calling tweet API.
    
    func fetchTweets() {
        tweetService.shared.fetchTweets { tweet in
        
            print("tweets are : - \(tweet)")
        }
    }
    
    //MARK: - Helpers.
    //    function for configuring UI.
    
    func configureUI(){
        
        view.backgroundColor = .white
        
        collectionView.register(TweetCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.backgroundColor = .white
    
        let imageView = UIImageView(image: UIImage(named: "twitter_logo_blue"))
        imageView.contentMode = .scaleAspectFit
        imageView.setDimensions(width: 44, height: 44)
        navigationItem.titleView = imageView
    
    }
    //    function for configuring left bar button for setting profile image.
    
    func configureLeftBarButton(){
        
        guard let user = user else {return}
        let profileImageView = UIImageView()
        profileImageView.setDimensions(width: 32, height: 32)
        profileImageView.layer.cornerRadius = 32 / 2
        profileImageView.layer.masksToBounds = true
        
        //        guard let profileImageUrl = URL(string: user.profileImageUrl) else {return}
        
        profileImageView.sd_setImage(with: user.profileImageUrl,
                                     completed: nil)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: profileImageView)
        
    }
}

//MARK: - Extensions

//Setting extensions for

extension FeedController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! TweetCell
        return cell
    }
}

extension FeedController: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 200)
    }
}
