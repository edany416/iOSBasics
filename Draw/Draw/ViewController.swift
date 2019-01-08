//
//  ViewController.swift
//  Draw
//
//  Created by edan yachdav on 12/1/18.
//  Copyright © 2018 edan yachdav. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var drawView: UIView!
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var tempImageView: UIImageView!
    
    private var drawLocationPoint: CGPoint?
    private var newLocationPoint: CGPoint?
    private var brushWidth: CGFloat = 10.0
    private var red: CGFloat = 0.0
    private var green: CGFloat = 0.0
    private var blue: CGFloat = 0.0
    private var opacity: CGFloat = 1.0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if drawLocationPoint != nil {
            if let touch = touches.first as UITouch? {
                newLocationPoint = touch.location(in: drawView)
                print("New Location set")
            }
        }
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        //If user selected a point, perform move
        if drawLocationPoint != nil {
            print("Drawing line")
            if let touch = touches.first {
                let currentPoint = touch.location(in: drawView)
                let deltaX = currentPoint.x - newLocationPoint!.x
                let deltaY = currentPoint.y - newLocationPoint!.y
                let newDrawLocationPoint = CGPoint(x: (drawLocationPoint!.x + deltaX), y: drawLocationPoint!.y + deltaY)
                drawLineFrom(fromPoint: drawLocationPoint!, toPoint: newDrawLocationPoint)
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if drawLocationPoint == nil {
            if let touch = touches.first {
                drawLocationPoint = touch.location(in: drawView)
                print("Draw Location set")
            }
        } else {
        
            // Merge tempImageView into mainImageView
            UIGraphicsBeginImageContext(mainImageView.frame.size)
            mainImageView.image?.draw(in: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height), blendMode: CGBlendMode.normal, alpha: 1.0)
            tempImageView.image?.draw(in: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height), blendMode: CGBlendMode.normal, alpha: opacity)
            mainImageView.image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            
            tempImageView.image = nil
        }
        
        
    }
    
    func drawLineFrom(fromPoint: CGPoint, toPoint: CGPoint) {
        // 1
        UIGraphicsBeginImageContext(drawView.frame.size)
        let context = UIGraphicsGetCurrentContext()
        tempImageView.image?.draw(in: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height))
        
        // 2
        context?.move(to: fromPoint)
        context?.addLine(to: toPoint)
        
        // 3
        context?.setLineCap(CGLineCap.round)
        context?.setLineWidth(brushWidth)
        context?.setFillColor(red: red, green: green, blue: blue, alpha: 1.0)
        context?.setBlendMode(CGBlendMode.normal)
        
        // 4
        context?.strokePath()
        
        // 5
        tempImageView.image = UIGraphicsGetImageFromCurrentImageContext()
        tempImageView.alpha = opacity
        UIGraphicsEndImageContext()
    }


}

