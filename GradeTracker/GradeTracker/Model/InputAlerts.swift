//
//  InputAlerts.swift
//  GradeTracker
//
//  Created by edan yachdav on 2/18/18.
//  Copyright © 2018 edan yachdav. All rights reserved.
//

import Foundation
import UIKit

enum Alert {
    case weightNotANumber
    case gradeNotANumber
    case invalidWeight
}

class InputAlerts {
    
    private var alert:UIAlertController
    
    init() {
        alert = UIAlertController()
    }
    
    func triggerAlert(type: Alert) -> UIAlertController {
        
        switch type {
        
        case .gradeNotANumber:
            alert = UIAlertController(title: "Grade Not a Number", message: "Grade must be a decimal value", preferredStyle: .alert)
        
        case .weightNotANumber:
            alert = UIAlertController(title: "Weight Not a Number", message: "Weight must me a decimal value", preferredStyle: .alert)
            
        case .invalidWeight:
            alert = UIAlertController(title: "Invalid Weight", message: "Weight must be greater than 0", preferredStyle: .alert)
        
        }
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        return alert
    }
    
    
    
}
