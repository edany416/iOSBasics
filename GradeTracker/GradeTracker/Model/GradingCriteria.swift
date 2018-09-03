//
//  GradingCriteria.swift
//  GradeTracker
//
//  Created by edan yachdav on 1/5/18.
//  Copyright © 2018 edan yachdav. All rights reserved.
//

import Foundation
import os.log
class GradingCriteria: NSObject, NSCoding{

    var name: String
    var currentGrade: Double?
    var gradedAssignments = [GradedAssignment]()
    
    init(_ name: String) {
        self.name = name
    }
    
    init(_ name: String, _ currentGrade: Double?, _ gradedAssignments: [GradedAssignment]?) {
        self.name = name
        self.currentGrade = currentGrade
        self.gradedAssignments = [GradedAssignment]()
        if let ga = gradedAssignments {
            self.gradedAssignments += ga
        }
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: PropertyKey.name)
        aCoder.encode(currentGrade, forKey: PropertyKey.currentGrade)
        aCoder.encode(gradedAssignments, forKey: PropertyKey.gradedAssignments)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let name = aDecoder.decodeObject(forKey: PropertyKey.name) as! String
        let currentGrade = aDecoder.decodeObject(forKey: PropertyKey.currentGrade) as? Double
        let gradedAssignments = aDecoder.decodeObject(forKey: PropertyKey.gradedAssignments) as? [GradedAssignment]
        
        self.init(name, currentGrade, gradedAssignments)
    }
    
}
