//
//  MortgageView.swift
//  REC - Real Estate Calculator
//
//  Created by timofey makhlay on 12/20/18.
//  Copyright © 2018 Timofey Makhlay. All rights reserved.
//

import UIKit

class MortgageView: UIView, UITextFieldDelegate {
    
    // Creating Navbar
    private let navbar: UIView = {
        let navigationBar = UIView()
        navigationBar.alpha = 0
        return navigationBar
    }()
    
    // Addting title to Navbar
    let viewNavbarTitle: UITextView = {
        var title = UITextView()
        title.text = "Mortgage"
        title.font = UIFont.boldSystemFont(ofSize: 32)
        title.textColor = #colorLiteral(red: 0.7333333333, green: 0.6980392157, blue: 1, alpha: 1)
        title.backgroundColor = nil
        title.textAlignment = .center
        title.isEditable = false
        title.isScrollEnabled = false
        return title
    }()
    
    // Monthly Cost Button
    private let monthlyCostButton: UIButton = {
        let button = UIButton()
        button.setTitle("Monthly Cost", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.7333333333, green: 0.6980392157, blue: 1, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
                button.addTarget(self, action: #selector(monthlyCostButtonTapped), for: .touchUpInside)
        return button
    }()
    
    // Maximum Loan Button
    private let maximumLoanButton: UIButton = {
        let button = UIButton()
        button.setTitle("Maximum Loan", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.7333333333, green: 0.6980392157, blue: 1, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.addTarget(self, action: #selector(maximumLoanButtonTapped), for: .touchUpInside)
        return button
    }()
    
    // Underline to show what option they're on
    private let underline: UIView = {
        var view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.7409107685, green: 0.6965670586, blue: 1, alpha: 1)
        return view
    }()
    
    // Dollar Sign Label
    private let dollarSignLabel: UITextView = {
        let textView = UITextView()
        textView.text = "$"
        textView.font = UIFont.boldSystemFont(ofSize: 18)
        textView.backgroundColor = nil
        textView.textAlignment = .left
        textView.isEditable = false
        textView.isSelectable = false
        textView.isScrollEnabled = false
        textView.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return textView
    }()
    
    // MonthlyCost View
    private var monthlyCostView: UIView = {
        var view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.7409107685, green: 0.6965670586, blue: 1, alpha: 1)
        return view
    }()
    
    // Mortage Amount Label
    private let mortageAmountLabel: UITextView = {
        let textView = UITextView()
        textView.text = "Mortgage amount"
        textView.font = UIFont.systemFont(ofSize: 18)
        textView.backgroundColor = nil
        textView.textAlignment = .left
        textView.isEditable = false
        textView.isSelectable = false
        textView.isScrollEnabled = false
        textView.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return textView
    }()
    
    // Mortage Amount Input
    private let mortageAmountTextField: UITextField = {
        var textField = UITextField()
        textField.placeholder = "Mortgage Amount..."
        textField.font = UIFont.systemFont(ofSize: 18)
        textField.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        //        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.keyboardType = UIKeyboardType.default
        textField.returnKeyType = UIReturnKeyType.default
        textField.clearButtonMode = UITextField.ViewMode.whileEditing
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        //        textField.delegate = self
        textField.textAlignment = .left
        //        textField.addTarget(self, action: #selector(NewProperty.moveBackground), for: .touchDown)
        textField.tag = 0
        //        textField.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        return textField
    }()
    
    // Mortage Amount Label
    private let interestRateLabel: UITextView = {
        let textView = UITextView()
        textView.text = "Interest rate (%)"
        textView.font = UIFont.systemFont(ofSize: 17)
        textView.backgroundColor = nil
        textView.textAlignment = .left
        textView.isEditable = false
        textView.isSelectable = false
        textView.isScrollEnabled = false
        textView.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return textView
    }()
    
    // Mortage Amount Input
    private let interestRateTextField: UITextField = {
        var textField = UITextField()
        textField.placeholder = "3.875"
        textField.font = UIFont.systemFont(ofSize: 18)
        textField.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        //        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.keyboardType = UIKeyboardType.default
        textField.returnKeyType = UIReturnKeyType.default
        textField.clearButtonMode = UITextField.ViewMode.whileEditing
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        //        textField.delegate = self
        textField.textAlignment = .left
        //        textField.addTarget(self, action: #selector(NewProperty.moveBackground), for: .touchDown)
        textField.tag = 1
        //        textField.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        return textField
    }()
    
    // Mortage Amount Label
    private let mortgagePeriodLabel: UITextView = {
        let textView = UITextView()
        textView.text = "Mortgage period (years)"
        textView.font = UIFont.systemFont(ofSize: 17)
        textView.backgroundColor = nil
        textView.textAlignment = .left
        textView.isEditable = false
        textView.isSelectable = false
        textView.isScrollEnabled = false
        textView.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return textView
    }()
    
    // Mortage Amount Input
    private let mortgagePeriodTextField: UITextField = {
        var textField = UITextField()
        textField.placeholder = "10"
        textField.font = UIFont.systemFont(ofSize: 18)
        textField.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        //        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.keyboardType = UIKeyboardType.default
        textField.returnKeyType = UIReturnKeyType.default
        textField.clearButtonMode = UITextField.ViewMode.whileEditing
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        //        textField.delegate = self
        textField.textAlignment = .left
        //        textField.addTarget(self, action: #selector(NewProperty.moveBackground), for: .touchDown)
        textField.tag = 2
        //        textField.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        return textField
    }()
    
    // Mortgage Amount Label Underline
    private let amountLabelUnderline: UIView = {
        var view = UIView()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return view
    }()
    
    // Mortgage Rate underline
    private let rateLabelUnderline: UIView = {
        var view = UIView()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return view
    }()
    
    // Mortgage Period Underline
    private let periodLabelUnderline: UIView = {
        var view = UIView()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return view
    }()
    // Total mortgage cost outputLabel
    private let totalMortgageCostOutputLabel: UITextView = {
        let textView = UITextView()
        textView.text = "$0"
        textView.font = UIFont.systemFont(ofSize: 17)
        textView.backgroundColor = nil
        textView.textAlignment = .left
        textView.isEditable = false
        textView.isSelectable = false
        textView.isScrollEnabled = false
        textView.textColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        return textView
    }()
    
    // Total cost of morgage Label
    private let totalMortgageCostLabel: UITextView = {
        let textView = UITextView()
        textView.text = "Total cost of mortgage"
        textView.font = UIFont.systemFont(ofSize: 17)
        textView.backgroundColor = nil
        textView.textAlignment = .left
        textView.isEditable = false
        textView.isSelectable = false
        textView.isScrollEnabled = false
        textView.textColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        return textView
    }()
    
    // Mothly Payments outputLabel
    private let monthlyPaymentsOutputLabel: UITextView = {
        let textView = UITextView()
        textView.text = "$0"
        textView.font = UIFont.systemFont(ofSize: 17)
        textView.backgroundColor = nil
        textView.textAlignment = .left
        textView.isEditable = false
        textView.isSelectable = false
        textView.isScrollEnabled = false
        textView.textColor = #colorLiteral(red: 0.7409107685, green: 0.6965670586, blue: 1, alpha: 1)
        return textView
    }()
    
    // Total monthly payments Label
    private let monthlyPaymentsLabel: UITextView = {
        let textView = UITextView()
        textView.text = "Monthly Payments"
        textView.font = UIFont.systemFont(ofSize: 17)
        textView.backgroundColor = nil
        textView.textAlignment = .left
        textView.isEditable = false
        textView.isSelectable = false
        textView.isScrollEnabled = false
        textView.textColor = #colorLiteral(red: 0.7409107685, green: 0.6965670586, blue: 1, alpha: 1)
        return textView
    }()
    
    var isMonthlyCost = true
    
    // Pretty much ViewDidLoad() but for a view (without a controller)
    func loadSelf(superView: UIView, tabBar: UIView) {
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        superView.addSubview(self)
        self.anchor(top: superView.topAnchor, leading: superView.leadingAnchor, bottom: tabBar.topAnchor, trailing: superView.trailingAnchor)
        
        addCustomNavbar()
        addMortgageCalculatorChoices()
        
        addMonthlyCostView()
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
    }
    
    func addMortgageCalculatorChoices() {
        // Buttons Stack
        let buttonsStack = UIStackView(arrangedSubviews: [monthlyCostButton, maximumLoanButton])
        buttonsStack.translatesAutoresizingMaskIntoConstraints = false
        buttonsStack.distribution = .fillEqually
        buttonsStack.axis = .horizontal
        buttonsStack.spacing = 0
        
        addSubview(buttonsStack)
        
        buttonsStack.anchor(top: navbar.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 40, left: 20, bottom: 0, right: 20))
    }
    
    func addMonthlyCostView() {
        addSubview(monthlyCostView)
        
        // adding underline for the two options
        monthlyCostView.addSubview(underline)
        underline.anchor(top: monthlyCostButton.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: monthlyCostButton.trailingAnchor, size: .init(width: 0, height: 5))
        
        // Mortage Amount Label
        monthlyCostView.addSubview(mortageAmountLabel)
        mortageAmountLabel.anchor(top: underline.topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 25, left: 10, bottom: 0, right: 0))
        
        // Adding Dollar Sign
        monthlyCostView.addSubview(dollarSignLabel)
        dollarSignLabel.anchor(top: mortageAmountLabel.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 0, left: 10, bottom: 0, right: 0))
        
