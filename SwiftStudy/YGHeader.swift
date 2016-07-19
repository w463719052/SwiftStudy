//
//  YGHeader.swift
//  SwiftStudy
//
//  Created by zccl2 on 16/7/19.
//  Copyright © 2016年 com.zccl. All rights reserved.
//

import Foundation
import UIKit

/**
 获取屏幕宽度
 
 - returns: 屏幕宽度
 */
func ScreenWidth()->CGFloat {
    return UIScreen.mainScreen().bounds.size.width
}
/**
 获取屏幕高度
 
 - returns: 屏幕高度
 */
func ScreenHeight()->CGFloat {
    return UIScreen.mainScreen().bounds.size.height
}
/**
 视图宽度
 
 - parameter view: 该视图
 
 - returns: 该视图宽度
 */
func ViewWidth(view:UIView)->CGFloat {
    return view.frame.size.width
}
/**
 视图高度
 
 - parameter view: 该视图
 
 - returns: 该视图高度
 */
func ViewHeight(view:UIView)->CGFloat {
    return view.frame.size.height
}
/**
 根据RGB获取颜色
 
 - parameter r: R
 - parameter g: G
 - parameter b: B
 - parameter a: 透明度
 
 - returns: 颜色
 */
func RGBACOLOR(r:CGFloat, g:CGFloat, b:CGFloat, a:CGFloat)->UIColor{
    return UIColor (red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
}