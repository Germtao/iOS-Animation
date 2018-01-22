//
//  AffineTransformViewController.m
//  Animation_OC
//
//  Created by TT on 2018/1/22.
//  Copyright © 2018年 ShaggyT. All rights reserved.
//

#import "AffineTransformViewController.h"

@interface AffineTransformViewController ()

@end

@implementation AffineTransformViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.titles = @[@"位移", @"缩放", @"旋转", @"组合", @"反转"];
    [self createButton:self.titles];
    
}

- (void)buttonDidTap:(UIButton *)button {
    
    self.animView.transform = CGAffineTransformIdentity;
    
    switch (button.tag) {
        case 0:
            // 位移
            [self animationWithTransform:CGAffineTransformMakeTranslation(100, 0)];
            break;
        case 1:
            // 缩放
            [self animationWithTransform:CGAffineTransformMakeScale(2, 1)];
            break;
        case 2:
            // 旋转
            [self animationWithTransform:CGAffineTransformMakeRotation(M_PI_2)];
            break;
        case 3:
            // 组合
            [self animationWithTransform:CGAffineTransformConcat(CGAffineTransformConcat(CGAffineTransformMakeRotation(M_PI), CGAffineTransformMakeScale(2, 1)), CGAffineTransformMakeTranslation(100, 100))];
            break;
            
        default:
            // 反转
            [self animationWithTransform:CGAffineTransformInvert(CGAffineTransformMakeScale(2, 1))];
            break;
    }
    
}

#pragma mark - Animation

- (void)animationWithTransform:(CGAffineTransform)transform {
    [UIView animateWithDuration:1.0 animations:^{
        self.animView.transform = transform;
    }];
}

@end
