//
//  UITextFieldExtension.swift
//  AuTodo
//
//  Created by edan yachdav on 8/10/18.
//  Copyright © 2018 edan yachdav. All rights reserved.
//

import UIKit

extension UITextField {
    func setBottomLine(borderColor: UIColor) {
        
        self.borderStyle = UITextBorderStyle.none
        
        let borderLine = CALayer()
        let height = 1.0
        borderLine.frame = CGRect(x: 0, y: Double(self.frame.height) - height, width: Double(self.frame.width), height: height)
        borderLine.borderColor = UIColor.black.cgColor
        self.layer.addSublayer(borderLine)
        self.layer.masksToBounds = true
    }
}
