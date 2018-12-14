//
//  ViewController.swift
//  REC - Real Estate Calculator
//
//  Created by timofey makhlay on 12/13/18.
//  Copyright © 2018 Timofey Makhlay. All rights reserved.
//

import UIKit

class Login: UIViewController {
    // Title
    private let brandName: UITextView = {
        let textView = UITextView()
        textView.font = UIFont(name: "Avenir Next", size: 80)
        textView.text = "Real Estate"
        textView.backgroundColor = nil
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isSelectable = false
        textView.isScrollEnabled = false
        textView.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return textView
    }()
    // Subtitle
    private let subTitle: UITextView = {
        let textView = UITextView()
        textView.font = UIFont(name: "Avenir Next", size: 60)
        textView.backgroundColor = nil
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isSelectable = false
        textView.isScrollEnabled = false
        textView.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        textView.text = "Calculator"

        return textView
    }()
    
    //Creating Google Sign in button
    private let signInButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        button.layer.cornerRadius = 30
        button.setImage(#imageLiteral(resourceName: "GoogleSignInButton"), for: .normal)
        button.imageView?.contentMode = .scaleToFill
        button.addTarget(self, action: #selector(loadNextView), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.7333333333, green: 0.6980392157, blue: 1, alpha: 1)
        
        // Adding Title
        view.addSubview(brandName)
        brandName.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, size: .init(width: view.bounds.width, height: view.bounds.height / 7))
        
        // Adding Subtitle
        view.addSubview(subTitle)
        subTitle.anchor(top: brandName.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor)
        
        // Adding Sign in Button
        view.addSubview(signInButton)
        signInButton.anchor(top: nil, leading: nil, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: nil, padding: .init(top: 0, left: 0, bottom: 20, right: 0), size: .init(width: view.bounds.width / 1.2, height: view.bounds.height / 16))
        signInButton.centerHorizontalOfView(to: view)
        
    }

    @objc private func loadNextView() {
        // Present Next View
        let newViewController = PropertiesList()
        self.present(newViewController, animated: true)
    }
}

