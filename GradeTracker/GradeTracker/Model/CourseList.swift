//
//  CourseList.swift
//  GradeTracker
//
//  Created by edan yachdav on 1/5/18.
//  Copyright © 2018 edan yachdav. All rights reserved.
//

import Foundation

class CourseList: NSObject, NSCoding {
    private var itemList:[Course]
    
    override init() {
        itemList = [Course]()
    }
    
    init(courses: [Course]) {
        itemList = [Course]()
        itemList += courses
    }
    
    var courses: [Course] {
        get {
            return itemList
        }
    }
    
    var count: Int {
        get {
            return itemList.count
        }
    }
    
    func append(course: Course) {
        itemList.append(course)
    }
    
    func removeCourseAt(_ index: Int) {
        itemList.remove(at: index)
    }
    
    func courseAtIndex(_ index: Int) -> Course {
        return itemList[index]
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(itemList, forKey: PropertyKey.courses)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        guard let courseList = aDecoder.decodeObject(forKey: PropertyKey.courses) as? [Course] else {
            return nil
        }
        self.init(courses: courseList)
    }
    
    //MARK: Archiving Paths
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("courses")
    
}
