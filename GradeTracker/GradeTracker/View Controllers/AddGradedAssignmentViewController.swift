//
//  AddGradedAssignmentViewController.swift
//  GradeTracker
//
//  Created by edan yachdav on 1/6/18.
//  Copyright © 2018 edan yachdav. All rights reserved.
//

import UIKit



class AddGradedAssignmentViewController: UIViewController {
    
    @IBOutlet weak var assignmentNameTextField: UITextField!
    @IBOutlet weak var gradeRecievedTextField: UITextField!
    @IBOutlet weak var weightTextFied: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    
    var newGradedAssignment: GradedAssignment?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        saveButton.isEnabled = false
        assignmentNameTextField.becomeFirstResponder()
        gradeRecievedTextField.keyboardType = UIKeyboardType.decimalPad
        weightTextFied.keyboardType = UIKeyboardType.decimalPad
        
        let lineColor = UIColor(red:0.12, green:0.23, blue:0.35, alpha:1.0)
        self.assignmentNameTextField.setBottomLine(borderColor: lineColor)
        self.gradeRecievedTextField.setBottomLine(borderColor: lineColor)
        self.weightTextFied.setBottomLine(borderColor: lineColor)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        assignmentNameTextField.resignFirstResponder()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Create the new graded assignment before returning to graded assignment VC
        if let segueId = segue.identifier, segueId == "UnwindSave" {
            let name = assignmentNameTextField.text!
            let grade = Double(gradeRecievedTextField.text!)
            let weight = Double(weightTextFied.text!)
            newGradedAssignment = GradedAssignment(name: name, gradeRecieved: grade!, assignmentWeight: weight!)
        }
        
        // Dismiss keyboard on time
        self.view.endEditing(true)
        
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        if identifier == "UnwindSave" {
            let invalidNumberAlert = InputAlerts()
            
            // Check that the grade and weight entered are valid numbers.
            // If not present alert error and do not perform segue
        
            if Double(gradeRecievedTextField.text!) == nil {
                self.present(invalidNumberAlert.triggerAlert(type: .gradeNotANumber), animated: true, completion: nil)
                return false
            }
            
            guard let weight = Double(weightTextFied.text!) else {
                self.present(invalidNumberAlert.triggerAlert(type: .weightNotANumber), animated: true, completion: nil)
                return false
            }
            
            if weight <= Constants.weightLowerBound {
                self.present(invalidNumberAlert.triggerAlert(type: .invalidWeight), animated: true, completion: nil)
                return false
            }
            
        }
        
        return true
        
    }
    
    // TODO: Change the name of this method
    // This method set the save buttons isEnabled property to true if all the text fields have values
    @IBAction func assignmentNameTextFieldEditted(_ sender: Any) {
        guard  let name = assignmentNameTextField.text else {
            return
        }
        
        guard let gradeRecieved = gradeRecievedTextField.text else {
            return
        }
        
        guard let assignmentWeight = weightTextFied.text else {
            return
        }
        
        if !name.isEmpty && !gradeRecieved.isEmpty && !assignmentWeight.isEmpty {
            saveButton.isEnabled = true
        } else {
            saveButton.isEnabled = false
        }
    }
    
    
}
