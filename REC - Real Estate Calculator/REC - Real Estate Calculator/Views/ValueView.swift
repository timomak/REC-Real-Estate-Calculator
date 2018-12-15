//
//  ValueView.swift
//  REC - Real Estate Calculator
//
//  Created by timofey makhlay on 12/14/18.
//  Copyright © 2018 Timofey Makhlay. All rights reserved.
//

import UIKit

class ValueView: UIView {
    // Value Label Scroll View
    private let nameValue: UITextView = {
        let textView = UITextView()
        textView.text = "Name"
        textView.font = UIFont.boldSystemFont(ofSize: 23)
        textView.backgroundColor = nil
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isSelectable = false
        textView.isScrollEnabled = false
        textView.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        return textView
    }()
    
    private let nameInput: UITextField = {
        var textField = UITextField()
        textField.placeholder = "Name..."
        textField.font = UIFont.systemFont(ofSize: 18)
        textField.textColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        //        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.keyboardType = UIKeyboardType.default
        textField.returnKeyType = UIReturnKeyType.done
        textField.clearButtonMode = UITextField.ViewMode.whileEditing
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        //        textField.delegate = self
        textField.textAlignment = .center
        return textField
    }()
    
    // Input Label Underline
    private var nameInputUnderline: UIView = {
        let cellColor = UIView()
        cellColor.backgroundColor = #colorLiteral(red: 0.7409107685, green: 0.6965670586, blue: 1, alpha: 1)
        return cellColor
    }()
    
    func addView(superview: UIView, toView: UIView) {
        // Adding Name TextView
        superview.addSubview(nameValue)
        nameValue.anchor(top: toView.topAnchor, leading: toView.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 40, left: -10, bottom: 0, right: 0), size: .init(width: 160, height: 40))
        
        
        // Adding Name Input TextView
        superview.addSubview(nameInput)
        nameInput.anchor(top: toView.topAnchor, leading: nil, bottom: nil, trailing: toView.trailingAnchor, padding: .init(top: 40, left: 0, bottom: 0, right: 10), size: .init(width: 160, height: 40))
//        nameInput.delegate = self as? UITextFieldDelegate
        
        // Adding Name UnderLine
        superview.addSubview(nameInputUnderline)
        nameInputUnderline.anchor(top: nameInput.bottomAnchor, leading: nil, bottom: nil, trailing: nameInput.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: 160, height: 2))
    }

}
