//
//  LoginViewController.swift
//  Let's Get Fit!
//
//  Created by Belal Elsiesy on 10/29/18.
//  Copyright © 2018 Elsiesy Industries. All rights reserved.
//

import UIKit
import Firebase


class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func loginPressed(_ sender: UIButton) {
        // TODO:Do some form validation on the email and password
        if let email = emailTextField.text,let pass = passwordTextField.text {
        //Sign in user with Firebase
            Auth.auth().signIn(withEmail: email, password: pass) { (user, error) in
                
            // Check that user isn't nil
                if let u = user {
                    // User is found, go to next view controller
                    self.performSegue(withIdentifier: "goToHome", sender: self)
                } else {
                    //Error:  check error and show message
                }
            }
        }
    }
    
    @IBAction func registerPressed(_ sender: UIButton) {
        // TODO: Do some validation on the email
        
        //Register the user with Firebase
          if let email = emailTextField.text,let pass = passwordTextField.text {
            Auth.auth().createUser(withEmail: email, password: pass) { (user, error) in
                // Check that user isn't nil
                if let u = user {
                    // User is found, go to next view controller
                    self.performSegue(withIdentifier: "createProfile", sender: self)
                } else {
                    //Error:  check error and show message
                }
            }
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //Dismiss the keyboard when the view is tapped on
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
    }
}

