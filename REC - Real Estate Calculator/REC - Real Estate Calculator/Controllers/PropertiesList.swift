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

    // Creating Export button
    private let exportButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        button.layer.cornerRadius = 0
        button.setImage(#imageLiteral(resourceName: "export-purple"), for: .normal)
        button.imageView?.contentMode = .scaleToFill
        button.addTarget(self, action: #selector(createCSV), for: .touchUpInside)
        return button
    }()
    
    // Adding Button To Navbar
    private let addNewPropertyButton: UIButton = {
        let button = UIButton()
        button.setTitle("+", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.7333333333, green: 0.6980392157, blue: 1, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 40)
        button.addTarget(self, action: #selector(newPropertyButtonPressed), for: .touchUpInside)
        return button
    }()
    
    // Adding Button To tabBar
    private let searchButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.3098039329, green: 0.01568627544, blue: 0.1294117719, alpha: 1)
        button.layer.cornerRadius = 0
        button.setImage(#imageLiteral(resourceName: "export-purple"), for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
        button.tag = 0
        button.addTarget(self, action: #selector(searchButtonPressed), for: .touchUpInside)
        return button
    }()

    // Adding Button To tabBar
    private let propertiesButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)
        button.layer.cornerRadius = 0
        button.setImage(#imageLiteral(resourceName: "export-purple"), for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
        button.tag = 1
        button.addTarget(self, action: #selector(propertiesButtonPressed), for: .touchUpInside)
        return button
    }()

    // Adding Button To tabBar
    private let profileButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        button.layer.cornerRadius = 0
        button.setImage(#imageLiteral(resourceName: "export-purple"), for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
        button.tag = 2
        button.addTarget(self, action: #selector(profileButtonPressed), for: .touchUpInside)
        return button
    }()

    // Creating tabBar
    private let tabBar: UIView = {
        let navigationBar = UIView()
        navigationBar.alpha = 0
        return navigationBar
    }()
    
    private var searchView = SearchView()
    private var profileView = ProfileView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        // Adding TabBar to Handle all logic of View
        addCustomTabar()
        // Adding as Default View
        propertiesButtonPressed()
        

    }
    
    @objc func searchButtonPressed() {
        removeAllViews()
        // TODO: Add the search View
        searchView.loadSelf(superView: view, tabBar: tabBar)
    }
    
    @objc func propertiesButtonPressed() {
        removeAllViews()
        // TODO: Remove other views
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
    
    @objc private func profileButtonPressed() {
        removeAllViews()
        profileView.loadSelf(superView: view, tabBar: tabBar)
    }
    
    private func removeAllViews() {
        navbar.removeFromSuperview()
        addNewPropertyButton.removeFromSuperview()
        viewNavbarTitle.removeFromSuperview()
        exportButton.removeFromSuperview()
        tableView.removeFromSuperview()
        searchView.removeFromSuperview()
        profileView.removeFromSuperview()
        
        // TODO: Remove Search view and Profile view here.
    }
    
    override func viewDidAppear(_ animated: Bool) {
//        print("view did appear")
        refreshDataInTable()
        tableView.reloadData()
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

        // Adding Export Button to Navbar
        view.addSubview(exportButton)
        
        // Export Button Size
        exportButton.anchor(top: nil, leading: nil, bottom: addNewPropertyButton.bottomAnchor, trailing: addNewPropertyButton.leadingAnchor, padding: .init(top: 0, left: 0, bottom: 7, right: 7), size: .init(width: 24, height: 32))
        
        // Adding Title to Navbar
        view.addSubview(viewNavbarTitle)
        
        // Title Size
        viewNavbarTitle.anchor(top: navbar.topAnchor, leading: navbar.leadingAnchor, bottom: navbar.bottomAnchor, trailing: nil, padding: .init(top: 40, left: 30, bottom: 5, right: 0))
    }

    func addCustomTabar() {
        // Adding tab bar background
        view.addSubview(tabBar)
        tabBar.anchor(top: nil, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, size: .init(width: view.bounds.width, height: 80))

        // Buttons Stack
        let buttonsStack = UIStackView(arrangedSubviews: [searchButton, propertiesButton, profileButton])
        buttonsStack.translatesAutoresizingMaskIntoConstraints = false
        buttonsStack.distribution = .fillEqually
        buttonsStack.axis = .horizontal
        buttonsStack.spacing = 20
        
        view.addSubview(buttonsStack)
        buttonsStack.anchor(top: tabBar.topAnchor, leading: tabBar.leadingAnchor, bottom: tabBar.bottomAnchor, trailing: tabBar.trailingAnchor)
    }
    
    func addTableView() {
        // Add to Table View to View
        view.addSubview(tableView)
        
        // Table View Size
        tableView.anchor(top: navbar.bottomAnchor, leading: view.leadingAnchor, bottom: tabBar.topAnchor, trailing: view.trailingAnchor)
        
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
    func deleteProperty(userId: String, propertyToDelete: Property) {
    Database.database().reference().child("users").child(userId).child("properties").child(propertyToDelete.id).removeValue()
    }
    
    // Creating a CSV file to export Property (As a test)
    @objc private func createCSV() {
        let fileName = "\(Auth.auth().currentUser!.displayName!)-spreadsheet-info.csv"
        let path = NSURL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent(fileName)
        var csvText = "Name,Cost,Rent,Building Tax,Property Tax,Yearly Fees,Value Growth,Squared Feet\n"
        var totalTaxAndFees: Double = 0
        var totalRent: Double = 0
        var totalIncome: Double = 0
        
        
        for property in properties {
            // Creating line for each Property to add to spreadsheet
            csvText += "\(property.name),$ \(property.buyingPrice),$ \(property.rent),$ \(property.buildingTax),$ \(property.propertyTax),$ \(property.yearlyFees),\(property.valueGrowth),\(property.squaredFeet)\n"
            
            
            // Calculating Total tax and Fees yearly
            totalTaxAndFees += ((property.propertyTax + property.buildingTax) * 12) + property.yearlyFees
            // Calculating Total rent Yearly
            totalRent += property.rent * 12

        }
        totalIncome = totalRent - totalTaxAndFees
        csvText += " \nYearly\nTax + Fees,$ \(totalTaxAndFees)\nRent,$ \(totalRent)\nTotal,$ \(totalIncome)\n"
        csvText += " \nMothly\nTax + Fees,$ \(totalTaxAndFees / 12)\nRent,$ \(totalRent / 12)\nTotal,$ \(totalIncome / 12)\n"
        
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
