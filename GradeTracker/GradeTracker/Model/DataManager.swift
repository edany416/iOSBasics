//
//  DataManager.swift
//  GradeTracker
//
//  Created by edan yachdav on 1/5/18.
//  Copyright © 2018 edan yachdav. All rights reserved.
//

import Foundation

class DataManager {
    static let shared = DataManager()
    private init() {}
    
    private var storedSelectedCourse: Course?
    private var storedSelectedCriteria: GradingCriteria?
    
    var selectedCourse: Course? {
        get {
            return storedSelectedCourse
        }
        
        set(newSelectedCourse) {
            storedSelectedCourse = newSelectedCourse
            
        }
    }
    
    var selectedGradingCriteria: GradingCriteria? {
        get {
            return storedSelectedCriteria
        }
        
        set(newSelectedCriteria) {
            storedSelectedCriteria = newSelectedCriteria
        }
    }
    
    var coursGradingCriterias: [GradingCriteria] {
        get {
            return storedSelectedCourse!.gradingCriterias
        }
    }
    
    var criteriGradedAssignments: [GradedAssignment] {
        get {
            return storedSelectedCriteria!.gradedAssignments
        }
    }
    
    func gradingCriteriaAtIndex(_ index: Int) -> GradingCriteria {
        let criteriaList = storedSelectedCourse!.gradingCriterias
        return criteriaList[index]
    }
    
    func gradedAssignmentAtIndex(_ index: Int) -> GradedAssignment {
        let gradedAssignmentList = storedSelectedCriteria!.gradedAssignments
        return gradedAssignmentList[index]
    }
    
    func appendGradingCriteria(_ newCriteria: GradingCriteria) {
        selectedCourse?.gradingCriterias.append(newCriteria)
    }
    
    func appendGradedAssignment(_ newAssignment: GradedAssignment) {
        selectedGradingCriteria?.gradedAssignments.append(newAssignment)
    }
}
