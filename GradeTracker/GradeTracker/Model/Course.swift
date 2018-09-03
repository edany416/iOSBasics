//
//  Course.swift
//  GradeTracker
//
//  Created by edan yachdav on 1/5/18.
//  Copyright © 2018 edan yachdav. All rights reserved.
//

import Foundation
class Course:NSObject, NSCoding {
    
    var name: String
    var currentGrade: Double?
    private var gradingCriterias:[GradingCriteria]
    
    
    init(name: String) {
        self.name = name
        gradingCriterias = [GradingCriteria]()
    }
    
    init(name: String, currentGrade: Double?, gradingCriterias: [GradingCriteria]?){
        self.name = name
        self.currentGrade = currentGrade
        self.gradingCriterias = [GradingCriteria]()
        if let gc = gradingCriterias {
            self.gradingCriterias += gc
        }
    }
    
    func criteriaCount() -> Int {
        return gradingCriterias.count
    }
    
    func removeCriteriaAt(index: Int) {
        gradingCriterias.remove(at: index)
    }
 
    func appendCriteria(_ gradingCriteria: GradingCriteria) {
        gradingCriterias.append(gradingCriteria)
    }
    
    var criteriasList: [GradingCriteria] {
        get {
            return gradingCriterias
        }
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: PropertyKey.name)
        aCoder.encode(currentGrade, forKey: PropertyKey.currentGrade)
        aCoder.encode(gradingCriterias, forKey: PropertyKey.gradingCriterias)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let name = aDecoder.decodeObject(forKey: PropertyKey.name) as! String
        let currentGrade = aDecoder.decodeObject(forKey: PropertyKey.currentGrade) as? Double
        let gradingCriterias = aDecoder.decodeObject(forKey: PropertyKey.gradingCriterias) as? [GradingCriteria]
        
        self.init(name: name, currentGrade: currentGrade, gradingCriterias: gradingCriterias)
    }
}


