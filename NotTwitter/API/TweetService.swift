//
//  TweetService.swift
//  NotTwitter
//
//  Created by Jake on 2023-06-17.
//
import FirebaseCore
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage

struct TweetService {
    static let shared = TweetService()
    
    func uploadTweet(caption: String, completion: @escaping(Error?, DatabaseReference) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let values = ["uid": uid,
                      "timestamp": Int(NSDate().timeIntervalSince1970),
                      "likes": 0,
                      "retweets": 0,
                      "caption": caption] as [String : Any]
        
        TWEET_REF.childByAutoId().updateChildValues(values, withCompletionBlock: completion)
    }
}
