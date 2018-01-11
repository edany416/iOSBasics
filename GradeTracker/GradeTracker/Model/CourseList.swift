//
//  CourseList.swift
//  GradeTracker
//
//  Created by edan yachdav on 1/5/18.
//  Copyright © 2018 edan yachdav. All rights reserved.
//

import Foundation

class CourseList: GradedItemList<Course> {
    static let shared = CourseList()
    override private init() {}
    
}
