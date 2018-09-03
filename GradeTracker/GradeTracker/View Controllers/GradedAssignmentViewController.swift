//
//  GradedAssignmentViewController.swift
//  GradeTracker
//
//  Created by edan yachdav on 1/2/18.
//  Copyright © 2018 edan yachdav. All rights reserved.
//

import UIKit

class GradedAssignmentViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var selectedCriteria:GradingCriteria!
    let calculator = GradeCalculator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.allowsSelection = false
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedCriteria.gradedAssignments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GradedAssignmentCell", for: indexPath)
        let gradedAssignment = selectedCriteria.gradedAssignments[indexPath.row]
        
        cell.textLabel?.text = gradedAssignment.name
        let formattedGrade = String(format:"%.2f",gradedAssignment.gradeRecieved)
        cell.detailTextLabel?.text = "\(formattedGrade)%"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            selectedCriteria.gradedAssignments.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: . automatic)
            DataManager.saveCourseData()
        }
    }
    
    @IBAction func unwindFromAddGASave(_ sender: UIStoryboardSegue) {
        if sender.source is AddGradedAssignmentViewController {
            if let senderVC = sender.source as? AddGradedAssignmentViewController {
                selectedCriteria.gradedAssignments.append(senderVC.newGradedAssignment!)
                calculator.updateGradingCriteriaGrade(gc: selectedCriteria)
                DataManager.saveCourseData()
            }
        }
        
        tableView.reloadData()
    }
    
    @IBAction func unwindFromAddGACancel(_ sender: UIStoryboardSegue) {
        
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
