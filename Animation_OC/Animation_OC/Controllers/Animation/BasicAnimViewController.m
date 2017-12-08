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
}

#pragma mark - 懒加载

- (UIView *)animView {
    if (!_animView) {
        _animView = [[UIView alloc] initWithFrame:CGRectMake(kSCREEN_HEIGHT / 2 - 50, kSCREEN_HEIGHT / 2 - 50, 100, 100)];
        _animView.backgroundColor = [UIColor cyanColor];
        [self.view addSubview:_animView];
    }
    return _animView;
}

@end
