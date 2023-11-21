//
//  UserProfile.swift
//  Motional
//
//  Created by Ryan on 11/20/23.
//

import Foundation

class UserProfile: Codable {
    var username: String
    var email: String
    var bio: String
    
    init(username: String, email: String, bio: String) {
        self.username = username
        self.email = email
        self.bio = bio
    }
}
