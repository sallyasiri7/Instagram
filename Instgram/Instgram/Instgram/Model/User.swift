//
//  User.swift
//  Instgram
//
//  Created by sally asiri on 06/05/1443 AH.
//

import Foundation
import Firebase

struct User {
    
    let email: String
    let fullname: String
    let profileImageUrl: String
    let username: String
    let uid: String
    
    var isFollowed = false
    
    var stats: UserStats!
    
    var isCurrentUser: Bool { return Auth.auth().currentUser?.uid == uid }
    
    init(dictionary: [String: Any]) {
        self.email = dictionary["email"] as? String ?? ""
        self.fullname = dictionary["fillname"] as? String ?? ""
        self.profileImageUrl = dictionary["profileImageUrl"] as? String ?? ""
        self.username = dictionary["username"] as? String ?? ""
        self.uid = dictionary["uid"] as? String ?? ""
        
        self.stats = UserStats(followers: 100, folloeing: 250)
    }
    
}

struct UserStats {
    
    let followers: Int
    let folloeing: Int
  //  let posts: Int
    
}


