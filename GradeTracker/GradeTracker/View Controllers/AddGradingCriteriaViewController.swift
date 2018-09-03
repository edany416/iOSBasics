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
    var newGradingCriteria: GradingCriteria?
    var course:Course!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        criteriaNameTextField.becomeFirstResponder()
        
        let lineColor = UIColor(red:0.12, green:0.23, blue:0.35, alpha:1.0)
        self.criteriaNameTextField.setBottomLine(borderColor: lineColor)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Make sure user can't save without entering any data
        saveButton.isEnabled = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        criteriaNameTextField.resignFirstResponder()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Create the new grading criteria and append to list
        if let segueId = segue.identifier, segueId == "unwindSave" {
            newGradingCriteria = GradingCriteria(criteriaNameTextField.text!)
            course.appendCriteria(newGradingCriteria!)
        }
    }
    
    
    // Set the isEnabled property for the save button based on whether
    // text was entered into the name text field or not
    @IBAction func criteriaNameEdited(_ sender: UITextField) {
        
        // Check if text field was instantiated
        guard let name = criteriaNameTextField.text else {
            return
        }
        
        // Check if text was entered into name field.
        // If text was entered, enable save button, otherwise keep disabled
        if !name.isEmpty {
            saveButton.isEnabled = true
        } else {
            saveButton.isEnabled = false
        }
        
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
