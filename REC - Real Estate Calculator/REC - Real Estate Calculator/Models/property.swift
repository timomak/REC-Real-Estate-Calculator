//
//  property.swift
//  REC - Real Estate Calculator
//
//  Created by timofey makhlay on 12/13/18.
//  Copyright © 2018 Timofey Makhlay. All rights reserved.
//

import UIKit

class Property {
    // Property's Properties ;)
    var name: String
    var buyingPrice: Double
    var rent: Double
    var buildingTax: Double
    var propertyTax: Double
    var yearlyFees: Double
    var valueGrowth: Double
    var squaredFeet: Double
    var id: String = ""
    
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
    // Function to return property in JSON format to be able to store it with Firebase
    func getDictionary() -> [String: [String: Double]] {
        return [name: ["price": buyingPrice, "rent": rent, "buildingTax": buildingTax, "propertyTax": propertyTax, "fees":yearlyFees, "growth": valueGrowth, "squaredFeet":squaredFeet]]
    }
    
    // Function to return property in JSON format to be able to store it with Firebase
    func getDictionaryWithId() -> [String: [String: [String: Double]]] {
        return [id: [name: ["price": buyingPrice, "rent": rent, "buildingTax": buildingTax, "propertyTax": propertyTax, "fees":yearlyFees, "growth": valueGrowth, "squaredFeet":squaredFeet]]]
    }
}