        // Mortgage Amount Input
        monthlyCostView.addSubview(mortageAmountTextField)
        mortageAmountTextField.anchor(top: mortageAmountLabel.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 7, left: 40, bottom: 0, right: 0))
        mortageAmountTextField.delegate = self
        // Underline for Mortgage Amount
        monthlyCostView.addSubview(amountLabelUnderline)
        amountLabelUnderline.anchor(top: mortageAmountTextField.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 10, left: 10, bottom: 0, right: 10), size: .init(width: 0, height: 2))
        
        // Stack View for Interest Rate and Maximum Loan
        let stack = UIStackView(arrangedSubviews: [interestRateLabel, mortgagePeriodLabel])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillEqually
        stack.axis = .horizontal
        stack.spacing = 0
        addSubview(stack)
        
        stack.anchor(top: amountLabelUnderline.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 30, left: 10, bottom: 0, right: 10))
        
        // Making the interest rate first
        monthlyCostView.addSubview(interestRateTextField)
        interestRateTextField.anchor(top: stack.bottomAnchor, leading: interestRateLabel.leadingAnchor, bottom: nil, trailing: interestRateLabel.trailingAnchor, padding: .init(top: 10, left: 5, bottom: 0, right: 0))
        interestRateTextField.delegate = self
        monthlyCostView.addSubview(rateLabelUnderline)
        rateLabelUnderline.anchor(top: interestRateTextField.bottomAnchor, leading: interestRateLabel.leadingAnchor, bottom: nil, trailing: interestRateLabel.trailingAnchor, padding: .init(top: 10, left: 0, bottom: 0, right: 10), size: .init(width: 0, height: 2))
        
        // Making Period Second
        monthlyCostView.addSubview(mortgagePeriodTextField)
        mortgagePeriodTextField.anchor(top: stack.bottomAnchor, leading: interestRateTextField.trailingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 10, left: 10, bottom: 0, right: 0))
        mortgagePeriodTextField.delegate = self
        
        monthlyCostView.addSubview(periodLabelUnderline)
        periodLabelUnderline.anchor(top: mortgagePeriodTextField.bottomAnchor, leading: mortgagePeriodTextField.leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 10, left: 0, bottom: 0, right: 10), size: .init(width: 0, height: 2))
        
        // Adding the background
        monthlyCostView.anchor(top: underline.bottomAnchor, leading: leadingAnchor, bottom: periodLabelUnderline.bottomAnchor, trailing: trailingAnchor, padding: .init(top: 10, left: 0, bottom: -30, right: 0))
        
        // Stack View for total cost of mortgage
        let stackTotalMortgage = UIStackView(arrangedSubviews: [totalMortgageCostLabel, totalMortgageCostOutputLabel])
        stackTotalMortgage.translatesAutoresizingMaskIntoConstraints = false
        stackTotalMortgage.distribution = .fillEqually
        stackTotalMortgage.axis = .horizontal
        stackTotalMortgage.spacing = 0
        monthlyCostView.addSubview(stackTotalMortgage)
        
        stackTotalMortgage.anchor(top: monthlyCostView.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 10, left: 0, bottom: 0, right: 0))
        
        // Stack View for monthly payments
        let stackMonthlyPayments = UIStackView(arrangedSubviews: [monthlyPaymentsLabel, monthlyPaymentsOutputLabel])
        stackMonthlyPayments.translatesAutoresizingMaskIntoConstraints = false
        stackMonthlyPayments.distribution = .fillEqually
        stackMonthlyPayments.axis = .horizontal
        stackMonthlyPayments.spacing = 0
        monthlyCostView.addSubview(stackMonthlyPayments)
        
        stackMonthlyPayments.anchor(top: stackTotalMortgage.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 10, left: 0, bottom: 0, right: 0))
    }
    
    // Function that runs when Maximum Loan Button is tapped
    @objc func maximumLoanButtonTapped() {
        monthlyCostView.removeFromSuperview()
        
        // Add Maximum Loan
    }
    
    // Function that runs when MonthlyCostButton is tapped
    @objc func monthlyCostButtonTapped() {
        // Remove Maximum Loan
        
        addMonthlyCostView()
    }
    
    // Calculate Mortgage Monthly cost
    private func calculateMortgageMonthlyCost() {
        let amount = Double(mortageAmountTextField.text!) ?? 0
        let rate = Double(interestRateTextField.text!) ?? 3.875
        let period = Double(mortgagePeriodTextField.text!) ?? 10
        
        let periodInMonths = period * 12
        let monthlyRate = (rate / 100) / 12
        
        let monthlyPaymentsOutput = ((monthlyRate * (pow(1 + monthlyRate, periodInMonths))) / (pow(1 + monthlyRate, periodInMonths) - 1)) * amount
        
        let totalCostMortgage = (monthlyRate * periodInMonths * amount) / (1 - (pow(1 + monthlyRate, -1 * periodInMonths)))
        
        totalMortgageCostOutputLabel.text = "$" +  totalCostMortgage.formattedWithSeparator
        monthlyPaymentsOutputLabel.text = "$" +  monthlyPaymentsOutput.formattedWithSeparator
    }
    
    
    // Funcrion that runs when done is pressed.
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        print("Return pressed")
        // Try to find next responder
        if let nextField = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField {
            nextField.becomeFirstResponder()
            calculateMortgageMonthlyCost()
        } else {
            // Not found, so remove keyboard.
            textField.resignFirstResponder()
            calculateMortgageMonthlyCost()
        }
        // Do not add a line break
        return true
    }
}
