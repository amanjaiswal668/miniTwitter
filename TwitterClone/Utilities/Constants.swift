//
//  Constants.swift
//  TwitterClone
//
//  Created by Aman Jaiswal on 21/08/20.
//  Copyright © 2020 Aman Jaiswal. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseCore
import FirebaseAuth

//MARK: - Creating constants for Storages.
let STORAGE_REF = Storage.storage().reference()

let STORAGE_PROFILE_IMAGES = STORAGE_REF.child("profile_images")

//MARK: - Creating constants for Database references.

let DB_REF = Database.database().reference()

let REF_USERS = DB_REF.child("users")

//MARK: - Creating references for Tweets.

let REF_TWEETS = DB_REF.child("tweets")
