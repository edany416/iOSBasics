//
//  GradedAssignment.swift
//  GradeTracker
//
//  Created by edan yachdav on 1/5/18.
//  Copyright © 2018 edan yachdav. All rights reserved.
//

import Foundation

class GradedAssignment: GradedItem {
    var weight: Double?
    var gradeRecieved: Double
    
    init(name: String, gradeRecieved: Double) {
        self.gradeRecieved = gradeRecieved
        super.init(name: name)
    }
    
}
