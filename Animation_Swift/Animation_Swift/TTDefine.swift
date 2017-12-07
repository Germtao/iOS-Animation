//
//  TTDefine.swift
//  Animation_Swift
//
//  Created by TAO on 2017/7/25.
//  Copyright © 2017年 Germtao. All rights reserved.
//

import UIKit

/// 判断是否为 iPhoneX
let IsiPhoneX      = (UIScreen.main.bounds.size.height == 812) ? true : false
/// 宽高
let kSCREEN_WIDTH  = UIScreen.main.bounds.size.width
let kSCREEN_HEIGHT = UIScreen.main.bounds.size.height
/// tabBar 高度
let kTABBAR_HEIGHT: CGFloat = IsiPhoneX ? 83 : 49
let kTABBAR_BOTTOM_HEIGHT: CGFloat = IsiPhoneX ? 34 : 0
/// NavBar 高度
let kNAVIBAR_HEIGHT: CGFloat = 44
/// statuBar 高度
let kSTATUBAR_HEIGHT: CGFloat = IsiPhoneX ? 44 : 20
/// safeArea 高度
let kSAFEAREA_HEIGHT = kSCREEN_HEIGHT - kNAVIBAR_HEIGHT - kSTATUBAR_HEIGHT - kTABBAR_BOTTOM_HEIGHT

