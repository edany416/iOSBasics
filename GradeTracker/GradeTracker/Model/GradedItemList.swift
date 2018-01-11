//
//  GradedItemList.swift
//  GradeTracker
//
//  Created by edan yachdav on 1/5/18.
//  Copyright © 2018 edan yachdav. All rights reserved.
//

import Foundation

class GradedItemList<E> {
    var itemList = [GradedItem]()
    var count: Int {
        get {
            return itemList.count
        }
    }
    
    func append(gradedItem: GradedItem) {
        itemList.append(gradedItem)
    }
    
    func itemAtIndex(_ index: Int) -> GradedItem {
        return itemList[index]
    }
    
    func saveToFile() {
        
    }
    
    func loadFromFile() {
        
    }
}
