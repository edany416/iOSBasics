//
//  AddGradingCriteriaViewController.swift
//  GradeTracker
//
//  Created by edan yachdav on 12/31/17.
//  Copyright © 2017 edan yachdav. All rights reserved.
//

import UIKit

class AddGradingCriteriaViewController: UIViewController {

    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var criteriaNameTextField: UITextField!
    @IBOutlet weak var criteriaWeightTextField: UITextField!
    @IBOutlet weak var equalWeightsSwitch: UISwitch!
    var newGradingCriteria: GradingCriteria?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        saveButton.isEnabled = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func criteriaNameEdited(_ sender: UITextField) {

        guard let name = criteriaNameTextField.text else {
            return
        }
        
        guard  let weight = criteriaWeightTextField.text else {
            return
        }
        
        if !name.isEmpty && !weight.isEmpty {
            saveButton.isEnabled = true
        } else {
            saveButton.isEnabled = false
        }
        
    }
    
    @IBAction func criteriaWeightEdited(_ sender: UITextField) {

        guard let name = criteriaNameTextField.text else {
            return
        }
        
        guard  let weight = criteriaWeightTextField.text else {
            return
        }
        
        if !name.isEmpty && !weight.isEmpty {
            saveButton.isEnabled = true
        } else {
            saveButton.isEnabled = false
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let name = criteriaNameTextField.text, let weight = Double(criteriaWeightTextField.text!) {
            newGradingCriteria = GradingCriteria(name: name, weight: weight, equalWeights: equalWeightsSwitch.isOn)
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "unwindSave" {
            if Double(criteriaWeightTextField.text!) == nil {
                return false
            }
        }
        return true
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
