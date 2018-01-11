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
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var newGradedAssignment: GradedAssignment?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        saveButton.isEnabled = false
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let name = assignmentNameTextField.text, let gradeRecieved = Double(gradeRecievedTextField.text!) {
            newGradedAssignment = GradedAssignment(name: name, gradeRecieved: gradeRecieved)
        }
    }
    
    @IBAction func assignmentNameTextFieldEditted(_ sender: Any) {
        guard  let name = assignmentNameTextField.text else {
            return
        }
        
        guard let gradeRecieved = gradeRecievedTextField.text else {
            return
        }
        
        if !name.isEmpty && !gradeRecieved.isEmpty {
            saveButton.isEnabled = true
        } else {
            saveButton.isEnabled = false
        }
    }
    
    @IBAction func gradeRecievedTextFieldEditted(_ sender: Any) {
        guard let gradeRecieved = gradeRecievedTextField.text else {
            return
        }
        
        guard  let name = assignmentNameTextField.text else {
            return
        }
        
        if !name.isEmpty && !gradeRecieved.isEmpty {
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
