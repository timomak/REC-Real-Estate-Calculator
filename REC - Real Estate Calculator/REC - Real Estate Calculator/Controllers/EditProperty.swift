//
//  EditProperty.swift
//  REC - Real Estate Calculator
//
//  Created by timofey makhlay on 12/15/18.
//  Copyright © 2018 Timofey Makhlay. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class EditProperty: UIViewController {
    // Property to Edit
    var property: Property = Property(name: " ", buyingPrice: 0, rent: 0, buildingTax: 0, propertyTax: 0, yearlyFees: 0, valueGrowth: 0, squaredFeet: 0)
    
    // Connect to Firebase Database
    var ref: DatabaseReference!
    
    // Property Values track
    private var name: String = ""
    private var buyingPrice: Double = 0
    private var rent: Double = 0
    private var buildingTax: Double = 0
    private var propertyTax: Double = 0
    private var yearlyFees: Double = 0
    private var valueGrowth: Double = 0
    private var squaredFeet: Double = 0
    
    // Creating Cancel button
    private let cancelButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        button.layer.cornerRadius = 30
        button.setImage(#imageLiteral(resourceName: "CancelButton"), for: .normal)
        button.imageView?.contentMode = .scaleToFill
        button.addTarget(self, action: #selector(cancelButtonPressed), for: .touchUpInside)
        return button
    }()
    
    // Creating Calculate button
    private let calculateButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        button.layer.cornerRadius = 15
        button.setTitle("Calculate", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.7333333333, green: 0.6980392157, blue: 1, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(calculateButtonPressed), for: .touchUpInside)
        return button
    }()
    
    // Creating Save in button
    private let saveButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        button.layer.cornerRadius = 30
        button.setImage(#imageLiteral(resourceName: "SaveButton"), for: .normal)
        button.imageView?.contentMode = .scaleToFill
        button.addTarget(self, action: #selector(saveButtonPressed), for: .touchUpInside)
        return button
    }()
    // Adding House image
    private var houseImage: UIImageView = {
        var newImage = UIImageView()
        newImage.image = #imageLiteral(resourceName: "houseImage")
        return newImage
    }()
    
    // Adding Fence looking background
    private var coolShapedBackground: UIImageView = {
        var newImage = UIImageView()
        newImage.image = #imageLiteral(resourceName: "layoutBackground")
        return newImage
    }()
    
    // Adding labels and Inputs
    private let valueView = EditValueView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.7409107685, green: 0.6965670586, blue: 1, alpha: 1)
        addStyling()
        valueView.addView(superview: view, toView: coolShapedBackground, property: property)
        hideKeyboardWhenTappedAround()
    }
    
    func addStyling() {
        // Adding cancel button
        view.addSubview(cancelButton)
        cancelButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 0, left: 20, bottom: 0, right: 0), size: .init(width: 35, height: 35))
        
        // Adding calculate button
        view.addSubview(calculateButton)
        calculateButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: 170, height: 35))
        calculateButton.centerHorizontalOfView(to: view)
        
        // Adding Save button
        view.addSubview(saveButton)
        saveButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: nil, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 20), size: .init(width: 35, height: 35))
        
        // Adding House Image
        view.addSubview(houseImage)
        houseImage.anchor(top: view.topAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: view.bounds.height/8, left: 0, bottom: 0, right: 0), size: .init(width: 237, height: 200))
        houseImage.centerHorizontalOfView(to: view)
        
        // Adding Fence Background
        view.addSubview(coolShapedBackground)
        coolShapedBackground.anchor(top: houseImage.bottomAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, padding: .init(top: 20, left: 0, bottom: 0, right: 0))
    }
    
    @objc private func cancelButtonPressed() {
        PropertiesList().refreshDataInTable()
        // Remove current view
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc private func calculateButtonPressed() {
        let newProperty = valueView.createPropertyModel()
        print("New Property Name: ", newProperty.name)

        
        let newViewController = Calculate()
        newViewController.property = newProperty
        self.present(newViewController, animated: true)
        
        
    }
//    // Creating a CSV file to export Property (As a test)
//    func createCSV(from propertye:Property) {
//        let fileName = "\(propertye.name).csv"
//        let path = NSURL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent(fileName)
//
//        var csvText = "Name,Cost,Remt\n\(propertye.name),\(propertye.buyingPrice),\(propertye.rent),\(propertye.)"
//
//
//            do {
//                try csvText.write(to: path!, atomically: true, encoding: String.Encoding.utf8)
//
//                let vc = UIActivityViewController(activityItems: [path], applicationActivities: [])
//                vc.excludedActivityTypes = [
//                    UIActivity.ActivityType.assignToContact,
//                    UIActivity.ActivityType.saveToCameraRoll,
//                    UIActivity.ActivityType.postToFlickr,
//                    UIActivity.ActivityType.postToVimeo,
//                    UIActivity.ActivityType.postToTencentWeibo,
//                    UIActivity.ActivityType.postToTwitter,
//                    UIActivity.ActivityType.postToFacebook,
//                    UIActivity.ActivityType.openInIBooks
//                ]
//                present(vc, animated: true, completion: nil)
//
//            } catch {
//
//                print("Failed to create file")
//                print("\(error)")
//            }
//    }
    
    @objc private func saveButtonPressed() {
        // Save Property
        
        // TODO: Add conditional to check if is editing or creating new
        let newProperty = valueView.createPropertyModel()
        print("New Property Name: ", newProperty.name)
        
        // Get User ID
        let userUID = Auth.auth().currentUser?.uid
        
        // Send Property to Database
        sendPropertyToDatabase(userId: userUID!, propertyToUpdate: newProperty.getDictionary())
        
        // Dimiss View
        self.dismiss(animated: true, completion: nil)
    }
    
    func sendPropertyToDatabase(userId: String, propertyToUpdate: [String: [String: Double]]) {
        // Saving to Database
       Database.database().reference().child("users").child(userId).child("properties").child(String(property.id)).removeValue()
        
        Database.database().reference().child("users").child(userId).child("properties").childByAutoId().setValue(propertyToUpdate)
        //        print("Properties: ", property)
    }
    
    @objc func moveBackground() {
        UIView.animate(withDuration: 1, animations: {
            self.coolShapedBackground.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100).isActive = true
            }, completion: nil)
    }
}
