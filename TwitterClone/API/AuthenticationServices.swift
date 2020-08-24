//
//  AuthenticationServices.swift
//  TwitterClone
//
//  Created by Aman Jaiswal on 21/08/20.
//  Copyright © 2020 Aman Jaiswal. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseStorage
import FirebaseDatabase

//MARK: - Setting up struct for credentials.

struct AuthCredentials {
    let email: String
    let password: String
    let fullName: String
    let userName: String
    let profileImage: UIImage
    
}

//MARK: - Setting up struct for authorization of user and hence defining registerUser and logUserIn functions.

struct AuthService{
    
    static let shared = AuthService()
    
    //    MARK: - Function for registering user.
    
    func registerUser(credentials: AuthCredentials,
                      completion: @escaping (Error?, DatabaseReference) -> Void) {
        
        let email = credentials.email
        let password = credentials.password
        let fullname = credentials.fullName
        let username = credentials.userName
        
        guard let imageData = credentials.profileImage.jpegData(compressionQuality: 0.3) else {return}
        let fileName = NSUUID().uuidString
        
        let storageRef = STORAGE_PROFILE_IMAGES.child(fileName)
        
        storageRef.putData(imageData , metadata: nil) { (meta, error ) in
            
            storageRef.downloadURL { (url, error ) in
                
                guard let profileImageUrl = url?.absoluteString else {return}
                
                //                Creating users.
                
                Auth.auth().createUser(withEmail: email,
                                       password: password)
                { (result, error) in
                    
                    if let error = error {
                        
                        print("error in creating user.\(error)")
                        return
                    }
                    
                    guard let uid = result?.user.uid else {return}
                    
                    let values = ["email": email,
                                  "username": username,
                                  "fullname" : fullname,
                                  "profileImageUrl": profileImageUrl]
                    
                    
                    print("User Created.")
                    // updated datain firebase databse after successful creation of user.
                    
                    
                    REF_USERS.child(uid).updateChildValues(values,
                                                           withCompletionBlock: completion)
                }
            }
        }
    }
    
    //    MARK: - Function for loging in user.
    
    func logUserIn(withEmail email: String,
                   password: String,
                   completion: AuthDataResultCallback?){
        
        Auth.auth().signIn(withEmail: email,
                           password: password,
                           completion: completion)
        
    }
}
