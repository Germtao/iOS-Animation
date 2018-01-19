//
//  BasicAnimViewController.m
//  Animation_OC
//
//  Created by TAO on 2017/12/8.
//  Copyright © 2017年 ShaggyT. All rights reserved.
//

#import "BasicAnimViewController.h"

@interface BasicAnimViewController ()

@end

@implementation BasicAnimViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.titles = @[@"位移", @"透明度", @"缩放", @"旋转", @"背景色", @"弹簧动画"];
    [self createButton:self.titles];
}

- (void)buttonDidTap:(UIButton *)button {
    
    [self removeAnimtion];
    
    switch (button.tag) {
        case 0:
            [self positionAnimate];
            break;
        case 1:
            [self opacityAnimate];
            break;
        case 2:
            [self scaleAnimate];
            break;
        case 3:
            [self rotateAnimate];
            break;
        case 4:
            [self backgroundColorAnimate];
            break;
        case 5:
            [self springAnimate];
            break;
            
        default:
            break;
    }
    
}

#pragma mark - 动画

// 位移动画
- (void)positionAnimate {
    
    // 1. 使用 CABasicAnimation 创建
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"position"];
    anim.fromValue = [NSValue valueWithCGPoint:CGPointMake(50, kSAFEAREA_HEIGHT / 2)];
    anim.toValue   = [NSValue valueWithCGPoint:CGPointMake(kSCREEN_WIDTH - 50, kSAFEAREA_HEIGHT / 2)];
    anim.duration = 1.0;
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];

    [self.animView.layer addAnimation:anim forKey:@"positionAnimation"];
    
    // 2. block
//    [UIView animateWithDuration:1.0 animations:^{
//        self.animView.frame = CGRectMake(kSCREEN_WIDTH, kSAFEAREA_HEIGHT / 2 - 50, 100, 100);
//    } completion:^(BOOL finished) {
//        self.animView.frame = CGRectMake(kSCREEN_WIDTH / 2 - 50, kSAFEAREA_HEIGHT / 2 - 50, 100, 100);
//    }];
    
    // 3. [begin, commit]
//    [UIView beginAnimations:nil context:nil];
//    [UIView setAnimationDuration:1.0];
//    self.animView.frame = CGRectMake(kSCREEN_WIDTH - 50, kSAFEAREA_HEIGHT / 2 - 50, 100, 100);
//    [UIView commitAnimations];
}

// 透明度动画
- (void)opacityAnimate {
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"opacity"];
    anim.fromValue = [NSNumber numberWithFloat:1.0];
    anim.toValue   = [NSNumber numberWithFloat:0.3];
    anim.duration  = 1.0;
    
    [self.animView.layer addAnimation:anim forKey:@"opacityAnimation"];
}

// 缩放动画
- (void)scaleAnimate {
    
//    CABasicAnimation *anim = [self scaleAnimate:@"bounds" value:[NSValue valueWithCGRect:CGRectMake(0, 0, 200, 200)]];
//    CABasicAnimation *anim = [self scaleAnimate:@"transform.scale.x" value:[NSNumber numberWithFloat:2.0]];
    
    CABasicAnimation *anim = [self scaleAnimate:@"transform.scale" value:[NSNumber numberWithFloat:2.0]];
    
    [self.animView.layer addAnimation:anim forKey:@"scaleAnimation"];
}

// 旋转动画
- (void)rotateAnimate {
    // 绕着 z 轴旋转
    // CABasicAnimation *anim = [self scaleAnimate:@"transform.rotation.z" value:[NSNumber numberWithFloat:M_PI]];
    
    // 绕着 x/y/z轴旋转
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"transform"];
    anim.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI, 0, 0, 1)]; // 相当于绕 z 轴旋转
    anim.repeatCount = MAXFLOAT;
    anim.duration = 0.3;
    
    [self.animView.layer addAnimation:anim forKey:@"rotateAnimation"];
}

// 背景色动画
- (void)backgroundColorAnimate {
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    anim.toValue = (__bridge id)[UIColor cyanColor].CGColor;
    anim.duration = 1.0;
    
    anim.fillMode = kCAFillModeForwards;
    anim.removedOnCompletion = NO;
    
    [self.animView.layer addAnimation:anim forKey:@"backgroundColorAnimation"];
}

// 弹簧动画
- (void)springAnimate {
    
    CASpringAnimation *anim = [CASpringAnimation animationWithKeyPath:@"position.x"];
    
    anim.damping = 5;                       // 阻尼
    anim.stiffness = 100;                   // 弹性
    anim.mass = 1;                          // 质量
    anim.initialVelocity = 0;               // 初始速度
    anim.duration = anim.settlingDuration;  // 结算时间
    anim.fromValue = [NSValue valueWithCGPoint:CGPointMake(self.animView.layer.position.x, 0)];
    anim.toValue = [NSValue valueWithCGPoint:CGPointMake(self.animView.layer.position.x + 100, 0)];
    
    [self.animView.layer addAnimation:anim forKey:@"springAnimation"];
}

#pragma mark - Helper

- (CABasicAnimation *)scaleAnimate:(NSString *)keyPath value:(id)value {
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:keyPath];
    anim.toValue = value;
    anim.duration = 1.0;
    return anim;
}



@end
