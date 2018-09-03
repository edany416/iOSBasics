//
//  ActiveProjectsViewController.swift
//  AuTodo
//
//  Created by edan yachdav on 8/10/18.
//  Copyright © 2018 edan yachdav. All rights reserved.
//

import UIKit
import CoreData
class ActiveProjectsViewController: FetchedResultsTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwindToActiveProjectsVC(_ sender: UIStoryboardSegue)  {
       
    }
    
    var container: NSPersistentContainer? = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer {
        didSet {
            updateUI()
        }
    }
    
    var fetchResultsController: NSFetchedResultsController<Project>?
    
    private func updateUI() {
        if let context = container?.viewContext {
            let request: NSFetchRequest<Project> = Project.fetchRequest()
            request.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
            fetchResultsController = NSFetchedResultsController<Project>(fetchRequest: request,
                                                                         managedObjectContext: context,
                                                                         sectionNameKeyPath: nil,
                                                                         cacheName: nil)

        }
        try? fetchResultsController?.performFetch()
        tableView.reloadData()
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let sections = fetchResultsController?.sections, sections.count > 0 {
            return sections[section].numberOfObjects
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Project Cell", for: indexPath)
        
        if let project = fetchResultsController?.object(at: indexPath) {
            cell.textLabel?.text = project.name
        }
        
        return cell
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
