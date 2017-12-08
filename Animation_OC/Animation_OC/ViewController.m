//
//  ViewController.m
//  Animation_OC
//
//  Created by TAO on 2017/12/7.
//  Copyright © 2017年 ShaggyT. All rights reserved.
//

#import "ViewController.h"
#import "BaseViewController.h"
#import "BasicAnimViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSArray *titles;

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"动画效果";
    self.navigationController.navigationBar.barTintColor = [UIColor cyanColor];
    
    [self initData];
    [self.view addSubview:self.tableView];
}


#pragma mark - Private Methods

- (void)initData {
    
    self.titles = @[@"基础动画", @"关键帧动画", @"组动画", @"过渡动画", @"仿射变换"];
}

#pragma mark - Helper Methods

- (void)setupMessageLabel:(UILabel *)label
                    frame:(CGRect)frame
                     text:(NSString *)text
                textColor:(UIColor *)textColor
            numberOfLines:(NSInteger)numberOfLines
            textAlignment:(NSTextAlignment)textAlignment
                     font:(UIFont *)font {
    label.frame = frame;
    label.text = text;
    label.textColor = textColor;
    label.numberOfLines = numberOfLines;
    label.textAlignment = textAlignment;
    label.font = font;
    [label sizeToFit];
}

- (void)setupCell:(UITableViewCell *)cell title:(NSString *)title {
    cell.textLabel.text = title;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (self.titles.count != 0) {
        return self.titles.count;
    } else {
        UILabel *messageLabel = [[UILabel alloc] init];
        [self setupMessageLabel:messageLabel
                          frame:CGRectMake(0, kNAVBAR_STATUS_HEIGHT, kSCREEN_WIDTH, kSCREEN_HEIGHT - kNAVBAR_STATUS_HEIGHT)
                           text:@"没有数据"
                      textColor:[UIColor blackColor]
                  numberOfLines:0
                  textAlignment:NSTextAlignmentCenter
                           font:[UIFont fontWithName:@"Palatino-Italic" size:24]];
        self.tableView.backgroundView = messageLabel;
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID" forIndexPath:indexPath];
    
    [self setupCell:cell title:self.titles[indexPath.row]];
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    BaseViewController * vc = [BaseViewController new];
    
    switch (indexPath.row) {
        case 0:
            vc = [BasicAnimViewController new];
            break;
            
        default:
            break;
    }
    
    vc.title = self.titles[indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - 懒加载

- (UITableView *)tableView {
    if (!_tableView) {
        CGRect rect = CGRectMake(0, kNAVBAR_STATUS_HEIGHT, kSCREEN_WIDTH, kSCREEN_HEIGHT - kNAVBAR_STATUS_HEIGHT);
        _tableView = [[UITableView alloc] initWithFrame:rect style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellID"];
    }
    return _tableView;
}


@end
