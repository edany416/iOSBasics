//
//  ActionView.swift
//  TestStuff
//
//  Created by edan yachdav on 12/24/18.
//  Copyright © 2018 edan yachdav. All rights reserved.
//

import UIKit

class ActionView: UIView {
    
    private var circleView: CircleView!
    var tapGesture: UITapGestureRecognizer!
    var viewTapped = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    @objc func tapHandler(_ sender: UITapGestureRecognizer){
        
        if tapGesture.state == .ended && viewTapped == false {
           
            viewTapped = true
            circleView = CircleView(frame: CGRect(x: 0,
                                                  y: 0,
                                                  width: self.bounds.width * 0.60,
                                                  height: self.bounds.height * 0.60))
            circleView.center.x = self.bounds.midX
            circleView.center.y = self.bounds.midY
            self.addSubview(circleView)
            
            UIView.animate(withDuration: 0.3, animations: {
                self.circleView.transform = CGAffineTransform.init(scaleX: 3.2, y: 3.2)
            }) { (finished) in
                self.circleView.removeFromSuperview()
                self.viewTapped = false
            }
        }
        
    }
    
    private func setup() {
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapHandler(_:)))
        self.addGestureRecognizer(tapGesture)
        self.clipsToBounds = true
    }
}

fileprivate class CircleView: UIView {
    
    var circleStrokeColor: UIColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.5)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override func draw(_ rect: CGRect) {
        circleStrokeColor.setFill()
        let minDimension = (rect.height <= rect.width) ? rect.height : rect.width
        let circlePath = UIBezierPath()
        circlePath.lineWidth = 1
        circlePath.addArc(withCenter: centerPoint(), radius: minDimension/2.2, startAngle: 0, endAngle: CGFloat.pi*2, clockwise: true)
        circlePath.fill()
    }
    
    private func centerPoint() -> CGPoint {
        let center = CGPoint(x: self.bounds.midX, y: self.bounds.midY)
        return center
    }
    
    private func setup() {
        self.backgroundColor = UIColor.clear
    }
}
