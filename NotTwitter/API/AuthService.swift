//
//  AuthService.swift
//  NotTwitter
//
//  Created by Jake on 2023-06-15.
//
import UIKit
import FirebaseAuth
import FirebaseStorage
import FirebaseDatabase


struct AuthCredentials {
    let email: String
    let password: String
    let fullname: String
    let username: String
    let profileImage: UIImage
}

struct AuthService {
    static let shared = AuthService()
    
    func logUserIn(withEmail email: String, password: String, completion: @escaping(AuthDataResult?, Error?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password, completion: completion)
    }
    
    func registerUser(credentials: AuthCredentials, completion: @escaping(Error?, DatabaseReference) -> Void) {
        guard let imageData = credentials.profileImage.jpegData(compressionQuality: 0.4) else { return }
        
        let filename = NSUUID().uuidString
        let email = credentials.email
        let password = credentials.password
        let username = credentials.username
        let fullname = credentials.fullname
        
        let storageRef = STORAGE_PROFILE_IMAGES.child(filename)
        
        storageRef.putData(imageData, metadata: nil) { (meta, error ) in
            storageRef.downloadURL { url, error in
                guard let profileImageUrl = url?.absoluteString else { return }
                
                Auth.auth().createUser(withEmail: email, password: password) { (AuthDataResult, error) in
                    if let error = error {
                print("DEBUG: Response is \(error.localizedDescription)")
                    return
                }
                    
            guard let uid = AuthDataResult?.user.uid else { return }
                    
            let values = ["email": email,
                          "username": username,
                          "fullname": fullname,
                          "profileImageUrl": profileImageUrl]
                    USERS_REF.child(uid).updateChildValues(values,withCompletionBlock: completion)

                    }
                }
                
            }
        }
    }
