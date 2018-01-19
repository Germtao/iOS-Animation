//
//  KeyFrameAnimationController.m
//  Animation_OC
//
//  Created by TAO on 2018/1/19.
//  Copyright © 2018年 ShaggyT. All rights reserved.
//

#import "KeyFrameAnimationController.h"

@interface KeyFrameAnimationController ()

@end

@implementation KeyFrameAnimationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.titles = @[@"关键帧", @"路径", @"抖动"];
    
    [self createButton:self.titles];
}

- (void)buttonDidTap:(UIButton *)button {
    
    [self removeAnimtion];
    
    switch (button.tag) {
        case 0:
            [self keyFrameAnimation];
            break;
        case 1:
            [self pathAnimation];
            break;
        case 2:
            [self shakeAnimation];
            break;
            
        default:
            break;
    }
    
}

#pragma mark - Animation

/**
 关键帧动画
 */
- (void)keyFrameAnimation {
    
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    NSValue *value0 = [NSValue valueWithCGPoint:CGPointMake(0, kSCREEN_HEIGHT / 2 - 50)];
    NSValue *value1 = [NSValue valueWithCGPoint:CGPointMake(kSCREEN_WIDTH / 3, kSCREEN_HEIGHT / 2 - 50)];
    NSValue *value2 = [NSValue valueWithCGPoint:CGPointMake(kSCREEN_WIDTH / 3, kSCREEN_HEIGHT / 2 + 50)];
    NSValue *value3 = [NSValue valueWithCGPoint:CGPointMake(kSCREEN_WIDTH * 2 / 3, kSCREEN_HEIGHT / 2 + 50)];
    NSValue *value4 = [NSValue valueWithCGPoint:CGPointMake(kSCREEN_WIDTH * 2 / 3, kSCREEN_HEIGHT / 2 - 50)];
    NSValue *value5 = [NSValue valueWithCGPoint:CGPointMake(kSCREEN_WIDTH, kSCREEN_HEIGHT / 2)];
    
    anim.values = @[value0, value1, value2, value3, value4, value5];
    anim.duration = 2.0;
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [self.animView.layer addAnimation:anim forKey:@"keyFrameAnimation"];
}

/**
 路径动画
 */
- (void)pathAnimation {
    
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(kSCREEN_WIDTH / 2 - 100, kSCREEN_HEIGHT / 2 - 150, kSCREEN_WIDTH - 200, 200)];
    path.lineCapStyle = kCGLineCapRound;
    
    anim.path = path.CGPath;
    anim.duration = 2.0;
    [self.animView.layer addAnimation:anim forKey:@"pathAnimation"];
}

/**
 抖动动画
 */
- (void)shakeAnimation {
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation"];
    NSNumber *value0 = [NSNumber numberWithFloat:-M_PI / 180 * 4];
    NSNumber *value1 = [NSNumber numberWithFloat: M_PI / 180 * 4];
    
    anim.values = @[value0, value1, value0];
    anim.repeatCount = MAXFLOAT;
    anim.repeatDuration = 10;
    [self.animView.layer addAnimation:anim forKey:@"shakeAnimation"];
}

@end
