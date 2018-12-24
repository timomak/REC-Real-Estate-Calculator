//
//  EndPointProtocol.swift
//  REC - Real Estate Calculator
//
//  Created by timofey makhlay on 12/23/18.
//  Copyright © 2018 Timofey Makhlay. All rights reserved.
//

import UIKit

// EndPouit is a Corner stone to connect everything
protocol EndPointType {
    var baseUrl: URL {get}
    var path: String {get}
    var httpMethod: HTTPMethod {get}
    var task: HTTPTask {get}
    var headers: HTTPHeaders? {get}
}

