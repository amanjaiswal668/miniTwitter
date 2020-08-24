//
//  User.swift
//  TwitterClone
//
//  Created by Aman Jaiswal on 22/08/20.
//  Copyright © 2020 Aman Jaiswal. All rights reserved.
//

import Foundation

//MARK: - Creating User structure for database.
struct User {
    let fullname: String
    let email: String
    let username: String
    var profileImageUrl: URL?
    let uid: String
    
    //    Initializing user into a dictionary.
    
    init(uid: String, dictionary: [String: AnyObject]) {
        self.uid = uid
        self.fullname = dictionary["fullname"] as? String ?? "Default Value"
        self.email = dictionary["email"] as? String ?? "Default Value"
        self.username = dictionary["username"] as? String ?? "Default Value"
        
        if let profileImageUrl = dictionary["profileImageUrl"] as? String {
            
            guard let url = URL(string: profileImageUrl) else {return}
            self.profileImageUrl = url
        }
    }
}
