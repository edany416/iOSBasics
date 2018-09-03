//
//  GradingCriteriaViewController.swift
//  GradeTracker
//
//  Created by edan yachdav on 12/29/17.
//  Copyright © 2017 edan yachdav. All rights reserved.
//

import UIKit
import os.log

class GradingCriteriaViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var selectedCourse:Course!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedCourse.criteriaCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GradingCriteriaCell", for: indexPath)
        let gradingCriteria = selectedCourse.criteriasList[indexPath.row]
        cell.textLabel?.text = gradingCriteria.name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            selectedCourse.removeCriteriaAt(index: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: . automatic)
            DataManager.saveCourseData()
        }
    }
    
    
    
    @IBAction func unwindFromAddGCSave(_ sender: UIStoryboardSegue) {
        
        DataManager.saveCourseData()
        tableView.reloadData()
    }
    
    @IBAction func unwindFromAddGCCancel(_ sender: UIStoryboardSegue) {
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "GradeCriteriaTappedSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Handle event of table view cell being tapped
        if segue.identifier == "GradeCriteriaTappedSegue",
            let gradedAssignmentVC = segue.destination as? GradedAssignmentViewController {
            let indexPath = tableView.indexPathForSelectedRow?.row
            let selectedCriteria = selectedCourse.criteriasList[indexPath!]
            // Set destination VC title
            gradedAssignmentVC.navigationItem.title = selectedCriteria.name
            // Set the selected criteria in destination VC
            gradedAssignmentVC.selectedCriteria = selectedCriteria
        }
        
        // Handle event of add criteria button tapped
        if segue.identifier == "AddCriteriaSegue",
            let navController = segue.destination as? UINavigationController {
                let addCriteriaVC = navController.topViewController as! AddGradingCriteriaViewController
                addCriteriaVC.course = selectedCourse
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
