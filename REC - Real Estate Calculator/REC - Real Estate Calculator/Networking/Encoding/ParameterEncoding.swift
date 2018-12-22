//
//  ParameterEncoding.swift
//  REC - Real Estate Calculator
//
//  Created by timofey makhlay on 12/23/18.
//  Copyright © 2018 Timofey Makhlay. All rights reserved.
//

import Foundation

public typealias Parameters = [String: Any]

public protocol ParameterEncoder {
    static func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws
}

public enum NetworkError: String, Error {
    case parametersNil = "Parameters were nil"
    case encodingFailed = "Parameters encoding Failed"
    case missingURL = "URL is Nil"
}
