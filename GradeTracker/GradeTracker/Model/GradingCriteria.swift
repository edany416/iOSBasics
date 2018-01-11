//
//  GradingCriteria.swift
//  GradeTracker
//
//  Created by edan yachdav on 1/5/18.
//  Copyright © 2018 edan yachdav. All rights reserved.
//

import Foundation

class GradingCriteria: GradedItem {
    let weight: Double
    let equalWeights: Bool
    //var gradedAssignments = GradedItemList<GradedAssignment>()
    var gradedAssignments = [GradedAssignment]()
    init(name: String, weight: Double, equalWeights: Bool) {
        self.weight = weight
        self.equalWeights = equalWeights
        super.init(name: name)
    }
}
