//
//  property.swift
//  REC - Real Estate Calculator
//
//  Created by timofey makhlay on 12/13/18.
//  Copyright © 2018 Timofey Makhlay. All rights reserved.
//

import UIKit

class Property {
    var name = "Item 1"
    var buyingPrice: Double = 0.0
    var rent: Double = 0.0
    var buildingTax: Double = 0.0
    var propertyTax: Double = 0.0
    var yearlyFees: Double = 0.0
    var valueGrowth: Double = 0.0
    var squaredFeet: Double = 0.0
    
    
    init(name: String, buyingPrice: Double, rent: Double, buildingTax: Double, propertyTax: Double, yearlyFees: Double, valueGrowth: Double, squaredFeet: Double) {
        self.name = name
        self.buyingPrice = buyingPrice
        self.rent = rent
        self.buildingTax = buildingTax
        self.propertyTax = propertyTax
        self.yearlyFees = yearlyFees
        self.valueGrowth = valueGrowth
        self.squaredFeet = squaredFeet
    }
    // Function to return property in JSON format to be able to store it with UserDefaults
    func getDictionary() -> [String: [String: Double]] {
        return [name: ["price": buyingPrice, "rent": rent, "buildingTax": buildingTax, "propertyTax": propertyTax, "fees":yearlyFees, "growth": valueGrowth, "squaredFeet":squaredFeet]]
    }
}
