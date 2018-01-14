//
//  ViewController.swift
//  TwoButtons
//
//  Created by edan yachdav on 12/19/17.
//  Copyright © 2017 edan yachdav. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonOneTapped(_ sender: UIButton) {
        textLabel.text = "Button One"
    }
    
    @IBAction func buttonTwoTapped(_ sender: UIButton) {
        textLabel.text = "Button Two"
    }
}

