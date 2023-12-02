//
//  Event.swift
//  bigredbids
//
//  Created by Daniel Xie on 11/29/23.
//

import Foundation


struct Event: Codable {
    let id: Int
    let title: String
    let date: String
    let description: String
    let startingBid: Int
    let highestBid: Int
    let seller: Int // user id of seller
    let status: Bool
    let bids: [Int] // bid ids
}
