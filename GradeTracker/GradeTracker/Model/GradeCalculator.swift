//
//  GradeCalculator.swift
//  GradeTracker
//
//  Created by edan yachdav on 1/6/18.
//  Copyright © 2018 edan yachdav. All rights reserved.
//

import Foundation

struct GradeCalculator {
    
    func updateGradingCriteriaGrade(gc: GradingCriteria) {
       
    }
    
    func updateCourseGrades(courseList: CourseList) {
        var pointsAvailable: Double?
        var pointsEarned = Double(0)
        var weightAsDecimal = Double(0)
        
        for course in courseList.courses {
            for criteria in course.criteriasList {
                for assignment in criteria.gradedAssignments {
                    if pointsAvailable == nil {
                        pointsAvailable = Double(0)
                    }
                    pointsAvailable! += assignment.assignmentWeight
                    weightAsDecimal = assignment.assignmentWeight/100.0
                    pointsEarned += assignment.gradeRecieved * weightAsDecimal
                }
            }
            if let points = pointsAvailable {
                course.currentGrade = (pointsEarned/points)*100.0
                pointsAvailable = nil
            }
            
        }
    }
    
    
    
}

