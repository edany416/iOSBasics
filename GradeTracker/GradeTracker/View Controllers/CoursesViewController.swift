//
//  CoursesViewController.swift
//  GradeTracker
//
//  Created by edan yachdav on 12/28/17.
//  Copyright © 2017 edan yachdav. All rights reserved.
//

import UIKit
import os.log

class CoursesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var courseTableView: UITableView!
    var courseList:CourseList!
    let calculator = GradeCalculator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        courseTableView.dataSource = self
        courseTableView.delegate = self
        courseList = CourseList()
        
        // If saved data exits, load it from memory
        if let savedCoures = DataManager.loadCourseData() {
            courseList = CourseList(courses: savedCoures)
            courseTableView.reloadData()
        }
        
        // Create instance of a data manager
        _ = DataManager(courseList: courseList)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Reload tableview and calculate current course grade
        courseTableView.reloadData()
        // Update course grade incase new assignments were added
        calculator.updateCourseGrades(courseList: courseList)
    }
    
    @IBAction func unwindFromAddCourseSave(_ sender: UIStoryboardSegue) {
        if let sourceVC = sender.source as? AddCourseViewController {
            // Append the newly added course
            courseList.append(course: sourceVC.newCourse!)
            // Save the newly added course to memory
            DataManager.saveCourseData()
            // Reload table view to show new course
            courseTableView.reloadData()
        } 
    }
    
    @IBAction func unwindFromAddCourseCancel(_ sender: UIStoryboardSegue) {
        // User decides not to add a new course
    }
    
    /**** Table view methods ****/
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Handle table editting
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            courseList.removeCourseAt(indexPath.row)
            courseTableView.deleteRows(at: [indexPath], with: . automatic)
            DataManager.saveCourseData()
        }
    }
    
    // Caluclate the number of cells needed for the table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courseList.count
    }
    
    // Create and return a table view cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Initialize a cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "CourseCell", for: indexPath)
        // Get the next course in the course list
        let course = courseList.courseAtIndex(indexPath.row)
        
        // Set the title of the cell
        cell.textLabel?.text = course.name
        
        // If course grade can be calculated show the grade, else show dash
        if let grade = course.currentGrade {
            let formattedGrade = String(format:"%.2f",grade)
            cell.detailTextLabel?.text = "\(formattedGrade)%"
        } else {
            cell.detailTextLabel?.text = "-"
        }
        
        return cell
    }
    
    // Go to course grading criteria when a course cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "CourseTableCellSelectedSegue", sender: self)
    }
    
    // Pass on the necessary information to the grading criteria VC
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indexPath = courseTableView.indexPathForSelectedRow?.row
        
        if segue.identifier == "CourseTableCellSelectedSegue",
            let gradingCriteriaVC = segue.destination as? GradingCriteriaViewController {
            
            let selectedCourse = courseList.courseAtIndex(indexPath!)
            gradingCriteriaVC.navigationItem.title = selectedCourse.name
            gradingCriteriaVC.selectedCourse = selectedCourse
        }
    }
    
}
