//
//  ViewController.swift
//  FunWithFirebase
//
//  Created by John Cobb on 8/24/17.
//  Copyright © 2017 Geodesity, LLC. All rights reserved.
//

import UIKit
import FirebaseAuth


class ViewController: UIViewController {
    
    
    @IBOutlet var emailText: UITextField!
    @IBOutlet var passwordText: UITextField!
    @IBOutlet var segmentControl: UISegmentedControl!
    @IBOutlet var actionButton: UIButton!
    
    @IBAction func actionButton(_ sender: Any) {

        if emailText.text != "" && passwordText.text != "" {
            
            if segmentControl.selectedSegmentIndex == 0 {
                // Login User
                Auth.auth().signIn(withEmail: emailText.text!, password: passwordText.text!, completion: { (user, error) in
                    if user != nil {
                        // Signin successful
                        print("SUCCESS")
                        self.performSegue(withIdentifier: "segue", sender: self)
                        
                    } else {
                        // Signin unsuccessful
                        if let myError =  error?.localizedDescription {
                            print(myError)
                        } else {
                            print("ERROR")
                        }
                    }
                })
                
                
            } else {
                // Signup User
                
                Auth.auth().createUser(withEmail: emailText.text!, password: passwordText.text!, completion: { (user, error) in
                    if user != nil {
                        // Successful Signup
                        print("SUCCESS")
                        self.performSegue(withIdentifier: "segue", sender: self)
                        
                    } else {
                        if let myError =  error?.localizedDescription {
                            print(myError)
                        } else {
                            print("ERROR")
                        }
                    }
                })
                
            }
        } else {
            print("Username and Password Required!")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

