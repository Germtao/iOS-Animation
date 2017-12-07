//
//  ViewController.m
//  Animation_OC
//
//  Created by TAO on 2017/12/7.
//  Copyright © 2017年 ShaggyT. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) NSArray *titles;

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initData];
}


#pragma mark - Private Methods

- (void)initData {
    
    self.titles = @[@"基础动画", @"关键帧动画", @"组动画", @"过渡动画", @"仿射变换"];
}

#pragma mark - 懒加载

- (UITableView *)tableView {
    if (!_tableView) {
        CGRect rect = CGRectMake(0, , <#CGFloat width#>, <#CGFloat height#>)
        _tableView = [[UITableView alloc] initWithFrame:<#(CGRect)#> style:<#(UITableViewStyle)#>];
    }
}


@end
