//
//  TweetViewModel.swift
//  TwitterClone
//
//  Created by Aman Jaiswal on 25/08/20.
//  Copyright © 2020 Aman Jaiswal. All rights reserved.
//

import UIKit

//MARK: - Structure for creating View model.

//Creating text view model for Feed Controller.

struct TweetViewModel {
    
    let tweet: Tweet
    let user: User
    
    var profileImageUrl: URL? {
        
        return user.profileImageUrl
    }
    
    //    Creating user info to be displayed in feed Controller along with the tweets from the user.
    
    var userInfoText: NSAttributedString {
        
        let title = NSMutableAttributedString(string: user.fullname,
                                              attributes: [.font: UIFont.boldSystemFont(ofSize: 14)])
        
        title.append(NSAttributedString(string: " @\(user.username)",
            attributes: [.font: UIFont.boldSystemFont(ofSize: 14), .foregroundColor: UIColor .lightGray]))
        
        title.append(NSAttributedString(string: " ・ \(timestamp)",
            attributes: [.font: UIFont.boldSystemFont(ofSize: 14), .foregroundColor: UIColor .lightGray]))
        
        return title
    }
    
    //MARK: -    Cerating timestamp to show when the tweet was actually posted.
    
    var timestamp: String {
        
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.second,
                                  .month,
                                  .hour,
                                  .day,
                                  .weekOfMonth]
        
        formatter.maximumUnitCount = 1
        formatter.unitsStyle = .abbreviated
        
        let now = Date()
        return formatter.string(from: tweet.timeStamp,
                                to: now)  ?? ""
    }
    
    init(tweet: Tweet) {
        self.tweet = tweet
        self.user = tweet.user
    }
}
