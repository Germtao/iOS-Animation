//
//  BasicAnimViewController.m
//  Animation_OC
//
//  Created by TAO on 2017/12/8.
//  Copyright © 2017年 ShaggyT. All rights reserved.
//

#import "BasicAnimViewController.h"

@interface BasicAnimViewController ()

@property (nonatomic, strong) UIView *animView;

@end

@implementation BasicAnimViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.titles = @[@"位移", @"透明度", @"缩放", @"旋转", @"背景色", @"弹簧动画"];
    [self createButton:self.titles];
    [self.view addSubview:self.animView];
}

- (void)buttonDidTap:(UIButton *)button {
    
    switch (button.tag) {
        case 0:
            [self positionAnimate];
            break;
        case 1:
            [self opacityAnimate];
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

#pragma mark - Helper



#pragma mark - 懒加载

- (UIView *)animView {
    if (!_animView) {
        _animView = [[UIView alloc] initWithFrame:CGRectMake(kSCREEN_WIDTH / 2 - 50, kSAFEAREA_HEIGHT / 2 - 50, 100, 100)];
        _animView.backgroundColor = [UIColor redColor];
    }
    return _animView;
}

@end
