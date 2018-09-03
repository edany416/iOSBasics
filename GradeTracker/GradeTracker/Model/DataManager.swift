//
//  DataManager.swift
//  GradeTracker
//
//  Created by edan yachdav on 2/18/18.
//  Copyright © 2018 edan yachdav. All rights reserved.
//

import Foundation
import os.log

class DataManager {
    
    private static var courseList:CourseList?
    
    init(courseList: CourseList) {
        DataManager.courseList = courseList
    }
    
    static func saveCourseData() {
        if let cList = courseList {
            let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(cList.courses, toFile: CourseList.ArchiveURL.path)
            
            if isSuccessfulSave {
                os_log("Courses successfully saved.", log: OSLog.default, type: .debug)
            } else {
                os_log("Failed to save course...", log: OSLog.default, type: .error)
            }
        }
    }
    
    static func loadCourseData() -> [Course]? {
         return NSKeyedUnarchiver.unarchiveObject(withFile: CourseList.ArchiveURL.path) as? [Course]
    }
}
