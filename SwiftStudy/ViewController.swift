//
//  ViewController.swift
//  SwiftStudy
//
//  Created by zccl2 on 16/7/19.
//  Copyright © 2016年 com.zccl. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let ScreenWidth = UIScreen.mainScreen().bounds.size.width
        let INTERVAL:CGFloat = 5
        let BUTTONHEIGTH:CGFloat = 40
        let BUTTONWIDTH:CGFloat = (ScreenWidth - 6 * INTERVAL) / 5
        var buttonArray: [AnyObject]
        buttonArray = ["柱状图表"]
        for i in 0 ..< buttonArray.count {
            let column: Int = i % 5
            let line: Int = i / 5
            let button: UIButton = UIButton(type: .Custom)
            button.tag = i
            button.frame = CGRectMake(INTERVAL + (BUTTONWIDTH + INTERVAL) * CGFloat(column), 20 + INTERVAL + (BUTTONHEIGTH + INTERVAL) * CGFloat(line), BUTTONWIDTH, BUTTONHEIGTH)
            button.layer.cornerRadius = 5
            button.backgroundColor = UIColor.blackColor()
            button.titleLabel!.font = UIFont.systemFontOfSize(12)
            button.titleLabel!.adjustsFontSizeToFitWidth = true
            button.setTitle(buttonArray[i] as? String, forState: .Normal)
            button.setTitleColor(UIColor.whiteColor(), forState: .Normal)
            button.addTarget(self, action: "buttonPress:", forControlEvents: .TouchUpInside)
            self.view!.addSubview(button)
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func buttonPress(send: UIButton) {
        if send.tag == 0 {
            let myVC: YGHistogramVC = YGHistogramVC()
            let naVC: UINavigationController = UINavigationController(rootViewController: myVC)
            self.presentViewController(naVC, animated: true, completion: { _ in })
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

