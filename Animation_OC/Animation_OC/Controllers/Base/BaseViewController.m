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

#pragma mark - 懒加载

- (NSArray *)titles {
    if (!_titles) {
        _titles = [[NSArray alloc] init];
    }
    return _titles;
}

@end
