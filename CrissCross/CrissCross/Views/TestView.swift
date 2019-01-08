//
//  TestView.swift
//  CrissCross
//
//  Created by edan yachdav on 9/19/18.
//  Copyright © 2018 edan yachdav. All rights reserved.
//

import UIKit

class TestView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 10, y: 10))
        path.addLine(to: CGPoint(x: 10, y: 20))
        
        path.move(to: CGPoint(x: 50, y: 10))
        path.addLine(to: CGPoint(x: 50, y: 20))
        
        UIColor.black.setStroke()
        path.stroke()
        path.close()
        
    }
}
