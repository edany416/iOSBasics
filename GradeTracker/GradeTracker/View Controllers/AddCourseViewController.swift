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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let courseName = courseNameTextField.text {
            newCourse = Course(name: courseName)
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
