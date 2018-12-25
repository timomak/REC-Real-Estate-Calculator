//
//  NetworkManager.swift
//  REC - Real Estate Calculator
//
//  Created by timofey makhlay on 12/25/18.
//  Copyright © 2018 Timofey Makhlay. All rights reserved.
//

import Foundation

struct NetworkManager {
    static let environment: NetworkEnvironment = .production
    // Get API Key
    static let MovieAPIKey = "Your_API_Key"
    private let router = Router<MovieApi>()
    
    enum NetworkResponse: String {
        case success
        case authenticationError = "You need autherntication first"
        case badRequest = "Bad Request"
        case outDated = "The url you requested is outdated"
        case failed = "Network request failed"
        case noData = "Response returned with no data to decode"
        case unableToDecode = "We could not decode the response"
    }
    
    enum Result<String> {
        case success
        case failure(String)
    }
    
    fileprivate func handleNetworkResponse(_ response: HTTPURLResponse) -> Result<String> {
        switch response.statusCode {
        case 200...299: return .success
        case 401...500: return .failure(NetworkResponse.authenticationError.rawValue)
        case 501...599: return .failure(NetworkResponse.badRequest.rawValue)
        case 600: return .failure(NetworkResponse.outDated.rawValue)
        default: return .failure(NetworkResponse.failed.rawValue)
        }
    }

    
    func getNewMovies(page: Int, completion: @escaping (_ movie: [Movie]?, _ error: String?)->()) {
        router.request(.newMovies(page: page)) { data, response, error in
            if error != nil {
                completion(nil, "Please check your network connection")
            }
            
            if let response = response as? HTTPURLResponse {
                let result = self.handleNetworkResponse(response)
                switch result {
                case .success:
                    guard let responseData = data else {
                        completion(nil, NetworkResponse.noData.rawValue)
                        return
                    }
                    
                    do {
                        let apiResponse = try JSONDecoder().decode(MovieApiResponse.self, from: responseData)
                    } catch {
                        completion(nil, NetworkResponse.unableToDecode.rawValue)
                    }
                case .failure(let networkFailureError):
                    completion(nil, networkFailureError)
                }
            }
        }
    }
}



