//
//  NetworkManager.swift
//  bigredbids
//
//  Created by Byounghyun Lee on 2023/11/11.
//

import Alamofire
import Foundation

class NetworkManager {

    /// Shared singleton instance
    static let shared = NetworkManager()

    private let decoder = JSONDecoder()

    private init() { }

    // MARK: - Requests

    func fetchAuctions(completion: @escaping ([Event]) -> Void) {

        let endpoint = "http://34.48.73.101/api/auctions/"
        
        decoder.keyDecodingStrategy = .convertFromSnakeCase

        AF.request(endpoint, method: .get)
            .validate()
            .responseDecodable(of: [Event].self, decoder: decoder) { response in
                switch response.result {
                case .success(let events):
                    print("SUCCESS!")
                    completion(events)
                case .failure(let error):
                    print("Error in NetworkManager.fetchData: \(error)")
                    completion([])
                }
            }
    }
    
    func tryLogin(username: String, password: String, completion: @escaping (Users) -> Void) {
        let endpoint = "http://34.48.73.101/api/login/"
        
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        let parameters: Parameters = [
            "username": username,
            "password": password
        ]
        
        AF.request(endpoint, method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .validate()
            .responseDecodable(of: Users.self, decoder: decoder) { response in
                switch response.result {
                case .success(let userId):
                    completion(userId)
                case .failure(_):
                    print("failed to login")
                }
            }
    }
    
    func createUser(username: String, password: String, completion: @escaping (Users) -> Void) {
        
        let endpoint = "http://34.48.73.101/api/users/"
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        let parameters: Parameters = [
            "username": username,
            "password": password
        ]
        
        AF.request(endpoint, method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .validate()
            .responseDecodable(of: Users.self, decoder: decoder) { response in
                switch response.result {
                case .success(let user):
                    completion(user)
                case .failure(let error):
                    print("failed to create account \(error)")
                }
            }
    }
    
    func createAuction(name: String, date: String, startingBid: Int, description: String, userId: Int, completion: @escaping (Event) -> Void) {
        
        let endpoint = "http://34.48.73.101/api/auctions/\(userId)"
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        let parameters: Parameters = [
            "title": name,
            "date": date,
            "starting_bid": startingBid,
            "description": description
        ]
        
        AF.request(endpoint, method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .validate()
            .responseDecodable(of: Event.self, decoder: decoder) { response in
                switch response.result {
                case .success(let event):
                    completion(event)
                case .failure(let error):
                    print("failed to create event \(error)")
                }
            }
    }
    

}
