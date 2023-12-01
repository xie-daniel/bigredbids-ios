//
//  Bid.swift
//  bigredbids
//
//  Created by Daniel Xie on 12/1/23.
//

import Foundation

struct Bid: Codable {
    let id: Int
    let amount: Int
    let accepted: Bool
    let createdAt: String
    let bidder: Int // user id of bidder
    let auction: Int // auction id
}
