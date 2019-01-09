//
//  ValueView.swift
//  REC - Real Estate Calculator
//
//  Created by timofey makhlay on 12/14/18.
//  Copyright © 2018 Timofey Makhlay. All rights reserved.
//

import UIKit

class ValueView: UIView, UITextFieldDelegate {
    // Value Label Scroll View
    private let nameValue: UITextView = {
        let textView = UITextView()
        textView.text = "Name:"
        textView.font = UIFont.boldSystemFont(ofSize: 23)
        textView.backgroundColor = nil
        textView.textAlignment = .left
        textView.isEditable = false
        textView.isSelectable = false
        textView.isScrollEnabled = false
        textView.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        return textView
    }()
    
    let nameInput: UITextField = {
        var textField = UITextField()
        textField.placeholder = "Name..."
        textField.font = UIFont.systemFont(ofSize: 18)
        textField.textColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        //        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.keyboardType = UIKeyboardType.default
        textField.returnKeyType = UIReturnKeyType.default
        textField.clearButtonMode = UITextField.ViewMode.whileEditing
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        //        textField.delegate = self
        textField.textAlignment = .center
        textField.addTarget(self, action: #selector(NewProperty.moveBackground), for: .touchDown)
        textField.tag = 0
        return textField
    }()
    
    // Input Label Underline
    private var nameInputUnderline: UIView = {
        let cellColor = UIView()
        cellColor.backgroundColor = #colorLiteral(red: 0.7409107685, green: 0.6965670586, blue: 1, alpha: 1)
        return cellColor
    }()
    
    
    // Value Label Scroll View
    private let costValue: UITextView = {
        let textView = UITextView()
        textView.text = "Value:"
        textView.font = UIFont.boldSystemFont(ofSize: 23)
        textView.backgroundColor = nil
        textView.textAlignment = .left
        textView.isEditable = false
        textView.isSelectable = false
        textView.isScrollEnabled = false
        textView.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        return textView
    }()
    
    private let costInput: UITextField = {
        var textField = UITextField()
        textField.placeholder = "Cost..."
        textField.font = UIFont.systemFont(ofSize: 18)
        textField.textColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.keyboardType = UIKeyboardType.numbersAndPunctuation
        textField.returnKeyType = UIReturnKeyType.default
        textField.clearButtonMode = UITextField.ViewMode.whileEditing
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        textField.textAlignment = .center
        textField.tag = 1
        textField.addTarget(self, action: #selector(NewProperty.moveBackground), for: .touchDown)
        return textField
    }()
    
    // Input Label Underline
    private var costInputUnderline: UIView = {
        let cellColor = UIView()
        cellColor.backgroundColor = #colorLiteral(red: 0.7409107685, green: 0.6965670586, blue: 1, alpha: 1)
        return cellColor
    }()
    
    
    // Value Label Scroll View
    private let rentValue: UITextView = {
        let textView = UITextView()
        textView.text = "Rent:"
        textView.font = UIFont.boldSystemFont(ofSize: 23)
        textView.backgroundColor = nil
        textView.textAlignment = .left
        textView.isEditable = false
        textView.isSelectable = false
        textView.isScrollEnabled = false
        textView.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        return textView
    }()
    
    private let rentInput: UITextField = {
        var textField = UITextField()
        textField.placeholder = "Rent..."
        textField.font = UIFont.systemFont(ofSize: 18)
        textField.textColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.keyboardType = UIKeyboardType.numbersAndPunctuation
        textField.returnKeyType = UIReturnKeyType.default
        textField.clearButtonMode = UITextField.ViewMode.whileEditing
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        textField.textAlignment = .center
        textField.tag = 2
        textField.addTarget(self, action: #selector(NewProperty.moveBackground), for: .touchDown)
        return textField
    }()
    
    // Input Label Underline
    private var rentInputUnderline: UIView = {
        let cellColor = UIView()
        cellColor.backgroundColor = #colorLiteral(red: 0.7409107685, green: 0.6965670586, blue: 1, alpha: 1)
        return cellColor
    }()
    
    // Value Label Scroll View
    private let buildingTaxValue: UITextView = {
        let textView = UITextView()
        textView.text = "Building Tax:"
        textView.font = UIFont.boldSystemFont(ofSize: 23)
        textView.backgroundColor = nil
        textView.textAlignment = .left
        textView.isEditable = false
        textView.isSelectable = false
        textView.isScrollEnabled = false
        textView.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        return textView
    }()
    
    private let buildingTaxInput: UITextField = {
        var textField = UITextField()
        textField.placeholder = "Building Tax..."
        textField.font = UIFont.systemFont(ofSize: 18)
        textField.textColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.keyboardType = UIKeyboardType.numbersAndPunctuation
        textField.returnKeyType = UIReturnKeyType.default
        textField.clearButtonMode = UITextField.ViewMode.whileEditing
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        textField.textAlignment = .center
        textField.tag = 3
        textField.addTarget(self, action: #selector(NewProperty.moveBackground), for: .touchDown)
        return textField
    }()
    
    // Input Label Underline
    private var buildingTaxInputUnderline: UIView = {
        let cellColor = UIView()
        cellColor.backgroundColor = #colorLiteral(red: 0.7409107685, green: 0.6965670586, blue: 1, alpha: 1)
        return cellColor
    }()
    
    // Value Label Scroll View
    private let propertyTaxValue: UITextView = {
        let textView = UITextView()
        textView.text = "Property Tax:"
        textView.font = UIFont.boldSystemFont(ofSize: 23)
        textView.backgroundColor = nil
        textView.textAlignment = .left
        textView.isEditable = false
        textView.isSelectable = false
        textView.isScrollEnabled = false
        textView.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        return textView
    }()
    
    private let propertyTaxInput: UITextField = {
        var textField = UITextField()
        textField.placeholder = "Property Tax..."
        textField.font = UIFont.systemFont(ofSize: 18)
        textField.textColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.keyboardType = UIKeyboardType.numbersAndPunctuation
        textField.returnKeyType = UIReturnKeyType.default
        textField.clearButtonMode = UITextField.ViewMode.whileEditing
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        textField.textAlignment = .center
        textField.tag = 4
        textField.addTarget(self, action: #selector(NewProperty.moveBackground), for: .touchDown)
        return textField
    }()
    
    // Input Label Underline
    private var propertyTaxInputUnderline: UIView = {
        let cellColor = UIView()
        cellColor.backgroundColor = #colorLiteral(red: 0.7409107685, green: 0.6965670586, blue: 1, alpha: 1)
        return cellColor
    }()
    
    // Value Label Scroll View
    private let yearlyFeesValue: UITextView = {
        let textView = UITextView()
        textView.text = "Yearly Fees:"
        textView.font = UIFont.boldSystemFont(ofSize: 23)
        textView.backgroundColor = nil
        textView.textAlignment = .left
        textView.isEditable = false
        textView.isSelectable = false
        textView.isScrollEnabled = false
        textView.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        return textView
    }()
    
    private let yearlyFeesInput: UITextField = {
        var textField = UITextField()
        textField.placeholder = "Yearly Fees..."
        textField.font = UIFont.systemFont(ofSize: 18)
        textField.textColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.keyboardType = UIKeyboardType.numbersAndPunctuation
        textField.returnKeyType = UIReturnKeyType.default
        textField.clearButtonMode = UITextField.ViewMode.whileEditing
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        textField.textAlignment = .center
        textField.tag = 5
        textField.addTarget(self, action: #selector(NewProperty.moveBackground), for: .touchDown)
        return textField
    }()
    
    // Input Label Underline
    private var yearlyFeesInputUnderline: UIView = {
        let cellColor = UIView()
        cellColor.backgroundColor = #colorLiteral(red: 0.7409107685, green: 0.6965670586, blue: 1, alpha: 1)
        return cellColor
    }()
    
    // Value Label Scroll View
    private let valueGrowthValue: UITextView = {
        let textView = UITextView()
        textView.text = "Value Growth:"
        textView.font = UIFont.boldSystemFont(ofSize: 23)
        textView.backgroundColor = nil
        textView.textAlignment = .left
        textView.isEditable = false
        textView.isSelectable = false
        textView.isScrollEnabled = false
        textView.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        return textView
    }()
    
    private let valueGrowthInput: UITextField = {
        var textField = UITextField()
        textField.placeholder = "Value Growth..."
        textField.font = UIFont.systemFont(ofSize: 18)
        textField.textColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.keyboardType = UIKeyboardType.numbersAndPunctuation
        textField.returnKeyType = UIReturnKeyType.default
        textField.clearButtonMode = UITextField.ViewMode.whileEditing
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        textField.textAlignment = .center
        textField.tag = 6
        textField.addTarget(self, action: #selector(NewProperty.moveBackground), for: .touchDown)
        return textField
    }()
    
    // Input Label Underline
    private var valueGrowthInputUnderline: UIView = {
        let cellColor = UIView()
        cellColor.backgroundColor = #colorLiteral(red: 0.7409107685, green: 0.6965670586, blue: 1, alpha: 1)
        return cellColor
    }()
    
    // Value Label Scroll View
    private let squaredFeetValue: UITextView = {
        let textView = UITextView()
        textView.text = "Squared Feet:"
        textView.font = UIFont.boldSystemFont(ofSize: 23)
        textView.backgroundColor = nil
        textView.textAlignment = .left
        textView.isEditable = false
        textView.isSelectable = false
        textView.isScrollEnabled = false
        textView.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        return textView
    }()
    
    private let squaredFeetInput: UITextField = {
        var textField = UITextField()
        textField.placeholder = "Squared Feet..."
        textField.font = UIFont.systemFont(ofSize: 18)
        textField.textColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.keyboardType = UIKeyboardType.numbersAndPunctuation
        textField.returnKeyType = UIReturnKeyType.default
        textField.clearButtonMode = UITextField.ViewMode.whileEditing
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        textField.textAlignment = .center
        textField.tag = 7
        textField.addTarget(self, action: #selector(NewProperty.moveBackground), for: .touchDown)
        return textField
    }()
    
    // Input Label Underline
    private var squaredFeetInputUnderline: UIView = {
        let cellColor = UIView()
        cellColor.backgroundColor = #colorLiteral(red: 0.7409107685, green: 0.6965670586, blue: 1, alpha: 1)
        return cellColor
    }()

    func addView(superview: UIView, toView: UIView) {
        // NAME
        // Adding Name TextView
        superview.addSubview(nameValue)
        nameValue.anchor(top: toView.topAnchor, leading: toView.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 60, left: 10, bottom: 0, right: 0), size: .init(width: 160, height: 40))
        
        
        // Adding Name Input TextView
        superview.addSubview(nameInput)
        nameInput.delegate = self
        nameInput.anchor(top: toView.topAnchor, leading: nil, bottom: nil, trailing: toView.trailingAnchor, padding: .init(top: 60, left: 0, bottom: 0, right: 10), size: .init(width: 160, height: 40))
//        nameInput.delegate = self as? UITextFieldDelegate
        
        // Adding Name UnderLine
        superview.addSubview(nameInputUnderline)
        nameInputUnderline.anchor(top: nameInput.bottomAnchor, leading: nil, bottom: nil, trailing: nameInput.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: 160, height: 2))
        
        // COST
        // Adding cost TextView
        superview.addSubview(costValue)
        costValue.anchor(top: nameValue.topAnchor, leading: toView.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 45, left: 10, bottom: 0, right: 0), size: .init(width: 160, height: 40))
        
        
        // Adding cost Input TextView
        superview.addSubview(costInput)
        costInput.delegate = self
        costInput.anchor(top: nameValue.topAnchor, leading: nil, bottom: nil, trailing: toView.trailingAnchor, padding: .init(top: 45, left: 0, bottom: 0, right: 10), size: .init(width: 160, height: 40))
        
        // Adding cost UnderLine
        superview.addSubview(costInputUnderline)
        costInputUnderline.anchor(top: costInput.bottomAnchor, leading: nil, bottom: nil, trailing: costInput.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: 160, height: 2))
        
        
        // Rent
        // Adding cost TextView
        superview.addSubview(rentValue)
        rentValue.anchor(top: costValue.topAnchor, leading: toView.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 45, left: 10, bottom: 0, right: 0), size: .init(width: 160, height: 40))
        
        
        // Adding cost Input TextView
        superview.addSubview(rentInput)
        rentInput.delegate = self
        rentInput.anchor(top: costValue.topAnchor, leading: nil, bottom: nil, trailing: toView.trailingAnchor, padding: .init(top: 45, left: 0, bottom: 0, right: 10), size: .init(width: 160, height: 40))
        
        // Adding cost UnderLine
        superview.addSubview(rentInputUnderline)
        rentInputUnderline.anchor(top: rentInput.bottomAnchor, leading: nil, bottom: nil, trailing: rentInput.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: 160, height: 2))
        
        // Building Tax
        // Adding cost TextView
        superview.addSubview(buildingTaxValue)
        buildingTaxValue.anchor(top: rentValue.topAnchor, leading: toView.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 45, left: 10, bottom: 0, right: 0), size: .init(width: 160, height: 40))
        
        
        // Adding cost Input TextView
        superview.addSubview(buildingTaxInput)
        buildingTaxInput.delegate = self
        buildingTaxInput.anchor(top: rentValue.topAnchor, leading: nil, bottom: nil, trailing: toView.trailingAnchor, padding: .init(top: 45, left: 0, bottom: 0, right: 10), size: .init(width: 160, height: 40))
        
        // Adding cost UnderLine
        superview.addSubview(buildingTaxInputUnderline)
        buildingTaxInputUnderline.anchor(top: buildingTaxInput.bottomAnchor, leading: nil, bottom: nil, trailing: buildingTaxInput.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: 160, height: 2))
        
        // Property Tax
        // Adding cost TextView
        superview.addSubview(propertyTaxValue)
        propertyTaxValue.anchor(top: buildingTaxValue.topAnchor, leading: toView.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 45, left: 10, bottom: 0, right: 0), size: .init(width: 160, height: 40))
        
        
        // Adding cost Input TextView
        superview.addSubview(propertyTaxInput)
        propertyTaxInput.delegate = self
        propertyTaxInput.anchor(top: buildingTaxValue.topAnchor, leading: nil, bottom: nil, trailing: toView.trailingAnchor, padding: .init(top: 45, left: 0, bottom: 0, right: 10), size: .init(width: 160, height: 40))
        
