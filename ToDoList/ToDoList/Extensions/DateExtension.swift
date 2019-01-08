//
//  DateExtension.swift
//  ToDoList
//
//  Created by edan yachdav on 10/27/18.
//  Copyright © 2018 edan yachdav. All rights reserved.
//

import Foundation

enum DateComponent {
    case Day
    case Weekday
    case Month
    case Year
}

extension Date {
    func dateComponent(component: DateComponent) -> String {
        let dateFormatter = DateFormatter()
        switch component {
        case .Day:
            dateFormatter.dateFormat = "d"
        case .Month:
            dateFormatter.dateFormat = "MMMM"
        case .Weekday:
            dateFormatter.dateFormat = "EEEE"
        case .Year:
            dateFormatter.dateFormat = "yyyy"
        }
        return dateFormatter.string(from: self).capitalized
    }
}
