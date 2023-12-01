//
//  Users.swift
//  bigredbids
//
//  Created by Daniel Xie on 12/1/23.
//

import Foundation

struct Users: Codable {
    let id: Int
    let username: String
    let auctions: [Int] // event id
    let bids: [Int] // bid ids
}
