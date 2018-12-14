//
//  PropertiesList.swift
//  REC - Real Estate Calculator
//
//  Created by timofey makhlay on 12/13/18.
//  Copyright © 2018 Timofey Makhlay. All rights reserved.
//

import UIKit

class PropertiesList: UIViewController {
    // Cell ID
    private let cellId = "cellId"
    
    var properties = [Property]()
    
    // Creating table view
    private var tableView = UITableView()
    
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
        
        // Testing property class
        var newProperty = Property(name: "Home 1", buyingPrice: 1000000, rent: 4500, buildingTax: 1000, propertyTax: 1000, yearlyFees: 300, valueGrowth: 0.6, squaredFeet: 2000)
        print(newProperty.getDictionary())
        properties.append(newProperty)
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
        tableView.register(TableViewCell.self, forCellReuseIdentifier: cellId)
        tableView.delegate = self
        tableView.dataSource = self
        
        // Table View Properties
        tableView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
    }
    
    @objc private func newPropertyButtonPressed() {
        let newViewController = NewProperty()
        self.present(newViewController, animated: true)
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
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! TableViewCell
        
        // Set the cell label text
        cell.propertyName.text = properties[indexPath.row].name
        cell.propertyValue.text = String(properties[indexPath.row].buyingPrice)
        
        // Push your cell to the table view
        return cell
    }
}

extension PropertiesList: UITableViewDelegate {
    // Table View Cell Styling
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}
