//
//  LoginViewController.swift
//  SnapChat
//
//  Created by Emil Vaklinov on 06/05/2020.
//  Copyright © 2020 Emil Vaklinov. All rights reserved.
//

import UIKit

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
    }
    
    @IBAction func bottomTapped(_ sender: Any) {
        if signupMode {
            //Switch to log in
            signupMode = false
            topButton.setTitle("Log In", for: .normal)
            bottomButton.setTitle("Switch to Sign Up", for: .normal)
        }else{
            signupMode = true
            bottomButton.setTitle("Sign Up", for: .normal)
            topButton.setTitle("Switch to Log In", for: .normal)
        }
    }
}

