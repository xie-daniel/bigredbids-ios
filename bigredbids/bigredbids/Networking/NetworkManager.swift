//
//  NetworkManager.swift
//  A4
//
//  Created by Byounghyun Lee on 2023/11/11.
//

import Alamofire
import Foundation

class NetworkManager {

    /// Shared singleton instance
    static let shared = NetworkManager()

    private let endpoint = "https://api.jsonbin.io/v3/b/64d033f18e4aa6225ecbcf9f?meta=false"

    private let decoder = JSONDecoder()

    private init() { }

    // MARK: - Requests

    func fetchData(completion: @escaping ([Event]) -> Void) {

        decoder.dateDecodingStrategy = .iso8601
        decoder.keyDecodingStrategy = .convertFromSnakeCase

        AF.request(endpoint, method: .get)
            .validate()
            .responseDecodable(of: [Event].self, decoder: decoder) { response in
                switch response.result {
                case .success(let posts):
                    print("SUCCESS!")
                    completion(posts)
                case . failure(let error):
                    print("Error in NetworkManager.fetchData: \(error.localizedDescription)")
                    completion([])
                }
            }
    }

}
