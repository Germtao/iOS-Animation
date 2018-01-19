//
//  GroupAnimationController.m
//  Animation_OC
//
//  Created by TAO on 2018/1/19.
//  Copyright © 2018年 ShaggyT. All rights reserved.
//

#import "GroupAnimationController.h"

@interface GroupAnimationController ()

@end

@implementation GroupAnimationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.titles = @[@"同时", @"连续"];
    [self createButton:self.titles];
}

- (void)buttonDidTap:(UIButton *)button {
    [self removeAnimtion];
    
    switch (button.tag) {
        case 0:
            [self groupAnimate1];
            break;
        case 1:
            [self groupAnimation2];
            break;
        default:
            break;
    }
}

#pragma mark - Animation

/**
 同时
 */
- (void)groupAnimate1 {
    /// 位移动画
    CAKeyframeAnimation *anim0 = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    NSValue *value0 = [NSValue valueWithCGPoint:CGPointMake(0, kSCREEN_HEIGHT / 2 - 50)];
    NSValue *value1 = [NSValue valueWithCGPoint:CGPointMake(kSCREEN_WIDTH / 3, kSCREEN_HEIGHT / 2 - 50)];
    NSValue *value2 = [NSValue valueWithCGPoint:CGPointMake(kSCREEN_WIDTH / 3, kSCREEN_HEIGHT / 2 + 50)];
    NSValue *value3 = [NSValue valueWithCGPoint:CGPointMake(kSCREEN_WIDTH * 2 / 3, kSCREEN_HEIGHT / 2 + 50)];
    NSValue *value4 = [NSValue valueWithCGPoint:CGPointMake(kSCREEN_WIDTH * 2 / 3, kSCREEN_HEIGHT / 2 - 50)];
    NSValue *value5 = [NSValue valueWithCGPoint:CGPointMake(kSCREEN_WIDTH, kSCREEN_HEIGHT / 2)];
    anim0.values = @[value0, value1, value2, value3, value4, value5];
    
    /// 缩放动画
    CABasicAnimation *anim1 = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    anim1.fromValue = [NSNumber numberWithFloat:0.8];
    anim1.toValue = [NSNumber numberWithFloat:0.2];
    
    /// 旋转动画
    CABasicAnimation *anim2 = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    anim2.toValue = [NSNumber numberWithFloat:M_PI * 4];
    
    CAAnimationGroup *groupAnim = [CAAnimationGroup animation];
    groupAnim.animations = @[anim0, anim1, anim2];
    groupAnim.duration = 4.0;
    [self.animView.layer addAnimation:groupAnim forKey:@"groupAnimation"];
}

/**
 连续
 */
- (void)groupAnimation2 {
    
    CFTimeInterval currentTime = CACurrentMediaTime();
    
    /// 位移动画
    CABasicAnimation *anim0 = [CABasicAnimation animationWithKeyPath:@"position"];
    anim0.fromValue = [NSValue valueWithCGPoint:CGPointMake(0, kSCREEN_HEIGHT / 2 - 50)];
    anim0.toValue   = [NSValue valueWithCGPoint:CGPointMake(kSCREEN_WIDTH - 100, kSCREEN_HEIGHT / 2 - 50)];
    anim0.beginTime = currentTime;
    anim0.duration = 1.0;
    anim0.fillMode = kCAFillModeForwards;
    anim0.removedOnCompletion = NO;
    [self.animView.layer addAnimation:anim0 forKey:@"positionAnimation"];
    
    /// 缩放动画
    CABasicAnimation *anim1 = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    anim1.fromValue = [NSNumber numberWithFloat:0.8];
    anim1.toValue   = [NSNumber numberWithFloat:0.2];
    anim1.beginTime = currentTime + 1.0;
    anim1.duration = 1.0;
    anim1.fillMode = kCAFillModeForwards;
    anim1.removedOnCompletion = NO;
    [self.animView.layer addAnimation:anim1 forKey:@"scaleAnimation"];
    
    /// 旋转动画
    CABasicAnimation *anim2 = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    anim2.toValue = [NSNumber numberWithFloat:M_PI * 4];
    anim2.beginTime = currentTime + 1.0 + 1.0;
    anim2.duration = 1.0;
    anim2.fillMode = kCAFillModeForwards;
    anim2.removedOnCompletion = NO;
    [self.animView.layer addAnimation:anim2 forKey:@"rotationAnimation"];
}

@end
