//
//  Tweet.swift
//  TwitterClone
//
//  Created by Aman Jaiswal on 23/08/20.
//  Copyright © 2020 Aman Jaiswal. All rights reserved.
//

import Foundation

struct Tweet {
    
    let caption: String
    let tweetId: String
    let uid: String
    let likes: Int
    var timeStamp: Date!
    let retweetcount: Int
    
    init(tweetId: String, dictionary: [String:  Any]) {
        self.tweetId = tweetId
        
        self.caption = dictionary["caption"] as? String ?? ""
        self.uid = dictionary["uid"] as? String ?? ""
        self.likes = dictionary["likes"] as? Int ?? 0
        self.retweetcount = dictionary["retweets"] as? Int ?? 0
        
//        self.caption = dictionary["caption"] as? String ?? ""
        
        if let timestamp = dictionary["timestamp"] as? Double {
            
            self.timeStamp = Date(timeIntervalSince1970: timestamp)
        }
    }
    
}
