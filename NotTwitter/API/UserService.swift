//
//  UserService.swift
//  NotTwitter
//
//  Created by Jake on 2023-06-15.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

struct UserService {
    static let shared = UserService()
    
    func fetchUser(uid: String, completion: @escaping(User) -> Void) {
        USERS_REF.child(uid).observeSingleEvent(of: .value) { snapshot in
            guard let dictonary = snapshot.value as? [String: AnyObject] else { return }
            
         //   guard let username = dictonary["username"] as? String else { return }
         //   guard let fullname = dictonary["fullname"] as? String else { return }
         //   guard let email = dictonary["email"] as? String else { return }
         //   guard let profileImageUrl = dictonary["profileImageUrl"] as? String else { return }
            
            //let user = User(fullname: fullname, email: email, username: username, profileImageUrl: profileImageUrl, uid: uid)
            
            let user = User(uid: uid, dictonary: dictonary)
            completion(user)
        }
    }
}

