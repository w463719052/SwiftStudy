//
//  YGHistogramView.swift
//  SwiftStudy
//
//  Created by zccl2 on 16/7/19.
//  Copyright © 2016年 com.zccl. All rights reserved.
//

import UIKit

class YGHistogramView: UIView {
    var height:CGFloat = 0
    var width:CGFloat = 20
    var heightArray:NSMutableArray = [10,16,36,24,22,6,10]
    var ordinHeightArray:NSMutableArray = [0,0,0,0,0,0,0]
    var textArray:NSArray = ["一","二","三","四","五","六","七"]
    var numberLblBottom1 = NSLayoutConstraint()
    var numberLblBottom2 = NSLayoutConstraint()
    var numberLblBottom3 = NSLayoutConstraint()
    var numberLblBottom4 = NSLayoutConstraint()
    var numberLblBottom5 = NSLayoutConstraint()
    var numberLblBottom6 = NSLayoutConstraint()
    var numberLblBottom7 = NSLayoutConstraint()
    var numberBottomArray = NSMutableArray()
    
    var numberLblArray = NSMutableArray()
    override init(frame: CGRect) {
        super.init(frame: frame)
        numberBottomArray.addObject(numberLblBottom1)
        numberBottomArray.addObject(numberLblBottom2)
        numberBottomArray.addObject(numberLblBottom3)
        numberBottomArray.addObject(numberLblBottom4)
        numberBottomArray.addObject(numberLblBottom5)
        numberBottomArray.addObject(numberLblBottom6)
        numberBottomArray.addObject(numberLblBottom7)
        self.backgroundColor = UIColor.clearColor()
        for i in 0 ..< textArray.count {
            let lbl = UILabel(frame: CGRectMake(0, 205, width, width))
            lbl.center = CGPointMake(ViewWidth(self)/CGFloat(textArray.count+1)*CGFloat(i+1), 205+width/2)
            lbl.textAlignment = .Center
            lbl.font = UIFont.systemFontOfSize(12)
            lbl.textColor = UIColor.whiteColor()
            lbl.text = textArray[i] as? String
            self.addSubview(lbl)
            
            let numberLbl = UILabel()
            numberLbl.translatesAutoresizingMaskIntoConstraints = false
            numberLbl.textAlignment = .Center
            numberLbl.font = UIFont.systemFontOfSize(12)
            numberLbl.textColor = UIColor.whiteColor()
            self.addSubview(numberLbl)
            self.addConstraint(NSLayoutConstraint(item: numberLbl, attribute: .Left, relatedBy: .Equal, toItem: lbl, attribute: .Left, multiplier: 1, constant: 0))
            self.addConstraint(NSLayoutConstraint(item: numberLbl, attribute: .Right, relatedBy: .Equal, toItem: lbl, attribute: .Right, multiplier: 1, constant: 0))
            self.addConstraint(NSLayoutConstraint(item: numberLbl, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .Height, multiplier: 1, constant: 20))
            numberBottomArray[i] = NSLayoutConstraint(item: numberLbl, attribute: .Bottom, relatedBy: .Equal, toItem: lbl, attribute: .Bottom, multiplier: 1, constant: -25)
            self.addConstraint(numberBottomArray[i] as! NSLayoutConstraint)
            
            numberLblArray.addObject(numberLbl)
        }
        
        
        NSTimer.scheduledTimerWithTimeInterval(0.04, target: self, selector: "setHistogram:", userInfo: nil, repeats: true)
    }
    
    func setHistogram(timer:NSTimer) {
        if (self.height > CGFloat((heightArray.valueForKeyPath("@max.floatValue")?.floatValue)!)) {
            timer.fireDate = NSDate.distantFuture()
        } else {
            self.height += 1
            for i in 0 ..< ordinHeightArray.count {
                if (CGFloat(ordinHeightArray[i] as! NSNumber) < CGFloat(heightArray[i] as! NSNumber)) {
                    var heee = CGFloat(ordinHeightArray[i] as! NSNumber)
                    heee += 1
                    ordinHeightArray.removeObjectAtIndex(i)
                    ordinHeightArray.insertObject(heee, atIndex: i)
                    let ssss:NSLayoutConstraint = numberBottomArray[i] as! NSLayoutConstraint
                    ssss.constant = -25-heee*5
                    let tttt:UILabel = numberLblArray[i] as! UILabel
                    tttt.text = String(ordinHeightArray[i])
                }
            }
            self.setNeedsDisplay()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func drawRect(rect: CGRect) {
        for i in 0 ..< ordinHeightArray.count {
                let histogram = UIBezierPath(rect: CGRectMake(ViewWidth(self)/8*CGFloat(i+1), 200, 0, -CGFloat(ordinHeightArray[i] as! NSNumber)*5))
                histogram.lineWidth = width;
                RGBACOLOR(255, g: 255, b: 255, a: 0.8).setStroke()
                histogram.stroke()
        }
    }
}
