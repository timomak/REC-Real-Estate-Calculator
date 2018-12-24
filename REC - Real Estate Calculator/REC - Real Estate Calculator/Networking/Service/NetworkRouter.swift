//
//  NetworkRouter.swift
//  REC - Real Estate Calculator
//
//  Created by timofey makhlay on 12/24/18.
//  Copyright © 2018 Timofey Makhlay. All rights reserved.
//

import Foundation

public typealias NetworkRouterCompletion = (_ data: Data?,_ response: URLResponse?,_ error: Error?) -> ()

// Very Useful if you have a downloading and Uploading function
// Run a request and stopping it
protocol NetworkRouter: class {
    associatedtype EndPoint: EndPointType
    func request(_ route: EndPoint, completion: @escaping NetworkRouterCompletion)
    func cancel()
}
