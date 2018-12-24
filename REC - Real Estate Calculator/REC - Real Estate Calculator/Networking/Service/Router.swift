//
//  Router.swift
//  REC - Real Estate Calculator
//
//  Created by timofey makhlay on 12/24/18.
//  Copyright © 2018 Timofey Makhlay. All rights reserved.
//

import Foundation

// This is where most of the work is going to be
// The rest is to be kept private and not messed with

class Router<EndPoint: EndPointType>: NetworkRouter {
    private var task: URLSessionTask?
    
    func request(_ route: EndPoint, completion: @escaping NetworkRouterCompletion) {
        let session = URLSession.shared
        do {
            let request = try self.buildRequest(from: route)
            task = session.dataTask(with: request, completionHandler: { data, response, error in completion(data, response, error)
            })
        } catch {
            completion(nil, nil, error)
        }
        self.task?.resume()
    }
    
    // Cancel function implementation.
    func cancel() {
        self.task?.cancel()
    }
    
    // Function to convert EndPointType to URLSession
    fileprivate func buildRequest(from route: EndPoint) throws -> URLRequest {
        var request = URLRequest(
            url: route.baseUrl.appendingPathComponent(route.path),
            cachePolicy: .reloadIgnoringLocalAndRemoteCacheData,
            timeoutInterval: 10.0)
        
        request.httpMethod = route.httpMethod.rawValue
        do {
            switch route.task {
            case .request:
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            case .requestParameters(
                let bodyParameters,
                let urlParameters
                ):
                try self.configureParameters(
                    bodyParameters: bodyParameters,
                    urlParameters: urlParameters,
                    request: &request
                )
            case .requestParametersAndHeaders(
                let bodyParameters,
                let urlParameters,
                let additionalHeaders
                ):
                
                self.addAdditionalHeaders(additionalHeaders, request: &request)
                try self.configureParameters(
                    bodyParameters: bodyParameters,
                    urlParameters: urlParameters,
                    request: &request
                )
            }
            return request
        } catch {
            throw error
        }
    }
    
    // Function Resposible for encoding parameters
    // API expects bodyParameters as JSON and URLParameters as URL
    // If the API expects anything else, consider adding it in HTTPTask as encoder enum
    fileprivate func configureParameters(
        bodyParameters: Parameters?,
        urlParameters: Parameters?,
        request: inout URLRequest
        ) throws {
        
        do {
            if let bodyParameters = bodyParameters {
                try JSONParameterEncoder.encode(urlRequest: &request, with: bodyParameters)
            }
            if let urlParameters = urlParameters {
                try URLParameterEncoder.encode(urlRequest: &request, with: urlParameters)
            }
        } catch {
            throw error
        }
    }
    
    // Add any additional headers to be part of the request headers
    fileprivate func addAdditionalHeaders(_ additionalHeaders: HTTPHeaders?, request: inout URLRequest) {
        guard let headers = additionalHeaders else { return }
        
        for (key, value) in headers {
            request.setValue(value, forHTTPHeaderField: key)
        }
    }
}
