//
//  ProfileView.swift
//  REC - Real Estate Calculator
//
//  Created by timofey makhlay on 12/20/18.
//  Copyright © 2018 Timofey Makhlay. All rights reserved.
//

import UIKit
import Firebase

class ProfileView: UIView {
    // User Properties
    private var properties = [Property]()
    
    // Creating Navbar
    private let navbar: UIView = {
        let navigationBar = UIView()
        navigationBar.alpha = 0
        return navigationBar
    }()
    
    // Addting title to Navbar
    let viewNavbarTitle: UITextView = {
        var title = UITextView()
        title.text = "Profile"
        title.font = UIFont.boldSystemFont(ofSize: 32)
        title.textColor = #colorLiteral(red: 0.7333333333, green: 0.6980392157, blue: 1, alpha: 1)
        title.backgroundColor = nil
        title.textAlignment = .center
        title.isEditable = false
        title.isScrollEnabled = false
        return title
    }()
    
    // Number of properties
    private let numberOfPropertiesLabel: UITextView = {
        let textView = UITextView()
        textView.text = "Number of Properties:\n"
        textView.font = UIFont.boldSystemFont(ofSize: 22)
        textView.backgroundColor = nil
        textView.textAlignment = .left
        textView.isEditable = false
        textView.isSelectable = false
        textView.isScrollEnabled = false
        textView.textColor = #colorLiteral(red: 0.7409107685, green: 0.6965670586, blue: 1, alpha: 1)
        return textView
    }()
    
    // Monthly Total Income
    private let monthlyTotalIncomeLabel: UITextView = {
        let textView = UITextView()
        textView.text = "Monthly Gross Income:\n"
        textView.font = UIFont.boldSystemFont(ofSize: 22)
        textView.backgroundColor = nil
        textView.textAlignment = .left
        textView.isEditable = false
        textView.isSelectable = false
        textView.isScrollEnabled = false
        textView.textColor = #colorLiteral(red: 0.7409107685, green: 0.6965670586, blue: 1, alpha: 1)
        return textView
    }()
    
    // Monthly AfterTax Income
    private let monthlyAfterTaxIncomeLabel: UITextView = {
        let textView = UITextView()
        textView.text = "Monthly After Tax Income:\n"
        textView.font = UIFont.boldSystemFont(ofSize: 22)
        textView.backgroundColor = nil
        textView.textAlignment = .left
        textView.isEditable = false
        textView.isSelectable = false
        textView.isScrollEnabled = false
        textView.textColor = #colorLiteral(red: 0.7409107685, green: 0.6965670586, blue: 1, alpha: 1)
        return textView
    }()
    
    // Monthly tax Income
    private let monthlyTaxLabel: UITextView = {
        let textView = UITextView()
        textView.text = "Monthly Tax:\n"
        textView.font = UIFont.boldSystemFont(ofSize: 22)
        textView.backgroundColor = nil
        textView.textAlignment = .left
        textView.isEditable = false
        textView.isSelectable = false
        textView.isScrollEnabled = false
        textView.textColor = #colorLiteral(red: 0.7409107685, green: 0.6965670586, blue: 1, alpha: 1)
        return textView
    }()
    
    // Yearly Gross Income Income
    private let yearlyTotalIncomeLabel: UITextView = {
        let textView = UITextView()
        textView.text = "Yearly Gross Income:\n"
        textView.font = UIFont.boldSystemFont(ofSize: 22)
        textView.backgroundColor = nil
        textView.textAlignment = .left
        textView.isEditable = false
        textView.isSelectable = false
        textView.isScrollEnabled = false
        textView.textColor = #colorLiteral(red: 0.7409107685, green: 0.6965670586, blue: 1, alpha: 1)
        return textView
    }()
    
    // Yearly After Tax Income
    private let yearlyAfterTaxIncomeLabel: UITextView = {
        let textView = UITextView()
        textView.text = "Yearly After Tax Income:\n"
        textView.font = UIFont.boldSystemFont(ofSize: 22)
        textView.backgroundColor = nil
        textView.textAlignment = .left
        textView.isEditable = false
        textView.isSelectable = false
        textView.isScrollEnabled = false
        textView.textColor = #colorLiteral(red: 0.7409107685, green: 0.6965670586, blue: 1, alpha: 1)
        return textView
    }()
    
