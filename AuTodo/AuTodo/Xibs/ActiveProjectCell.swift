//
//  ProjectCellBase.swift
//  AuTodo
//
//  Created by edan yachdav on 8/10/18.
//  Copyright © 2018 edan yachdav. All rights reserved.
//

import UIKit

class ActiveProjectCell: UITableViewCell {

    @IBOutlet weak var projectNameLabel: UILabel!
    @IBOutlet weak var projectDueDateLabel: UILabel!
    @IBOutlet weak var completedTasksLabel: UILabel!
    @IBOutlet weak var taskNameLabel: UILabel!
    @IBOutlet weak var taskDueDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
