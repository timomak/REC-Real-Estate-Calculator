//
//  TestingNetworkLayer.swift
//  REC - Real Estate Calculator
//
//  Created by timofey makhlay on 12/25/18.
//  Copyright © 2018 Timofey Makhlay. All rights reserved.
//

import Foundation
import UIKit

class MainViewController: UIViewController {
    
    var networkManager: NetworkManager!
    
    init(networkManager: NetworkManager) {
        super.init(nibName: nil, bundle: nil)
        self.networkManager = networkManager
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        networkManager.getNewMovies(page: 1) { movies, error in
            if let error = error {
                print(error)
            }
            if let movies = movies {
                print(movies)
            }
        }
    }
}
