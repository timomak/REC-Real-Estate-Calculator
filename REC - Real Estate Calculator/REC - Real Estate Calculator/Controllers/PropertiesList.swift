//
//  PropertiesList.swift
//  REC - Real Estate Calculator
//
//  Created by timofey makhlay on 12/13/18.
//  Copyright © 2018 Timofey Makhlay. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class PropertiesList: UIViewController {
    // Connect to Firebase Database
    var ref: DatabaseReference!
    
    
    // Cell ID
    private let cellId = "cellId"
    
    // Array of Properties used to create Cells
    var properties = [Property]()
    
    // Creating table view
    var tableView = UITableView()
    
    // Creating Navbar
    private let navbar: UIView = {
        let navigationBar = UIView()
        navigationBar.alpha = 0
        return navigationBar
    }()
    
    // Addting title to Navbar
    let viewNavbarTitle: UITextView = {
        var title = UITextView()
        title.text = "Properties"
        title.font = UIFont.boldSystemFont(ofSize: 32)
        title.textColor = #colorLiteral(red: 0.7333333333, green: 0.6980392157, blue: 1, alpha: 1)
        title.backgroundColor = nil
        title.textAlignment = .center
        title.isEditable = false
        title.isScrollEnabled = false
        return title
    }()

    // Adding Button To Navbar
    private let addNewPropertyButton: UIButton = {
        let button = UIButton()
//        button.setImage(#imageLiteral(resourceName: "+"), for: .normal)
//        button.imageEdgeInsets = UIEdgeInsets(top: 50, left: 25, bottom: 50, right: 25)
        button.setTitle("+", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.7333333333, green: 0.6980392157, blue: 1, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 40)
//        button.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        button.addTarget(self, action: #selector(newPropertyButtonPressed), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        addCustomNavbar()
        addTableView()
        
        
        // Returns: dataProperties
        if UserDefaults.standard.bool(forKey: "hasProperty") != nil {
            // Can unwrap an populate property list
            if UserDefaults.standard.dictionary(forKey: "properties") != nil {
                unwrapDictionary(toUnwrap: UserDefaults.standard.dictionary(forKey: "properties") as! [String : [String : [String : Double]]])
            }
        }
    }
    
    
    
    func addCustomNavbar() {
        // Adding Navbar View
        view.addSubview(navbar)
        
        // Navbar Size
        navbar.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, size: .init(width: view.bounds.width, height: 100))
        
        // Adding Button to Navbar
        view.addSubview(addNewPropertyButton)
        
        // Button Size
        addNewPropertyButton.anchor(top: navbar.topAnchor, leading: nil, bottom: nil, trailing: navbar.trailingAnchor, padding: .init(top: 40, left: 0, bottom: 0, right: 20), size: .init(width: 48, height: 48))

        // Adding Title to Navbar
        view.addSubview(viewNavbarTitle)
        
        // Title Size
        viewNavbarTitle.anchor(top: navbar.topAnchor, leading: navbar.leadingAnchor, bottom: navbar.bottomAnchor, trailing: nil, padding: .init(top: 40, left: 30, bottom: 5, right: 0))
    }
    
    func addTableView() {
        // Add to Table View to View
        view.addSubview(tableView)
        
        // Table View Size
        tableView.anchor(top: navbar.bottomAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
        
        // Register Table View Cells
        tableView.register(PropertyListCell.self, forCellReuseIdentifier: cellId)
        tableView.delegate = self
        tableView.dataSource = self
        
        // Table View Properties
        tableView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.allowsSelection = true
        var refreshControl = UIRefreshControl()
        tableView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(refreshData(_:)), for: .valueChanged)
    }
    @objc func refreshData(_ sender: Any) {
        refreshDataInTable()
        tableView.refreshControl?.endRefreshing()
//        tableView.activityIndicatorView.stopAnimating()
        
    }
    
    func refreshDataInTable() {
        // Reload data
        // Returns: dataProperties
        Login().readPropertiesFromDatabase()
        properties = []
        if UserDefaults.standard.bool(forKey: "hasProperty") == true {
            // Can unwrap an populate property list
            if let propertyToUnwrap = UserDefaults.standard.dictionary(forKey: "properties") as?  [String : [String : [String : Double]]]{
                unwrapDictionary(toUnwrap: propertyToUnwrap)
            }
        }
        tableView.reloadData()
    }
    
    @objc private func newPropertyButtonPressed() {
        let newViewController = NewProperty()
        self.present(newViewController, animated: true)
    }
    
    func unwrapDictionary(toUnwrap: [String: [String : [String : Double]]]) {
//        print("Starting Unwrapping of dictionary\n")
        var id: String = String()
        var name: String = String()
        var buyingPrice: Double = Double()
        var rent: Double = Double()
        var buildingTax: Double = Double()
        var propertyTax: Double = Double()
        var yearlyFees: Double = Double()
        var valueGrowth: Double = Double()
        var squaredFeet: Double = Double()
        
//        print("Dictionary: ", toUnwrap)
        for (propertyId, dictionary) in toUnwrap {
//            print("Property Id: ", propertyId)
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
                    print("Name: \(name) [\(nameOfValue): \(value)]")
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
    func deleteProperty(userId: String, propertyToDelete: Property) {
    Database.database().reference().child("users").child(userId).child("properties").child(propertyToDelete.id).removeValue()
    }
}

extension PropertiesList: UITableViewDataSource {
    // Table View Rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return properties.count
    }
    
    // Table View Cells
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Create Cells one by one using this as a blueprint.
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! PropertyListCell
        
        // Set the cell label text
        cell.propertyName.text = properties[indexPath.row].name
        cell.propertyValue.text = String(properties[indexPath.row].buyingPrice)
        cell.selectionStyle = UITableViewCell.SelectionStyle.none 
        // Push your cell to the table view
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let newViewController = EditProperty()
        newViewController.property = properties[indexPath.row]
        self.present(newViewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            print("Deleted")
            deleteProperty(userId: (Auth.auth().currentUser?.uid)!, propertyToDelete: properties[indexPath.row])
            self.properties.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}

extension PropertiesList: UITableViewDelegate {
    // Table View Cell Styling
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}
