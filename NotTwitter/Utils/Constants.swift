//
//  Constants.swift
//  NotTwitter
//
//  Created by Jake on 2023-06-15.
//

import FirebaseDatabase
import FirebaseStorage


let DB_REF = Database.database().reference()
let USERS_REF = DB_REF.child("users")

let STORAGE_REF = Storage.storage().reference()
let STORAGE_PROFILE_IMAGES = STORAGE_REF.child("profile_images")

let TWEET_REF = DB_REF.child("tweets")
