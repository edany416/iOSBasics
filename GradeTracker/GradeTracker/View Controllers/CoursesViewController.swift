//
//  CoursesViewController.swift
//  GradeTracker
//
//  Created by edan yachdav on 12/28/17.
//  Copyright © 2017 edan yachdav. All rights reserved.
//

import UIKit

let courseList = CourseList.shared
let dataManager = DataManager.shared


class CoursesViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var courseTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        courseTableView.dataSource = self
        // Do any additional setup after loading the view.
        
        //Test shit
        let tempCourse = Course(name: "TestCourse 1")
        let tempCourse2 = Course(name: "Test Course 2")
        //tempCourse.currentGrade = 97
        let tempHomework = GradingCriteria(name: "TestHomework", weight: 40, equalWeights: true)
        //tempHomework.currentGrade = 95
        tempCourse.gradingCriterias.append(tempHomework)
        courseList.append(gradedItem: tempCourse)
        courseList.append(gradedItem: tempCourse2)
        let tempHW1 = GradedAssignment(name: "Test HW 1", gradeRecieved: 97)
        tempHomework.gradedAssignments.append(tempHW1)
        let tempHW2 = GradedAssignment(name: "Test HW 2", gradeRecieved: 85)
        tempHomework.gradedAssignments.append(tempHW2)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        courseTableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwindFromAddCourseSave(_ sender: UIStoryboardSegue) {
        if sender.source is AddCourseViewController {
            if let senderVC = sender.source as? AddCourseViewController {
                courseList.append(gradedItem: senderVC.newCourse!)
            }
        }
        courseTableView.reloadData()
    }
    
    @IBAction func unwindFromAddCourseCancel(_ sender: UIStoryboardSegue) {
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courseList.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CourseCell", for: indexPath)
        let course = courseList.itemAtIndex(indexPath.row)
        
        cell.textLabel?.text = course.name
        
        if let grade = course.currentGrade {
            cell.detailTextLabel?.text = "\(grade)%"
        } else {
            cell.detailTextLabel?.text = "N/A"
        }
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CourseCellTappedSegue",
            let gradingCriteriaVC = segue.destination as? GradingCriteriaViewController {
            let indexPath = courseTableView.indexPathForSelectedRow?.row
            dataManager.selectedCourse = (courseList.itemAtIndex(indexPath!) as! Course)
            gradingCriteriaVC.navigationItem.title = dataManager.selectedCourse?.name
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
