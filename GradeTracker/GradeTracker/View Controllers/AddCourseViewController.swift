//
//  AddCourseViewController.swift
//  GradeTracker
//
//  Created by edan yachdav on 12/29/17.
//  Copyright © 2017 edan yachdav. All rights reserved.
//

import UIKit

class AddCourseViewController: UIViewController {

    @IBOutlet weak var courseNameTextField: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    var newCourse: Course?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        courseNameTextField.becomeFirstResponder()
        
        let lineColor = UIColor(red:0.12, green:0.23, blue:0.35, alpha:1.0)
        self.courseNameTextField.setBottomLine(borderColor: lineColor)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        saveButton.isEnabled = false
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        courseNameTextField.resignFirstResponder()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let segueId = segue.identifier, segueId == "saveCourseSegue" {
            newCourse = Course(name: courseNameTextField.text!)
        }
    }
    
    @IBAction func textEditted(_ sender: Any) {
        if let text = courseNameTextField.text, !text.isEmpty {
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
