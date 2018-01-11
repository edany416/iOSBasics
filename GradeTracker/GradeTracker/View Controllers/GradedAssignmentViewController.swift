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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataManager.criteriGradedAssignments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GradedAssignmentCell", for: indexPath)
        let gradedAssignment = dataManager.gradedAssignmentAtIndex(indexPath.row)
        cell.textLabel?.text = gradedAssignment.name
        cell.detailTextLabel?.text = "\(gradedAssignment.gradeRecieved)%"
        
        return cell
    }
    
    @IBAction func unwindFromAddGASave(_ sender: UIStoryboardSegue) {
        if sender.source is AddGradedAssignmentViewController {
            if let senderVC = sender.source as? AddGradedAssignmentViewController {
                dataManager.appendGradedAssignment(senderVC.newGradedAssignment!)
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
