//
//  HTTPTask.swift
//  REC - Real Estate Calculator
//
//  Created by timofey makhlay on 12/23/18.
//  Copyright © 2018 Timofey Makhlay. All rights reserved.
//

import Foundation


// Type Alias
public typealias HTTPHeaders = [String:String]

// Resposible for configuring parameters for EndPoints
// You can add as many tasks you'd like, for now only requests
public enum HTTPTask {
    
    case request
    
    case requestParameters(bodyParameters: Parameters?,
        urlParameters: Parameters?)
    
    case requestParametersAndHeaders(
        bodyParameters: Parameters?,
        urlParameters: Parameters?,
        additionHeaders: HTTPHeaders?
    )
}