        // Adding cost UnderLine
        superview.addSubview(propertyTaxInputUnderline)
        propertyTaxInputUnderline.anchor(top: propertyTaxInput.bottomAnchor, leading: nil, bottom: nil, trailing: propertyTaxInput.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: 160, height: 2))
        
        // Yearly Fees
        // Adding cost TextView
        superview.addSubview(yearlyFeesValue)
        yearlyFeesValue.anchor(top: propertyTaxValue.topAnchor, leading: toView.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 45, left: 10, bottom: 0, right: 0), size: .init(width: 160, height: 40))
        
        
        // Adding cost Input TextView
        superview.addSubview(yearlyFeesInput)
        yearlyFeesInput.delegate = self
        yearlyFeesInput.anchor(top: propertyTaxValue.topAnchor, leading: nil, bottom: nil, trailing: toView.trailingAnchor, padding: .init(top: 45, left: 0, bottom: 0, right: 10), size: .init(width: 160, height: 40))
        
        // Adding cost UnderLine
        superview.addSubview(yearlyFeesInputUnderline)
        yearlyFeesInputUnderline.anchor(top: yearlyFeesInput.bottomAnchor, leading: nil, bottom: nil, trailing: yearlyFeesInput.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: 160, height: 2))
        
        // Value Growth
        // Adding cost TextView
        superview.addSubview(valueGrowthValue)
        valueGrowthValue.anchor(top: yearlyFeesValue.topAnchor, leading: toView.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 45, left: 10, bottom: 0, right: 0), size: .init(width: 160, height: 40))
        
        
        // Adding cost Input TextView
        superview.addSubview(valueGrowthInput)
        valueGrowthInput.delegate = self
        valueGrowthInput.anchor(top: yearlyFeesValue.topAnchor, leading: nil, bottom: nil, trailing: toView.trailingAnchor, padding: .init(top: 45, left: 0, bottom: 0, right: 10), size: .init(width: 160, height: 40))
        
        // Adding cost UnderLine
        superview.addSubview(valueGrowthInputUnderline)
        valueGrowthInputUnderline.anchor(top: valueGrowthInput.bottomAnchor, leading: nil, bottom: nil, trailing: valueGrowthInput.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: 160, height: 2))
        
        
        // Squared Feet
        // Adding cost TextView
        superview.addSubview(squaredFeetValue)
        squaredFeetValue.anchor(top: valueGrowthValue.topAnchor, leading: toView.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 45, left: 10, bottom: 0, right: 0), size: .init(width: 160, height: 40))
        
        
        // Adding cost Input TextView
        superview.addSubview(squaredFeetInput)
        squaredFeetInput.delegate = self
        squaredFeetInput.anchor(top: valueGrowthValue.topAnchor, leading: nil, bottom: nil, trailing: toView.trailingAnchor, padding: .init(top: 45, left: 0, bottom: 0, right: 10), size: .init(width: 160, height: 40))
        
        // Adding cost UnderLine
        superview.addSubview(squaredFeetInputUnderline)
        squaredFeetInputUnderline.anchor(top: squaredFeetInput.bottomAnchor, leading: nil, bottom: nil, trailing: squaredFeetInput.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: 160, height: 2))
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        print("Return pressed")
        // Try to find next responder
        if let nextField = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField {
            nextField.becomeFirstResponder()
        } else {
            // Not found, so remove keyboard.
            textField.resignFirstResponder()
        }
        // Do not add a line break
        return false
    }
    
    func createPropertyModel() -> Property {
        // Create Property
        let newProperty = Property(
            name: String(nameInput.text!) ?? "No Name",
            buyingPrice: Double(costInput.text!) ?? 1,
            rent: Double(rentInput.text!) ?? 1,
            buildingTax: Double(buildingTaxInput.text!) ?? 1,
            propertyTax: Double(propertyTaxInput.text!) ?? 1,
            yearlyFees: Double(yearlyFeesInput.text!) ?? 1,
            valueGrowth: Double(valueGrowthInput.text!) ?? 1,
            squaredFeet: Double(squaredFeetInput.text!) ?? 1)
        
        if newProperty.name == "" || newProperty.name == nil {
            newProperty.name = "No Name"
        }
        return newProperty
    }

}
