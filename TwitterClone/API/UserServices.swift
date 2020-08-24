//
//  UserServices.swift
//  TwitterClone
//
//  Created by Aman Jaiswal on 22/08/20.
//  Copyright © 2020 Aman Jaiswal. All rights reserved.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseDatabase
import FirebaseDatabase

//MARK: - Struct for user services i.e fetching users data from the database.

struct UserService {
    
    static let shared = UserService()
    
    //    Creating function for fetching userData from the database.
    
    func fetchUser(uid: String, completion: @escaping(User) -> Void){
        
        //        guard let uid = Auth.auth().currentUser?.uid else {return}
        
        REF_USERS.child(uid).observeSingleEvent(of: .value) { snapshot in
            
            guard let dictionary = snapshot.value as? [String: AnyObject] else {return}
            
            let user = User(uid: uid,
                            dictionary: dictionary)
            
            //            print("user name is: \(user.username)")
            //            print("user name is: \(user.fullname)")
            
            completion(user)
        }
    }
}
