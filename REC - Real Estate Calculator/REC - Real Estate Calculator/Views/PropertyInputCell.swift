//
//  PropertyInputCell.swift
//  REC - Real Estate Calculator
//
//  Created by timofey makhlay on 12/13/18.
//  Copyright © 2018 Timofey Makhlay. All rights reserved.
//

import UIKit

class PropertyInputCell: UITableViewCell {
    
    // Value Label
    let value: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.boldSystemFont(ofSize: 23)
        textView.backgroundColor = nil
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isSelectable = false
        textView.isScrollEnabled = false
        textView.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        return textView
    }()
    
    // Value Input Label
    // TODO: Gonna have to made this into TextField to add Target to remove placeholder
    let input: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.systemFont(ofSize: 23)
        textView.backgroundColor = nil
        textView.textAlignment = .center
        textView.isScrollEnabled = false
        textView.textColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        return textView
    }()
    
    // Cell container
    private var line: UIView = {
        let cellColor = UIView()
        cellColor.backgroundColor = #colorLiteral(red: 0.7409107685, green: 0.6965670586, blue: 1, alpha: 1)
        return cellColor
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addStyling()
    }
    
    private func addStyling(){
        // Adding Valur Label
        addSubview(value)
        value.anchor(top: nil, leading: self.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 0, left: 20, bottom: 0, right: 0))
        value.centerVerticalOfView(to: self)
        
        // Adding Inoput Label
        addSubview(input)
        input.anchor(top: nil, leading: nil, bottom: nil, trailing: self.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 20), size: .init(width: 160, height: 40))
        input.centerVerticalOfView(to: self)
        
        // Adding Line
        addSubview(line)
        line.anchor(top: input.bottomAnchor, leading: nil, bottom: nil, trailing: input.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: 160, height: 2))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
