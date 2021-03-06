//
//  ViewController.swift
//  REC - Real Estate Calculator
//
//  Created by timofey makhlay on 12/13/18.
//  Copyright © 2018 Timofey Makhlay. All rights reserved.
//

import UIKit
// To be able to sign in:
import Firebase
import FirebaseDatabase
import GoogleSignIn

class Login: UIViewController, GIDSignInUIDelegate, GIDSignInDelegate {
    
    var ref: DatabaseReference!
    
    // Title
    private let brandName: UITextView = {
        let textView = UITextView()
        textView.font = UIFont(name: "Avenir Next", size: 60)
        textView.text = "Real Estate"
        textView.backgroundColor = nil
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isSelectable = false
        textView.isScrollEnabled = false
        textView.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return textView
    }()
    // Subtitle
    private let subTitle: UITextView = {
        let textView = UITextView()
        textView.font = UIFont(name: "Avenir Next", size: 50)
        textView.backgroundColor = nil
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isSelectable = false
        textView.isScrollEnabled = false
        textView.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        textView.text = "Calculator"

        return textView
    }()
    
    var isSignedIn = false
    
    var username: String?
    var email: String?
    var uid: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.7333333333, green: 0.6980392157, blue: 1, alpha: 1)
//        GIDSignIn.sharedInstance().signOut()
//        GIDSignIn.sharedInstance().disconnect()
        
        addGoogleButton()
        
        // Adding Title
        view.addSubview(brandName)
        brandName.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, size: .init(width: view.bounds.width, height: view.bounds.height / 7))
        
        // Adding Subtitle
        view.addSubview(subTitle)
        subTitle.anchor(top: brandName.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor)
        
    }
    func addGoogleButton() {
        // Configure Google Sign In
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().delegate = self
        
        // automatically sign in the user.
        GIDSignIn.sharedInstance().signInSilently()
        
        GIDSignIn.sharedInstance().signIn()
        
        // Add Google button
        let googleButton = GIDSignInButton()
        googleButton.layer.cornerRadius = 10
        googleButton.addTarget(self, action: #selector(loadNextView), for: .touchUpInside)
        view.addSubview(googleButton)
        googleButton.anchor(top: nil, leading: nil, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: nil, padding: .init(top: 0, left: 0, bottom: 20, right: 0), size: .init(width: view.bounds.width / 1.2, height: view.bounds.height / 16))
        googleButton.centerHorizontalOfView(to: view)
        
    }

    @objc private func loadNextView() {
//        print("Button pressed")
        // Present Next View
        if isSignedIn == true {
            if UserDefaults.standard.integer(forKey: "numberOfUses") == 1 {
                print("Not the first time.", UserDefaults.standard.bool(forKey: "firstTime"))
                let newViewController = PropertiesList()
                self.present(newViewController, animated: true)
            }
            else {
                print("First time.")
                let layout = UICollectionViewFlowLayout()
                layout.scrollDirection = .horizontal
                let newViewController = SwipingController(collectionViewLayout: layout)
                self.present(newViewController, animated: true)
            }
        }
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error?) {
        // ...
        if let error = error {
            print("Problem at signing in with google with error : \(error)")
            return
        }
        
        guard let authentication = user.authentication else { return }
        let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                       accessToken: authentication.accessToken)
        // ...
        
        
        Auth.auth().signInAndRetrieveData(with: credential) { (authResult, error) in
            if let error = error {
                print("Problem at signing in with google in Auth with error : \(error)")
                return
            }
            // User is signed in
            self.isSignedIn = true
            
            print("User Logged in maybe")
            self.username = Auth.auth().currentUser?.displayName
            self.email = Auth.auth().currentUser?.email
            self.uid = Auth.auth().currentUser?.uid
            print("user successfully signed in through GOOGLE! uid:\(String(describing: Auth.auth().currentUser!.email))")
            
            self.readPropertiesFromDatabase()
            self.loadNextView()
        }
    }
    
    func readPropertiesFromDatabase() {
        let userUID = Auth.auth().currentUser?.uid
         print("Setting query Path and saving firebase data Locally. User Id : ", userUID!)
        
        // Path to user's properties
        let query = Database.database().reference().child("users").child(userUID!).child("properties")
        // Using the path find the properties.
        query.observe(.value, with: { snapshot in
            print("SnapSHot as any: ", snapshot.value! as! Any)
            // If there is data already, make the data into an array and save it as userdefaults.
            if let snapshotValue = snapshot.value as? [String: [String:[String:Double]]] {
                 print("Snapshot value as super array: ", snapshotValue)
                var dataProperties = snapshotValue as! [String: [String:[String:Double]]]
                print("dataProperties value as super array: ", dataProperties)
                UserDefaults.standard.set(dataProperties, forKey: "properties")
                // Making sure that the rest of the app knows that there are properties already in the app.
                UserDefaults.standard.set(true, forKey: "hasProperty")
                UserDefaults.standard.synchronize()
            } else {
                UserDefaults.standard.set(false, forKey: "hasProperty")
                UserDefaults.standard.synchronize()
            }
        })
    }
}

