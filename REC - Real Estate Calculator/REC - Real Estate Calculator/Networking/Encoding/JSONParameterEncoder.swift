//
//  JSONParameterEncoder.swift
//  REC - Real Estate Calculator
//
//  Created by timofey makhlay on 12/24/18.
//  Copyright © 2018 Timofey Makhlay. All rights reserved.
//

import Foundation

// Encoding Json Data
public struct JSONParameterEncoder: ParameterEncoder {
    public static func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws {
        do {
            let jsonAsData = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
            urlRequest.httpBody = jsonAsData
            if urlRequest.value(forHTTPHeaderField: "Content-Type") == nil {
                urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
            }
        } catch {
            throw NetworkError.encodingFailed
        }
    }
}
