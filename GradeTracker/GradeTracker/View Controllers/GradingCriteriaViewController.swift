//
//  GradingCriteriaViewController.swift
//  GradeTracker
//
//  Created by edan yachdav on 12/29/17.
//  Copyright © 2017 edan yachdav. All rights reserved.
//

import UIKit

class GradingCriteriaViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataManager.coursGradingCriterias.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GradingCriteriaCell", for: indexPath)
        let gradingCriteria = dataManager.gradingCriteriaAtIndex(indexPath.row)
        cell.textLabel?.text = gradingCriteria.name
        
        if let currentGrade = gradingCriteria.currentGrade {
            cell.detailTextLabel?.text = "\(currentGrade)%"
        } else {
            cell.detailTextLabel?.text = "N/A"
        }
        
        return cell
    }
    
    @IBAction func unwindFromAddGCSave(_ sender: UIStoryboardSegue) {
        if sender.source is AddGradingCriteriaViewController {
            if let senderVC = sender.source as? AddGradingCriteriaViewController {
                dataManager.appendGradingCriteria(senderVC.newGradingCriteria!)
            }
        }
        tableView.reloadData()
    }
    
    @IBAction func unwindFromAddGCCancel(_ sender: UIStoryboardSegue) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "GradedAssignmentSegue",
            let gradedAssignmentVC = segue.destination as? GradedAssignmentViewController {
            let indexPath = tableView.indexPathForSelectedRow?.row
            dataManager.selectedGradingCriteria = dataManager.gradingCriteriaAtIndex(indexPath!)
            gradedAssignmentVC.navigationItem.title = dataManager.selectedGradingCriteria?.name
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
