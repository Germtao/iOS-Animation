//
//  TransitionAnimationController.m
//  Animation_OC
//
//  Created by TAO on 2018/1/19.
//  Copyright © 2018年 ShaggyT. All rights reserved.
//

#import "TransitionAnimationController.h"

@interface TransitionAnimationController ()

@end

@implementation TransitionAnimationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.titles = @[@"fade", @"moveIn", @"push", @"reveal", @"cube", @"suck", @"oglFlip", @"ripple", @"curl", @"uncurl", @"caOpen", @"caClose", @"curlUp"];
    [self createButton:self.titles];
    self.rect = CGRectMake(kSCREEN_WIDTH / 2 - 90, kSCREEN_HEIGHT / 2 - 200, 180, 260);
    self.currentIndex = 0;
}

- (void)buttonDidTap:(UIButton *)button {
    
    [self changeLabelText:YES];
    
    switch (button.tag) {
        case 0:
            // 淡入淡出
            [self animtion:kCATransitionFade forKey:@"fadeAnimation"];
            break;
        case 1:
            // 覆盖
            [self animtion:kCATransitionMoveIn forKey:@"moveInAnimation"];
            break;
        case 2:
            // 推挤
            [self animtion:kCATransitionPush forKey:@"pushAnimation"];
            break;
        case 3:
            // 揭开
            [self animtion:kCATransitionReveal forKey:@"revealAnimation"];
            break;
        case 4:
            // 立方体
            [self animtion:@"cube" forKey:@"cubeAnimation"];
            break;
        case 5:
            // 吮吸
            [self animtion:@"suckEffect" forKey:@"suckEffectAnimation"];
            break;
        case 6:
            // 翻转
            [self animtion:@"oglFlip" forKey:@"oglFlipAnimation"];
            break;
        case 7:
            // 波纹
            [self animtion:@"rippleEffect" forKey:@"rippleEffectAnimation"];
            break;
        case 8:
            // 翻页
            [self animtion:@"pageCurl" forKey:@"pageCurlAnimation"];
            break;
        case 9:
            // 反翻页
            [self animtion:@"pageUnCurl" forKey:@"pageUnCurlAnimation"];
            break;
        case 10:
            // 开镜头
            [self animtion:@"cameraIrisHollowOpen" forKey:@"cameraIrisHollowOpenAnimation"];
            break;
        case 11:
            // 关镜头
            [self animtion:@"cameraIrisHollowClose" forKey:@"cameraIrisHollowCloseAnimation"];
            break;
        default:
            break;
    }
}

#pragma mark - Animation

- (void)animtion:(NSString *)type forKey:(NSString *)key {
    CATransition *anim = [CATransition animation];
    anim.type = type;  // 动画类型
    anim.subtype = kCATransitionFromRight;  // 动画方向
    anim.duration = 1.0;
    [self.animView.layer addAnimation:anim forKey:key];
}

@end
