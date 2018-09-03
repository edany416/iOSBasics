//
//  CompleteTaskActionView.swift
//  AuTodo
//
//  Created by edan yachdav on 8/9/18.
//  Copyright © 2018 edan yachdav. All rights reserved.
//

import UIKit

class CheckMarkView: UIView {
    
    private var circlePath = UIBezierPath()
    private var shortLine = UIBezierPath()
    private var longLine = UIBezierPath()
    private let strokeColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        self.backgroundColor = UIColor.clear
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(selfWasTapped(_:)))
        self.addGestureRecognizer(tapGesture)
    }
    
    @objc private func selfWasTapped(_ sender: UITapGestureRecognizer) {
        switch sender.state {
        case .ended:
            if let tappedView = sender.view as? CheckMarkView {
                UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.25,
                                                               delay: 0,
                                                               options: [],
                                                               animations: {
                                                                tappedView.transform = CGAffineTransform.identity.scaledBy(x: 1.5, y: 1.5)
                }) { (position) in
                    UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.25,
                                                                   delay: 0,
                                                                   options: [],
                                                                   animations: {
                                                                    tappedView.transform = CGAffineTransform.identity
                    },
                                                                   completion: nil)
                }
            }
        default:
            break;
        }
    }
    
    override func draw(_ rect: CGRect) {
        strokeColor.setStroke()
        circlePath.addArc(withCenter: centerOfBounds(), radius: halfWidth(), startAngle: 0.0, endAngle: 2*CGFloat.pi, clockwise: false)
        circlePath.lineWidth = 3.0
        circlePath.stroke()
        
        let shortStart = CGPoint(x: 0.20*maxX(), y: 0.50*maxY())
        let longStart = CGPoint(x: 0.40*maxX(), y: 0.75*maxY())
        let shortEnd = CGPoint(x: 0.45*maxX(), y: 0.75*maxY())
        let longEnd = CGPoint(x: 0.75*maxX(), y: 0.28*maxY())
    
       
        shortLine.lineWidth = 3.0
        shortLine.move(to: shortStart)
        shortLine.addLine(to: shortEnd)
        shortLine.stroke()
        
        
        longLine.lineWidth = 3.0
        longLine.move(to: longStart)
        longLine.addLine(to: longEnd)
    
        longLine.stroke()
    }
    
    private func maxX() -> CGFloat {
        return self.bounds.maxX
    }
    
    private func maxY() -> CGFloat {
        return self.bounds.maxY
    }
    
    private func centerOfBounds() -> CGPoint {
        return CGPoint(x: self.bounds.midX, y: self.bounds.midY)
    }
    
    private func halfWidth() -> CGFloat {
        return self.bounds.width/2.3
    }

}
