//
//  HTTPMethod.swift
//  REC - Real Estate Calculator
//
//  Created by timofey makhlay on 12/23/18.
//  Copyright © 2018 Timofey Makhlay. All rights reserved.
//

import Foundation

// Creating an Enum so I don't have to re-type request method
// Avoids issues and misspelling
public enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}
