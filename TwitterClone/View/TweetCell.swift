//
//  TweetCell.swift
//  TwitterClone
//
//  Created by Aman Jaiswal on 24/08/20.
//  Copyright © 2020 Aman Jaiswal. All rights reserved.
//

import UIKit
import SDWebImage

//MARK: - Creating tweet collection view cell.

class TweetCell: UICollectionViewCell {
    
    //    Creating tweet property.
    
    var tweet: Tweet? {
        
        didSet {
            configure()
            
        }
    }
    
    //    Setting up profile image view.
    
    private let profileImageView: UIImageView = {
        
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.setDimensions(width: 50, height: 50)
        iv.layer.cornerRadius = 50 / 2
        iv.backgroundColor = .twitterBlue
        
        return iv
    }()
    
    //    Setting up caption label for feed Controller.
    
    private let captionLabel: UILabel = {
        
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.text = "checking caption label in stack view."
        
        return label
    }()
    
    //MARK: - Setting more buttons for the tweets.
    
    //    Setting comment button.
    
    private lazy var commentButton: UIButton = {
        
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "comment"), for: .normal)
        button.tintColor = .darkGray
        button.setDimensions(width: 20, height: 20)
        button.addTarget(self, action: #selector(handleCommentTapped),
                         for: .touchUpInside)
        return button
    }()
    
    //    Setting retweet button.
    
    private lazy var retweetButton: UIButton = {
        
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "retweet"), for: .normal)
        button.tintColor = .darkGray
        button.setDimensions(width: 20, height: 20)
        button.addTarget(self, action: #selector(handleRetweetTapped),
                         for: .touchUpInside)
        return button
    }()
    
    //    Setting like button.
    
    private lazy var likeButton: UIButton = {
        
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "like"), for: .normal)
        button.tintColor = .darkGray
        button.setDimensions(width: 20, height: 20)
        button.addTarget(self, action: #selector(handleLikeTapped),
                         for: .touchUpInside)
        return button
    }()
    
    //    Setting share button.
    
    private lazy var shareButton: UIButton = {
        
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "share"), for: .normal)
        button.tintColor = .darkGray
        button.setDimensions(width: 20, height: 20)
        button.addTarget(self, action: #selector(handleShareTapped),
                         for: .touchUpInside)
        return button
    }()
    
    //MARK: -    Setting info label.
    
    private let infoLabel = UILabel()
    
    // MARK: - ---------------------------------------------------------------------------------------------------------------------
    
    //   Setting user view in tweet cell.
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //        backgroundColor = .magenta
        addSubview(profileImageView)
        profileImageView.anchor(top: topAnchor,
                                left: leftAnchor,
                                paddingTop: 8,
                                paddingLeft: 8)
        
        //        Creating stack view for userview in feed controller.
        
        let stack = UIStackView(arrangedSubviews: [infoLabel,
                                                   captionLabel])
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.spacing = 4
        
        addSubview(stack)
        stack.anchor(top: profileImageView.topAnchor,
                     left: profileImageView.rightAnchor,
                     right: rightAnchor,
                     paddingLeft: 12,
                     paddingRight: 12)
        
        infoLabel.font = UIFont.systemFont(ofSize: 14)
        //        infoLabel.text = "checking infolabel in stack view."
        
        //        Setting stack view for more buttons for tweet in feed Controller.
        
        let actionStack = UIStackView(arrangedSubviews: [commentButton,
                                                         retweetButton,
                                                         likeButton,
                                                         shareButton])
        actionStack.axis = .horizontal
        actionStack.spacing = 72
        
        addSubview(actionStack)
        actionStack.centerX(inView: self)
        actionStack.anchor(bottom: bottomAnchor,
                           paddingBottom: 8)
        
        //        Creating underline view i.e a divider between two tweets.
        
        let underlineView = UIView()
        underlineView.backgroundColor = .systemGroupedBackground
        addSubview(underlineView)
        
        underlineView.anchor(left: leftAnchor,
                             bottom:  bottomAnchor,
                             right: rightAnchor,
                             height: 1)
    }
    
    //    MARK: - API creation and calling.
    
    
    //    MARK: - Selectors.
    
    @objc func handleCommentTapped() {
        
        
    }
    
    @objc func handleRetweetTapped() {
        
        
    }
    
    @objc func handleLikeTapped() {
        
        
    }
    
    @objc func handleShareTapped() {
        
        
    }
    
    //    MARK: - Helpers.
    
    //    MARK: - Setting and calling configue UI function.
    
    func configure(){
        //        print("print tweet in cell: -")
        
        //        setting UIView of feed controller with the help of ViewModel file and hence defining all the functionality in viewmodel file.
        
        guard let tweet = tweet else {return}
        let viewModel = TweetViewModel(tweet: tweet)
        
        captionLabel.text = tweet.caption
        profileImageView.sd_setImage(with: viewModel.profileImageUrl)
        infoLabel.attributedText = viewModel.userInfoText
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
