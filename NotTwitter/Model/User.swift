//
//  User.swift
//  NotTwitter
//
//  Created by Jake on 2023-06-15.
//

import Foundation

struct User {
    let fullname: String
    let email: String
    let username: String
    let profileImageUrl: String
    let uid: String
    
    init(uid: String, dictonary: [String: AnyObject]) {
        self.uid = uid
        self.fullname = dictonary["fullname"] as? String ?? "" 
        self.email = dictonary["email"] as? String ?? ""
        self.username = dictonary["username"] as? String ?? ""
        self.profileImageUrl = dictonary["profileImageUrl"] as? String ?? ""
    }
}
