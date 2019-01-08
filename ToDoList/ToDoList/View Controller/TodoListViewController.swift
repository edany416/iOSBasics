//
//  TodoListViewController.swift
//  ToDoList
//
//  Created by edan yachdav on 10/27/18.
//  Copyright © 2018 edan yachdav. All rights reserved.
//

import UIKit
import CoreData

class TodoListViewController: UIViewController, UITableViewDataSource, NSFetchedResultsControllerDelegate  {
    
    @IBOutlet weak var dayNameLabel: UILabel!
    @IBOutlet weak var monthDayYearLabel: UILabel!
    @IBOutlet weak var todosTableView: UITableView!
    
    private let persistentContainer = NSPersistentContainer(name: "ToDoList")
    fileprivate lazy var fetchedResultsController: NSFetchedResultsController<Todo> = {
        // Create Fetch Request
        let fetchRequest: NSFetchRequest<Todo> = Todo.fetchRequest()
        // Configure Fetch Request
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "dueDate", ascending: true)]
        // Create Fetched Results Controller
        let fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: self.persistentContainer.viewContext, sectionNameKeyPath: nil, cacheName: nil)
        // Configure Fetched Results Controller
        fetchedResultsController.delegate = self
        return fetchedResultsController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        todosTableView.dataSource = self
        updateDateLabels()
        
        persistentContainer.loadPersistentStores { (persistantStoreDescription, error) in
            if let error = error {
                print("Unable to load persistent store")
                print("\(error), \(error.localizedDescription)")
            } else {
                do {
                    try self.fetchedResultsController.performFetch()
                } catch {
                    let fetchError = error as NSError
                    print("Unable to Perform Fetch Request")
                    print("\(fetchError), \(fetchError.localizedDescription)")
                }
                
                
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        do {
            try self.fetchedResultsController.performFetch()
        } catch {
            let fetchError = error as NSError
            print("Unable to Perform Fetch Request")
            print("\(fetchError), \(fetchError.localizedDescription)")
        }
    }
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        todosTableView.beginUpdates()
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        todosTableView.endUpdates()
        todosTableView.reloadData()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch (type) {
        case .insert:
            if let indexPath = newIndexPath {
                todosTableView.insertRows(at: [indexPath], with: .fade)
            }
            break;
        default:
            print("...")
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let todos = fetchedResultsController.fetchedObjects else { return 0 }
        return todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = todosTableView.dequeueReusableCell(withIdentifier: "Todo Cell", for: indexPath) as? TodoTableViewCell else {
            fatalError("Unexpected index path")
        }
        
        let todo = fetchedResultsController.object(at: indexPath)
       
        cell.todoNameLabel.text = todo.name
        cell.dueDateLabel.text = string(forDate: todo.dueDate!)
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Add Todo Segue" {
            if let destVC = segue.destination as? CreateTodoViewController {
                destVC.managedObjectContext = persistentContainer.viewContext
            }
        }
    }
    
    private func updateDateLabels() {
        let today = Date()
        let weekday = today.dateComponent(component: .Weekday)
        let month = today.dateComponent(component: .Month)
        let day = today.dateComponent(component: .Day)
        let year = today.dateComponent(component: .Year)
        
        dayNameLabel.text = weekday
        monthDayYearLabel.text = "\(month) \(day), \(year)"
    }
    
    private func string(forDate date: Date) -> String {
        let dateString: String!
        let calendar = Calendar(identifier: .gregorian)
        let tomorrow = Date().addingTimeInterval(Constants.SecondsInDay)
        if calendar.component(.day, from: date) == calendar.component(.day, from: tomorrow) {
            dateString = "Tomorrow"
        } else {
            dateString = "Formatted"
        }
        
        return dateString
    }
}
