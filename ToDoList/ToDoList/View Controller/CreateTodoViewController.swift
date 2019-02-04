//
//  CreateTodoViewController.swift
//  ToDoList
//
//  Created by edan yachdav on 10/27/18.
//  Copyright © 2018 edan yachdav. All rights reserved.
//

import UIKit
import CoreData

class CreateTodoViewController: UIViewController {
    
    @IBOutlet weak var dueDatePicker: UIDatePicker!
    @IBOutlet weak var nameTextField: UnderlineTextField!
    @IBOutlet weak var notes: UITextView!
    
    var managedObjectContext: NSManagedObjectContext?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        guard let managedObjectContext = managedObjectContext else {return}
        
        let todo = Todo(context: managedObjectContext)
        
        todo.name = nameTextField.text
        todo.dueDate = dueDatePicker.date
        todo.notes = notes.text
        
        do {
            try managedObjectContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