    // Yearly Tax
    private let yearlyTaxLabel: UITextView = {
        let textView = UITextView()
        textView.text = "Yearly Tax:\n"
        textView.font = UIFont.boldSystemFont(ofSize: 22)
        textView.backgroundColor = nil
        textView.textAlignment = .left
        textView.isEditable = false
        textView.isSelectable = false
        textView.isScrollEnabled = false
        textView.textColor = #colorLiteral(red: 0.7409107685, green: 0.6965670586, blue: 1, alpha: 1)
        return textView
    }()
    
    // Yearly Fees
    private let yearlyFeesLabel: UITextView = {
        let textView = UITextView()
        textView.text = "Yearly Fees:\n"
        textView.font = UIFont.boldSystemFont(ofSize: 22)
        textView.backgroundColor = nil
        textView.textAlignment = .left
        textView.isEditable = false
        textView.isSelectable = false
        textView.isScrollEnabled = false
        textView.textColor = #colorLiteral(red: 0.7409107685, green: 0.6965670586, blue: 1, alpha: 1)
        return textView
    }()
    
    func loadSelf(superView: UIView, tabBar: UIView) {
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        superView.addSubview(self)
        self.anchor(top: superView.topAnchor, leading: superView.leadingAnchor, bottom: tabBar.topAnchor, trailing: superView.trailingAnchor)
        
        // Returns: dataProperties
        if UserDefaults.standard.bool(forKey: "hasProperty") == true {
            // Can unwrap an populate property list
            if UserDefaults.standard.dictionary(forKey: "properties") != nil {
                properties.removeAll()
                unwrapDictionary(toUnwrap: UserDefaults.standard.dictionary(forKey: "properties") as! [String : [String : [String : Double]]])
            }
        }
        
        addCustomNavbar()
        setupStatistics()
        addValues()
    }
    
    
    func addCustomNavbar() {
        // Adding Navbar View
        addSubview(navbar)
        
        // Navbar Size
        navbar.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, size: .init(width: bounds.width, height: 100))
        
        // Adding Title to Navbar
        addSubview(viewNavbarTitle)
        
