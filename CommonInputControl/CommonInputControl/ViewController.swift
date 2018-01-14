//
//  ViewController.swift
//  CommonInputControl
//
//  Created by edan yachdav on 12/19/17.
//  Copyright © 2017 edan yachdav. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var toggle: UISwitch!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var button: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        print("Button was tapped")
        if toggle.isOn {
            print("Switch is on")
        } else {
            print("Switch is off")
        }
        
        print("The slider is set to \(slider.value)")
    }
    @IBAction func switchTapped(_ sender: UISwitch) {
        if sender.isOn {
            print("Switch is on")
        } else {
            print("Switch is off")
        }
    }
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        print(sender.value)
    }
    @IBAction func keyboardReturnKeyTapped(_ sender: UITextField) {
        if let text = sender.text {
            print(text)
        }
    }
    @IBAction func textChanged(_ sender: UITextField) {
        
        if let text = sender.text {
            print(text)
        }
    }
    @IBAction func respondToTapGesture(_ sender: UITapGestureRecognizer) {
        let location = sender.location(in: view)
        print(location)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

