//
//  HTTPTask.swift
//  REC - Real Estate Calculator
//
//  Created by timofey makhlay on 12/23/18.
//  Copyright © 2018 Timofey Makhlay. All rights reserved.
//

import Foundation

public typealias HTTPHeaders = [String:String]

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
