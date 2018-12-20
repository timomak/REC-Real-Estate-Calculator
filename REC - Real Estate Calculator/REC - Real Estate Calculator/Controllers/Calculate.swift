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
    
    // Creating Export button
    private let exportButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.7409107685, green: 0.6965670586, blue: 1, alpha: 1)
        button.layer.cornerRadius = 0
        button.setImage(#imageLiteral(resourceName: "Export-white"), for: .normal)
        button.imageView?.contentMode = .scaleToFill
        button.addTarget(self, action: #selector(createCSV), for: .touchUpInside)
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
    
    // All the values to calculate
    private var costPerSquareFoot: Double = 0
    private var totalTax: Double = 0
    private var mothlyFees: Double = 0
    private var rentTaxMonthly: Double = 0
    private var totalRentPositive: Double = 0
    private var totalRentMonthly: Double = 0
    private var totalIncome: Double = 0
    private var yearlyValueGrowth: Double = 0
    
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
        
        // Adding cancel button
        view.addSubview(exportButton)
        exportButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: nil, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 20), size: .init(width: 24, height: 32))
        
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
        costPerSquareFoot = property.buyingPrice / property.squaredFeet
        squaredFootCost.text += String(format: "%.2f", costPerSquareFoot)
        
        // Calculating Yearly Tax
        totalTax = (property.buildingTax + property.propertyTax) * 12
        yearlyTax.text += String(format: "%.2f", totalTax)
        
        // Calculate Fees
        mothlyFees = property.yearlyFees / 12
        
        // Yearly Rent income
        rentTaxMonthly = property.buildingTax + property.propertyTax
        totalRentPositive = (property.rent - rentTaxMonthly) * 12.00
        yearlyIncome.text += String(format: "%.2f", totalRentPositive)
        
        
        // Monthly Rent Income
        totalRentMonthly = (property.rent - (rentTaxMonthly + mothlyFees))
        monthlyIncome.text += String(format: "%.2f", totalRentMonthly)
        
        // Gross Income
        totalIncome = (property.rent) * 12.00
        grossIncome.text += String(format: "%.2f", totalIncome)
        
        // Yearly Value Growth
        yearlyValueGrowth = property.buyingPrice - (property.buyingPrice * (property.valueGrowth))
        valueGrowth.text += String(format: "%.2f", yearlyValueGrowth)
    }
    
    @objc private func exportButtonPressed() {
        // Export Single Property to SpreadSheet file.
//        print("Exporting!")
        createCSV()
    }
    
    // Creating a CSV file to export Property (As a test)
    @objc private func createCSV() {
        let fileName = "\(property.name)-spreadsheet-info.csv"
        let path = NSURL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent(fileName)
        
        let name = "Name:,\(property.name)\nSquared Feet:,\(property.squaredFeet)\nOriginal Price:,$\(property.buyingPrice)\nYearly Growth:,$\(yearlyValueGrowth)\nPrice Per Squared Foot:,$\(costPerSquareFoot)\n"
        let monthly = " \nMonthly:\nRent:,$\(property.rent)\nHOA (Tax):,$\(property.buildingTax)\nProperty Tax:,$\(property.propertyTax)\nFees:,$\(mothlyFees)\nTotal:,$\(totalRentMonthly)\n"
        let yearly = " \nYearly:\nRent:,$\(totalIncome)\nTax:,$\(totalTax)\nFees:,$\(property.yearlyFees)\nIncome:,$\(totalRentPositive)"
        
        let csvText = name + monthly + yearly
        
        
        do {
            try csvText.write(to: path!, atomically: true, encoding: String.Encoding.utf8)
            
            let vc = UIActivityViewController(activityItems: [path], applicationActivities: [])
            vc.excludedActivityTypes = [
                UIActivity.ActivityType.assignToContact,
                UIActivity.ActivityType.saveToCameraRoll,
                UIActivity.ActivityType.postToFlickr,
                UIActivity.ActivityType.postToVimeo,
                UIActivity.ActivityType.postToTencentWeibo,
                UIActivity.ActivityType.postToTwitter,
                UIActivity.ActivityType.postToFacebook,
                UIActivity.ActivityType.openInIBooks
            ]
            present(vc, animated: true, completion: nil)
            
        } catch {
            
            print("Failed to create file")
            print("\(error)")
        }
    }
    
    @objc private func cancelButtonPressed() {
        // Remove current view
        self.dismiss(animated: true, completion: nil)
    }
}
