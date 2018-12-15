//
//  TableViewCell.swift
//  REC - Real Estate Calculator
//
//  Created by timofey makhlay on 12/13/18.
//  Copyright © 2018 Timofey Makhlay. All rights reserved.
//

import UIKit

class PropertyListCell: UITableViewCell {
    // Variables that can be changed within the table view controller

    // Property Name Label
    let propertyName: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.boldSystemFont(ofSize: 23)
        textView.backgroundColor = nil
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isSelectable = false
        textView.isScrollEnabled = false
        textView.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return textView
    }()
    
    // $ label
    let dollarSingLabel: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.boldSystemFont(ofSize: 23)
        textView.text = "$"
        textView.backgroundColor = nil
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isSelectable = false
        textView.isScrollEnabled = false
        textView.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return textView
    }()
    
    // Property Value Label
    let propertyValue: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.boldSystemFont(ofSize: 23)
        textView.backgroundColor = nil
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isSelectable = false
        textView.isScrollEnabled = false
        textView.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return textView
    }()
    
    // Cell container
    private var cellBackground: UIView = {
        let cellColor = UIView()
        cellColor.backgroundColor = #colorLiteral(red: 0.7409107685, green: 0.6965670586, blue: 1, alpha: 1)
        cellColor.layer.cornerRadius = 34
        cellColor.layer.shadowRadius = 6
        cellColor.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        cellColor.layer.shadowOpacity = 0.1
        cellColor.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return cellColor
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
    }
    
    func addViews() {
        // Adding Cell Container View
        addSubview(cellBackground)
        
        // Cell container size and position in cell
        cellBackground.anchor(top: nil, leading: nil, bottom: nil, trailing: nil, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: bounds.width + 20, height: 67))
        cellBackground.centerOfView(to: self)
        
        // Adding and centering label within cell
        addSubview(propertyName)
        propertyName.anchor(top: nil, leading: cellBackground.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 0, left: 10, bottom: 0, right: 0))
        propertyName.centerVerticalOfView(to: self)
        
        // Adding Dollar sign in the center of the container
        addSubview(dollarSingLabel)
        dollarSingLabel.centerOfView(to: cellBackground)
        
        // Adding Property Value Label
        addSubview(propertyValue)
        propertyValue.anchor(top: nil, leading: nil, bottom: nil, trailing: cellBackground.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 10))
        propertyValue.centerVerticalOfView(to: cellBackground)
    }
    
    // Required with initilizer
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
