//
//  AddSubTasksViewController.swift
//  AuTodo
//
//  Created by edan yachdav on 8/10/18.
//  Copyright © 2018 edan yachdav. All rights reserved.
//

import UIKit

class AddSubTasksViewController: UIViewController {

    @IBOutlet weak var subtaskNameTextField: UnderlineTextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func doneTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "Unwind To Active Project VC", sender: self)
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