        // Title Size
        viewNavbarTitle.anchor(top: navbar.topAnchor, leading: navbar.leadingAnchor, bottom: navbar.bottomAnchor, trailing: nil, padding: .init(top: 40, left: 30, bottom: 5, right: 0))
        viewNavbarTitle.text = (Auth.auth().currentUser?.displayName)!
    }
    
    func setupStatistics() {
        addSubview(numberOfPropertiesLabel)
        numberOfPropertiesLabel.anchor(top: navbar.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 0, left: 10, bottom: 0, right: 0))
        
        addSubview(monthlyTotalIncomeLabel)
        monthlyTotalIncomeLabel.anchor(top: numberOfPropertiesLabel.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 10, left: 10, bottom: 0, right: 0))
        
        addSubview(monthlyAfterTaxIncomeLabel)
        monthlyAfterTaxIncomeLabel.anchor(top: monthlyTotalIncomeLabel.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 10, left: 10, bottom: 0, right: 0))
        
        addSubview(monthlyTaxLabel)
        monthlyTaxLabel.anchor(top: monthlyAfterTaxIncomeLabel.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 10, left: 10, bottom: 0, right: 0))
        
        
        addSubview(yearlyTotalIncomeLabel)
        yearlyTotalIncomeLabel.anchor(top: monthlyTaxLabel.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 10, left: 10, bottom: 0, right: 0))
        
        addSubview(yearlyAfterTaxIncomeLabel)
        yearlyAfterTaxIncomeLabel.anchor(top: yearlyTotalIncomeLabel.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 10, left: 10, bottom: 0, right: 0))
        
        addSubview(yearlyTaxLabel)
        yearlyTaxLabel.anchor(top: yearlyAfterTaxIncomeLabel.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 10, left: 10, bottom: 0, right: 0))
        
        addSubview(yearlyFeesLabel)
        yearlyFeesLabel.anchor(top: yearlyTaxLabel.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 10, left: 10, bottom: 0, right: 0))
    }
    
    func addValues() {
        var totalTaxMonthly: Double = 0
        var totalRentMonthly: Double = 0
        var totalIncomeMonthly: Double = 0
        
        var totalTaxYearly: Double = 0
        var totalRentYearly: Double = 0
        var totalIncomeYearly: Double = 0
        var yearlyFees: Double = 0
        
        
        for property in properties {
            // Calculating Total tax
            totalTaxYearly += ((property.propertyTax + property.buildingTax) * 12)
            
            // Calculating Total rent Yearly
            totalIncomeYearly += property.rent * 12
            
            // Calculating total Rent after tax yearly
            totalRentYearly += (property.rent - (property.propertyTax + property.buildingTax)) * 12
            
            // Calculating Yearly Fees
            yearlyFees += property.yearlyFees
            
            // Calculating Monthly Tax
            totalTaxMonthly += (property.propertyTax + property.buildingTax)
            
            // Calculating Monthly Gross income
            totalIncomeMonthly += property.rent
            
            // Calculating Monthly Income AFter tax
            totalRentMonthly += (property.rent - (property.propertyTax + property.buildingTax))
        }
        numberOfPropertiesLabel.text = "Number of Properties:\n\(properties.count)"
        monthlyTotalIncomeLabel.text = "Monthly Gross Income:\n$" + totalIncomeMonthly.formattedWithSeparator
        monthlyAfterTaxIncomeLabel.text = "Monthly After-Tax Income:\n$" + totalRentMonthly.formattedWithSeparator
        monthlyTaxLabel.text = "Monthly Tax:\n$" + totalTaxMonthly.formattedWithSeparator
        yearlyTotalIncomeLabel.text = "Yearly Gross Income:\n$" + totalIncomeYearly.formattedWithSeparator
        yearlyAfterTaxIncomeLabel.text = "Yearly After-Tax Income:\n$" + totalRentYearly.formattedWithSeparator
        yearlyTaxLabel.text = "Yearly Tax:\n$" + totalTaxYearly.formattedWithSeparator
        yearlyFeesLabel.text = "Yearly Fees:\n$" + yearlyFees.formattedWithSeparator
        
    }
    
    func unwrapDictionary(toUnwrap: [String: [String : [String : Double]]]) {
        // print("Starting Unwrapping of dictionary\n")
        var id: String = String()
        var name: String = String()
        var buyingPrice: Double = Double()
        var rent: Double = Double()
        var buildingTax: Double = Double()
        var propertyTax: Double = Double()
        var yearlyFees: Double = Double()
        var valueGrowth: Double = Double()
        var squaredFeet: Double = Double()
        
        // print("Dictionary: ", toUnwrap)
        for (propertyId, dictionary) in toUnwrap {
            // print("Property Id: ", propertyId)
            id = propertyId
            for (propertyName, dict) in dictionary {
                name = propertyName
                for (nameOfValue, value) in dict {
                    if nameOfValue == "price" {
                        buyingPrice = value
                    } else if nameOfValue == "rent" {
                        rent = value
                    }
                    else if nameOfValue == "buildingTax" {
                        buildingTax = value
                    }
                    else if nameOfValue == "propertyTax" {
                        propertyTax = value
                    }
                    else if nameOfValue == "fees" {
                        yearlyFees = value
                    }
                    else if nameOfValue == "growth" {
                        valueGrowth = value
                    }
                    else if nameOfValue == "squaredFeet" {
                        squaredFeet = value
                    }
                    // print("Name: \(name) [\(nameOfValue): \(value)]")
                }
            }
            // append here
            let unwrappedProperty = Property(
                name: name,
                buyingPrice: buyingPrice,
                rent: rent,
                buildingTax: buildingTax,
                propertyTax: propertyTax,
                yearlyFees: yearlyFees,
                valueGrowth: valueGrowth,
                squaredFeet: squaredFeet)
            unwrappedProperty.id = id
            properties.append(unwrappedProperty)
        }
    }
    
    
}

