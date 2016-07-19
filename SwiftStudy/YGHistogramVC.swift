//
//  YGHistogramVC.swift
//  SwiftStudy
//
//  Created by zccl2 on 16/7/19.
//  Copyright © 2016年 com.zccl. All rights reserved.
//

import UIKit

class YGHistogramVC: YGBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigationBarWithBackButton(true)
        self.title = "柱状图"
        
        let histogramView = YGHistogramView(frame: CGRectMake(20, 20, ScreenWidth()-40, 230))
        histogramView.backgroundColor = RGBACOLOR(71, g: 146, b: 255, a: 0.8)
        histogramView.layer.cornerRadius = 10
        histogramView.layer.masksToBounds = true
        self.view.addSubview(histogramView)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
