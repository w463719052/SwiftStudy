//
//  YGBaseViewController.swift
//  SwiftStudy
//
//  Created by zccl2 on 16/7/19.
//  Copyright © 2016年 com.zccl. All rights reserved.
//

import UIKit

class YGBaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: 设置NavigationBar样式
    
    func setNavigationBarWithBackButton(isBackButton: Bool) {
        /**< 导航条标题*/
        self.navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor(), NSFontAttributeName: UIFont.boldSystemFontOfSize(20)]
        /**< 导航条背景颜色*/
        self.navigationController!.navigationBar.barTintColor = RGBACOLOR(37, g: 37, b: 37, a: 1)
        /**< 如果有返回按钮*/
        if isBackButton {
            self.setBackButton()
        }
        self.edgesForExtendedLayout = [.Left, .Right]
        self.view.backgroundColor = UIColor.whiteColor()
    }
    // MARK: 设置返回按钮
    
    func setBackButton() {
        /**< 导航条按钮*/
        let leftButton: UIBarButtonItem = UIBarButtonItem(image: UIImage(named: "fanhui")!, style: .Done, target: self, action: "back")
        self.navigationItem.leftBarButtonItem = leftButton
        /**< 导航条按钮颜色*/
        self.navigationController!.navigationBar.tintColor = UIColor.whiteColor()
    }
    
    // MARK: 返回上层
    
    func back() {
        /**< 判断WebVC的navigationController里有多少viewController，如果1个则是pre*/
        if self.navigationController!.viewControllers.count == 1 {
            self.dismissViewControllerAnimated(true, completion: { _ in })
        }
        else {
            self.navigationController!.popViewControllerAnimated(true)
        }
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
