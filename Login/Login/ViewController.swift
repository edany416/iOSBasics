//
//  ViewController.swift
//  Login
//
//  Created by edan yachdav on 12/22/17.
//  Copyright © 2017 edan yachdav. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var forgotUserNameButton: UIButton!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    @IBOutlet weak var userNameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func forgotUserNameButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "segueToLandingScreen", sender: forgotUserNameButton)
    }
    
    @IBAction func forgotPasswordTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "segueToLandingScreen", sender: forgotPasswordButton)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let sender = sender as? UIButton else {return}
        
        if sender == forgotUserNameButton {
            segue.destination.title = "For User Name"
        } else if sender == forgotPasswordButton {
            segue.destination.title = "Forgot Password"
        } else {
            segue.destination.title = userNameTextField.text
        }
    }

}

