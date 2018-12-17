//
//  Calculate.swift
//  REC - Real Estate Calculator
//
//  Created by timofey makhlay on 12/16/18.
//  Copyright © 2018 Timofey Makhlay. All rights reserved.
//

// TODO: Add charts

import UIKit

class Calculate: UIViewController {
    // Property to showcase
    var property: Property = Property(name: " ", buyingPrice: 0, rent: 0, buildingTax: 0, propertyTax: 0, yearlyFees: 0, valueGrowth: 0, squaredFeet: 0)
    
    // Dismiss View Button
    private let cancelButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        button.layer.cornerRadius = 30
        button.setImage(#imageLiteral(resourceName: "CancelButton"), for: .normal)
        button.imageView?.contentMode = .scaleToFill
        button.addTarget(self, action: #selector(cancelButtonPressed), for: .touchUpInside)
        return button
    }()
    
    // Squared Foot Cost
    private let squaredFootCost: UITextView = {
        let textView = UITextView()
        textView.text = "Price Per Squared Foot:\n  $"
        textView.font = UIFont.boldSystemFont(ofSize: 22)
        textView.backgroundColor = nil
        textView.textAlignment = .left
        textView.isEditable = false
        textView.isSelectable = false
        textView.isScrollEnabled = false
        textView.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return textView
    }()
    
    // Yearly Tax
    private let yearlyTax: UITextView = {
        let textView = UITextView()
        textView.text = "Yearly Tax:\n  $"
        textView.font = UIFont.boldSystemFont(ofSize: 22)
        textView.backgroundColor = nil
        textView.textAlignment = .left
        textView.isEditable = false
        textView.isSelectable = false
        textView.isScrollEnabled = false
        textView.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return textView
    }()
    
    // Yearly Income
    private let yearlyIncome: UITextView = {
        let textView = UITextView()
        textView.text = "Yearly Income (after tax and fees):\n  $"
        textView.font = UIFont.boldSystemFont(ofSize: 22)
        textView.backgroundColor = nil
        textView.textAlignment = .left
        textView.isEditable = false
        textView.isSelectable = false
        textView.isScrollEnabled = false
        textView.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return textView
    }()
    
    // Monthly Income
    private let monthlyIncome: UITextView = {
        let textView = UITextView()
        textView.text = "Monthly Income (after tax and fees):\n  $"
        textView.font = UIFont.boldSystemFont(ofSize: 22)
        textView.backgroundColor = nil
        textView.textAlignment = .left
        textView.isEditable = false
        textView.isSelectable = false
        textView.isScrollEnabled = false
        textView.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return textView
    }()
    
    // Gross Income
    private let grossIncome: UITextView = {
        let textView = UITextView()
        textView.text = "Gross Income:\n  $"
        textView.font = UIFont.boldSystemFont(ofSize: 22)
        textView.backgroundColor = nil
        textView.textAlignment = .left
        textView.isEditable = false
        textView.isSelectable = false
        textView.isScrollEnabled = false
        textView.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return textView
    }()
    
    // Value Growth Income
    private let valueGrowth: UITextView = {
        let textView = UITextView()
        textView.text = "Yearly Value Growth:\n  $"
        textView.font = UIFont.boldSystemFont(ofSize: 22)
        textView.backgroundColor = nil
        textView.textAlignment = .left
        textView.isEditable = false
        textView.isSelectable = false
        textView.isScrollEnabled = false
        textView.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return textView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.7409107685, green: 0.6965670586, blue: 1, alpha: 1)
        setUpView()
        calculate()
    }
    func setUpView() {
        // Adding cancel button
        view.addSubview(cancelButton)
        cancelButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 0, left: 20, bottom: 0, right: 0), size: .init(width: 35, height: 35))
        
        // Adding Squared Foot Cost
        view.addSubview(squaredFootCost)
        squaredFootCost.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 110, left: 5, bottom: 0, right: 0))

        // Adding Yearly Tax text
        view.addSubview(yearlyTax)
        yearlyTax.anchor(top: squaredFootCost.bottomAnchor, leading: squaredFootCost.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 50, left: 0, bottom: 0, right: 0))
        
        // Adding Yearly Income text
        view.addSubview(yearlyIncome)
        yearlyIncome.anchor(top: yearlyTax.bottomAnchor, leading: squaredFootCost.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 50, left: 0, bottom: 0, right: 0))
        
        // Adding Monthly Income text
        view.addSubview(monthlyIncome)
        monthlyIncome.anchor(top: yearlyIncome.bottomAnchor, leading: squaredFootCost.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 50, left: 0, bottom: 0, right: 0))
        
        // Adding Gross Income text
        view.addSubview(grossIncome)
        grossIncome.anchor(top: monthlyIncome.bottomAnchor, leading: squaredFootCost.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 50, left: 0, bottom: 0, right: 0))
        
        // Adding Value Growth text
        view.addSubview(valueGrowth)
        valueGrowth.anchor(top: grossIncome.bottomAnchor, leading: squaredFootCost.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 50, left: 0, bottom: 0, right: 0))
    }
    
    func calculate() {
        // Calculating cost per squared foot
        let costPerSquareFoot = property.buyingPrice / property.squaredFeet
        squaredFootCost.text += String(format: "%.2f", costPerSquareFoot)
        
        // Calculating Yearly Tax
        let totalTax = (property.buildingTax + property.propertyTax) * 12
        yearlyTax.text += String(format: "%.2f", totalTax)
        
        // Calculate Fees
        let mothlyFees = property.yearlyFees / 12
        
        // Yearly Rent income
        let rentTaxMonthly = property.buildingTax + property.propertyTax
        let totalRentPositive = (property.rent - rentTaxMonthly) * 12.00
        yearlyIncome.text += String(format: "%.2f", totalRentPositive)
        
        
        // Monthly Rent Income
        let totalRentMonthly = (property.rent - (rentTaxMonthly + mothlyFees))
        monthlyIncome.text += String(format: "%.2f", totalRentMonthly)
        
        // Gross Income
        let totalIncome = (property.rent) * 12.00
        grossIncome.text += String(format: "%.2f", totalIncome)
        
        // Yearly Value Growth
        let yearlyValueGrowth = property.buyingPrice - (property.buyingPrice * (property.valueGrowth))
        valueGrowth.text += String(format: "%.2f", yearlyValueGrowth)
    }
    
    
    @objc private func cancelButtonPressed() {
        // Remove current view
        self.dismiss(animated: true, completion: nil)
    }
}
