//
//  GradedItem+CoreDataProperties.swift
//  GradeCalculator
//
//  Created by edan yachdav on 1/13/18.
//  Copyright © 2018 edan yachdav. All rights reserved.
//
//

import Foundation
import CoreData


extension GradedItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GradedItem> {
        return NSFetchRequest<GradedItem>(entityName: "GradedItem")
    }

    @NSManaged public var name: String?
    @NSManaged public var currentGrade: Double

}
