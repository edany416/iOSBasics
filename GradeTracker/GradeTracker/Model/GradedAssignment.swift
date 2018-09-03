//
//  GradedAssignment.swift
//  GradeTracker
//
//  Created by edan yachdav on 1/5/18.
//  Copyright © 2018 edan yachdav. All rights reserved.
//

import Foundation

class GradedAssignment: NSObject, NSCoding {
    
    var name: String
    var gradeRecieved: Double
    var assignmentWeight: Double
    
    init(name: String, gradeRecieved: Double, assignmentWeight: Double) {
        self.name = name
        self.gradeRecieved = gradeRecieved
        self.assignmentWeight = assignmentWeight
        
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: PropertyKey.name)
        aCoder.encode(gradeRecieved, forKey: PropertyKey.gradeRecieved)
        aCoder.encode(assignmentWeight, forKey: PropertyKey.assignmentWeight)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let name = aDecoder.decodeObject(forKey: PropertyKey.name) as! String
        let gradeRecieved = aDecoder.decodeDouble(forKey: PropertyKey.gradeRecieved)
        let assignmentWeight = aDecoder.decodeDouble(forKey: PropertyKey.assignmentWeight)
        
        self.init(name: name, gradeRecieved: gradeRecieved, assignmentWeight: assignmentWeight)
    }
}
