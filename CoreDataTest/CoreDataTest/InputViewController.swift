//
//  InputViewController.swift
//  CoreDataTest
//
//  Created by edan yachdav on 8/3/18.
//  Copyright © 2018 edan yachdav. All rights reserved.
//

import UIKit
import CoreData

class InputViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var isCoolSwitch: UISwitch!
    
    // Core Data context for this app
    private var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addButtonTapped(_ sender: UIButton) {
        // Create a new record for the person entity
        let entity = NSEntityDescription.entity(forEntityName: "Person", in: context)
        let newPerson = NSManagedObject(entity: entity!, insertInto: context)
        
        let personName = nameTextField.text!
        let isCool = isCoolSwitch.isOn
        
        // Set the value for the new person object
        newPerson.setValue(personName, forKey: "name")
        newPerson.setValue(isCool, forKey: "isCool")
        
        // Save the new person object
        do {
            try context.save()
            nameTextField.text = ""
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
