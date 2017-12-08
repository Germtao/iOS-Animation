//
//  BaseViewController.h
//  Animation_OC
//
//  Created by TAO on 2017/12/8.
//  Copyright © 2017年 ShaggyT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

@property (nonatomic, strong) NSArray *titles;

/**
 创建按钮

 @param array 按钮文本数组
 */
- (void)createButton:(NSArray *)array;

- (void)buttonDidTap:(UIButton *)button;

@end
