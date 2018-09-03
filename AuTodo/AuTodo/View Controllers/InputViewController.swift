//
//  InputViewController.swift
//  AuTodo
//
//  Created by edan yachdav on 8/10/18.
//  Copyright © 2018 edan yachdav. All rights reserved.
//

import UIKit
import CoreData

class InputViewController: UIViewController {
    private var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addTapped(_ sender: UIButton) {// Create a new record for the person entity
        let entity = NSEntityDescription.entity(forEntityName: "Project", in: context)
        let newProject = NSManagedObject(entity: entity!, insertInto: context)
        
        let projectName = textField.text
        
        // Set the value for the new person object
        newProject.setValue(projectName, forKey: "name")
        
        // Save the new person object
        do {
            try context.save()
            textField.text = ""
        } catch {
            print("Save Failed")
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
