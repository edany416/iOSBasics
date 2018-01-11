////
////  GradeCalculator.swift
////  GradeTracker
////
////  Created by edan yachdav on 1/6/18.
////  Copyright © 2018 edan yachdav. All rights reserved.
////
//
//import Foundation
//
//struct GradeCalculator {
//    static func calculateCourseGrades(courseList: CourseList) {
//        for case let course as Course in courseList.itemList {
//            calculateGradingCriteriaGrades(gradingCriterias: course.gradingCriterias)
//            course.currentGrade = calculateCurrentCourseGrade(criteriaList: course.gradingCriterias)
//        }
//    }
//    
//    static func calculateGradingCriteriaGrades(gradingCriterias: GradedItemList<GradingCriteria>) {
//        var assignmentWeight = Double()
//        
//        for case let gc as GradingCriteria in gradingCriterias.itemList {
//            if gc.equalWeights {
//                assignmentWeight = gc.weight/Double((gc.gradedAssignments.count))
//                let pointsEarned = self.totalPointsEarnedForCriteria(gc.gradedAssignments, assignmentWeight)
//                if let points = pointsEarned {
//                    gc.currentGrade = (points/gc.weight)*100
//                }
//            }
//        }
//    }
//    
//    private static func calculateCurrentCourseGrade(criteriaList: GradedItemList<GradingCriteria>) -> Double? {
//        var pointsEarned: Double?
//        var totalPointsPossible = Double()
//        
//        for case let gc as GradingCriteria in criteriaList.itemList {
//            guard let gcGrade = gc.currentGrade else {
//                continue
//            }
//            
//            if pointsEarned == nil {
//                pointsEarned = Double()
//            }
//            
//            let decimalGrade = gcGrade/100.0
//            pointsEarned! += gc.weight * decimalGrade
//            totalPointsPossible += gc.weight
//        }
//        
//        if let grade = pointsEarned {
//            return (grade/totalPointsPossible)*100.0
//        } else {
//            return pointsEarned
//        }
//    }
//    
//    private static func totalPointsEarnedForCriteria(_ gradedAssignments: GradedItemList<GradedAssignment>, _ assignmentWeight: Double) -> Double? {
//        var pointsEarned: Double?
//        for case let ga as GradedAssignment in gradedAssignments.itemList {
//            if pointsEarned == nil {
//                pointsEarned = Double()
//            }
//            let decimalGrade = ga.gradeRecieved/(100.0)
//            pointsEarned! += decimalGrade * assignmentWeight
//        }
//        return pointsEarned
//    }
//}

