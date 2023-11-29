//
//  User.swift
//  bigredbids
//
//  Created by Daniel Xie on 11/28/23.
//

import Foundation

struct User: Codable {
    let id: Int
    let username: String
    let password_hash: String
}

extension User {
    
    static let dummyData: [User] = [
        User(id:1, username:"testuser", password_hash:"testpass")
    ]
}

