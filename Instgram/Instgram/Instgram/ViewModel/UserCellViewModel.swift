//
//  UserCellViewModel.swift
//  Instgram
//
//  Created by sally asiri on 06/05/1443 AH.
//

import Foundation

struct UserCellViewModel {
    private let user: User
    
    var profileImageUrl: URL? {
        return URL(string: user.profileImageUrl)
    }
    
    var username: String {
        return user.username
    }
    
    
    
    var fullname: String {
        return user.fullname
    }
    
    init(user: User) {
        self.user = user
    }
}
