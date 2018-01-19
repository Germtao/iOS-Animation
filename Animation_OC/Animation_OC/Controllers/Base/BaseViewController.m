//
//  BaseViewController.m
//  Animation_OC
//
//  Created by TAO on 2017/12/8.
//  Copyright © 2017年 ShaggyT. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.animView];
}

- (void)removeAnimtion {
    [self.animView.layer removeAllAnimations];
}

#pragma mark - Public Method

- (void)createButton:(NSArray *)array {
    
    if (array.count > 0) {
        NSInteger row = (array.count % 4 == 0) ? array.count / 4 : (array.count / 4 + 1);
        
        CGRect rect = CGRectMake(0, kSCREEN_HEIGHT - (row * 50 + 20) - kTABBAR_BOTTOM_HEIGHT, kSCREEN_WIDTH, row * 50 + 20);
        UIView *bgView = [[UIView alloc] initWithFrame:rect];
        bgView.backgroundColor = [UIColor cyanColor];
        [self.view addSubview:bgView];
        
        for (NSInteger i = 0; i < array.count; i++) {
            UIButton *button = [self setTitleButton:[self setRectForBtnAtIndex:i totalNum:array.count]
                                              title:self.titles[i]];
            button.tag = i;
            [button addTarget:self action:@selector(buttonDidTap:) forControlEvents:UIControlEventTouchUpInside];
            [bgView addSubview:button];
        }
    }
}

- (void)changeLabelText:(BOOL)isUp {
    if (isUp) {
        self.currentIndex += 1;
    } else {
        self.currentIndex -= 1;
    }
}

#pragma mark - Action

- (void)buttonDidTap:(UIButton *)button {
    
}

#pragma mark - Helper Methods

- (UIButton *)setTitleButton:(CGRect)frame title:(NSString *)title {
    
    UIButton *button = [[UIButton alloc] initWithFrame:frame];
    [button setTitle:title forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:12];
    button.backgroundColor = [UIColor lightGrayColor];
    
    return button;
}

- (CGRect)setRectForBtnAtIndex:(NSInteger)index totalNum:(NSInteger)totalNum {
    
    // 每行最多显示4个
    NSInteger maxColumnNum = 4;
    
    CGFloat   columnMargin = 20; // 列间距
    CGFloat   rowMargin    = 20; // 行间距
    
    CGFloat btnW = (kSCREEN_WIDTH - columnMargin * 5) / 4;
    CGFloat btnH = 30;
    
    CGFloat offsetX = columnMargin + (index % maxColumnNum) * (columnMargin + btnW);
    CGFloat offsetY = rowMargin + (index / maxColumnNum) * (rowMargin + btnH);
    
    return CGRectMake(offsetX, offsetY, btnW, btnH);
}

#pragma mark - Setter

- (void)setRect:(CGRect)rect {
    _rect = rect;
    
    self.animLabel.hidden = NO;
    self.animView.frame  = rect;
    self.animLabel.frame = CGRectMake(rect.size.width / 2 - 10, rect.size.height / 2 - 20, 20, 40);
}

- (void)setCurrentIndex:(NSInteger)currentIndex {
    _currentIndex = currentIndex;
    
    if (_currentIndex > 3) {
        _currentIndex = 0;
    }
    
    if (_currentIndex < 0) {
        _currentIndex = 3;
    }
    
    NSArray *colors = @[[UIColor cyanColor], [UIColor magentaColor], [UIColor orangeColor], [UIColor purpleColor]];
    NSArray *titles = @[@"0", @"1", @"2", @"3"];
    
    self.animView.backgroundColor = colors[_currentIndex];
    self.animLabel.text           = titles[_currentIndex];
}

#pragma mark - 懒加载

- (NSArray *)titles {
    if (!_titles) {
        _titles = [[NSArray alloc] init];
    }
    return _titles;
}

- (UIView *)animView {
    if (!_animView) {
        _animView = [[UIView alloc] initWithFrame:CGRectMake(kSCREEN_WIDTH / 2 - 50, kSAFEAREA_HEIGHT / 2 - 50, 100, 100)];
        _animView.backgroundColor = [UIColor redColor];
    }
    return _animView;
}

- (UILabel *)animLabel {
    if (!_animLabel) {
        _animLabel = [[UILabel alloc] init];
        _animLabel.textAlignment = NSTextAlignmentCenter;
        _animLabel.font = [UIFont systemFontOfSize:28];
        _animLabel.hidden = YES;
        [self.animView addSubview:_animLabel];
    }
    return _animLabel;
}

@end
