//
//  NewProperty.swift
//  REC - Real Estate Calculator
//
//  Created by timofey makhlay on 12/13/18.
//  Copyright © 2018 Timofey Makhlay. All rights reserved.
//

import UIKit

class NewProperty: UIViewController {
    // Cell ID
    private var cellId = "property"
    
    // TODO: Instead of having table view, have a scrollable view.
    // Creating table view
    private var tableView = UITableView()
    
    // Array to fill up Table View
    private var valueToInput = ["Name", "Cost", "Rent", "HOA Dues", "Property Tax", "Yearly Fees", "Value Growth", "Squared Ft"]
    
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.7409107685, green: 0.6965670586, blue: 1, alpha: 1)
        addStyling()
        addTableView()
    }
    
    func addStyling() {
        // Adding cancel button
        view.addSubview(cancelButton)
        cancelButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 0, left: 20, bottom: 0, right: 0), size: .init(width: 35, height: 35))
        
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
    
    func addTableView() {
        // Add to Table View to View
        view.addSubview(tableView)
        
        // Table View Size
        tableView.anchor(top: coolShapedBackground.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, padding: .init(top: 80, left: 10, bottom: 0, right: 10))
        
        // Register Table View Cells
        tableView.register(PropertyInputCell.self, forCellReuseIdentifier: cellId)
        tableView.delegate = self
        tableView.dataSource = self
        
        // Table View Properties
        tableView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.allowsSelection = false
    }
    
    private func checkInput(){
        // Check if the input is given correcly
        
    }
    @objc private func cancelButtonPressed() {
        // Remove current view
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc private func saveButtonPressed() {
        // Save Property
        
    }

}

extension NewProperty: UITableViewDataSource {
    // Table View Rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return valueToInput.count
    }
    // Table View Cells
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Create Cells one by one using this as a blueprint.
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! PropertyInputCell
        // Set the cell label text
        cell.value.text = valueToInput[indexPath.row] + ":"
        cell.input.text = valueToInput[indexPath.row] + "..."
        
        // Push your cell to the table view
        return cell
    }
}

extension NewProperty: UITableViewDelegate {
    // Table View Cell Styling
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}
