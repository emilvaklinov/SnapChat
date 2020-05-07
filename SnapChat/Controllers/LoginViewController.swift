//
//  LoginViewController.swift
//  SnapChat
//
//  Created by Emil Vaklinov on 06/05/2020.
//  Copyright © 2020 Emil Vaklinov. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    var signupMode = false
    
    @IBOutlet weak var topButton: UIButton!
    
    @IBOutlet weak var bottomButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func topTapped(_ sender: Any) {
        if let email = emailTextField.text {
            if let password = passwordTextField.text {
                if signupMode {
                    //Sign up
                    Auth.auth().createUser(withEmail: email, password: password, completion: {(user, error) in
                        if let error = error {
                            self.presentAlert(alert: error.localizedDescription)
                        } else {
                            print("Sign up was succesful")
                            self.performSegue(withIdentifier: "moveToSnaps", sender: nil)
                        }
                    })
                }else{
                    //Log in
                    Auth.auth().signIn(withEmail: email, password: password, completion: {(user, error) in
                        if let error = error {
                            self.presentAlert(alert: error.localizedDescription)
                        } else {
                            print("Log in was succesful")
                            self.performSegue(withIdentifier: "moveToSnaps", sender: nil)
                        }
                        
                    })
                }
            }
        }
        
    }
    
    func presentAlert(alert: String) {
        let aletVC = UIAlertController(title: "Error", message: alert, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { (action) in
            aletVC.dismiss(animated: true, completion: nil)
        }
        aletVC.addAction(okAction)
        present(aletVC, animated: true, completion: nil)
        
    }
    
    @IBAction func bottomTapped(_ sender: Any) {
        if signupMode {
            //Switch to log in
            signupMode = false
            topButton.setTitle("Log In", for: .normal)
            bottomButton.setTitle("Switch to Sign Up", for: .normal)
        }else{
            signupMode = true
            topButton.setTitle("Sign Up", for: .normal)
            bottomButton.setTitle("Switch to Log In", for: .normal)
        }
    }
}

