//
//  ViewController.m
//  iOSAnimationSet
//
//  Created by TT on 2018/3/28.
//  Copyright © 2018年 T AO. All rights reserved.
//  使用CAShapeLayer绘画动态流量图

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>

// 进度view
@property (nonatomic, strong) UIView *progressView;

// 进度textField
@property (nonatomic, strong) UITextField *progressTF;

// 进度显示label
@property (nonatomic, strong) UILabel *progressLabel;

// 开始动画btn
@property (nonatomic, strong) UIButton *animateBtn;

@property (nonatomic, strong) CAShapeLayer *circleLayer;
@property (nonatomic, strong) CAShapeLayer *circleProgressLayer;

// 定时器
@property (nonatomic, strong) NSTimer *timer;

@property (nonatomic, assign) CGFloat progressValue;
@property (nonatomic, assign) CGFloat expectValue;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self basicShapeLayer];
//    [self drawHollowLayer];
    
    [self initialze];
}

- (void)initialze {
    
    [self.view addSubview:self.progressView];
    [self.view addSubview:self.progressTF];
    [self.view addSubview:self.progressLabel];
    [self.view addSubview:self.animateBtn];
    
    [self.progressView.layer addSublayer:self.circleLayer];
    [self.progressView.layer addSublayer:self.circleProgressLayer];
    
}

#pragma mark - Event

- (void)startAnimated:(UIButton *)sender {
    
    // 初始化数值
    self.circleProgressLayer.strokeStart = 0;
    self.progressValue = 0;
    
    // 对输入的内容进行安全判断
    if (self.progressTF.text) {
        NSNumber *value = [[[NSNumberFormatter alloc] init] numberFromString:self.progressTF.text];
        
        if (value.floatValue >= 0 && value.floatValue <= 100) {
            self.expectValue = value.floatValue;
        } else {
            self.expectValue = 0;
        }
    } else {
        self.expectValue = 0;
    }
    
    // 开启timer
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.04 target:self selector:@selector(progressShowNumber) userInfo:nil repeats:YES];
}

- (void)progressShowNumber {
    
    if (self.progressValue > self.expectValue - 1 && self.expectValue < self.progressValue) {
        [self.timer invalidate];
        
        self.circleProgressLayer.strokeEnd = self.expectValue / 100;
        self.progressLabel.text = [NSString stringWithFormat:@"%.2f%@", self.expectValue, @"%"];
        return;
    }
    
    if (self.progressValue > self.expectValue) {
        [self.timer invalidate];
        return;
    }
    
    // 更新进度文字和进度条的strokeEnd
    self.circleProgressLayer.strokeEnd = self.progressValue / 100;
    self.progressLabel.text = [NSString stringWithFormat:@"%.2f%@", self.progressValue, @"%"];
    
    self.progressValue += 1;
}

#pragma mark - 懒加载

- (UIView *)progressView {
    if (!_progressView) {
        _progressView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
        _progressView.center = self.view.center;
        _progressView.backgroundColor = [UIColor purpleColor];
    }
    return _progressView;
}

- (UILabel *)progressLabel {
    if (!_progressLabel) {
        _progressLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
        _progressLabel.center = self.view.center;
        _progressLabel.text = @"0.00%";
        _progressLabel.textAlignment = NSTextAlignmentCenter;
        _progressLabel.textColor = [UIColor whiteColor];
    }
    return _progressLabel;
}

- (UITextField *)progressTF {
    if (!_progressTF) {
        _progressTF = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMinX(self.progressView.frame), CGRectGetMaxY(self.progressView.frame) + 20, 100, 50)];
        _progressTF.borderStyle = UITextBorderStyleRoundedRect;
        _progressTF.placeholder = @"输入";
    }
    return _progressTF;
}

- (UIButton *)animateBtn {
    if (!_animateBtn) {
        _animateBtn = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.progressView.frame) - 60, CGRectGetMaxY(self.progressView.frame) + 20, 60, 30)];
        [_animateBtn setTitle:@"动画" forState:UIControlStateNormal];
        [_animateBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_animateBtn setBackgroundColor:[UIColor lightGrayColor]];
        [_animateBtn addTarget:self action:@selector(startAnimated:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _animateBtn;
}

- (CAShapeLayer *)circleLayer {
    if (!_circleLayer) {
        
        CGRect bounds = CGRectMake(0, 0, 200, 200);
        
        _circleLayer = [CAShapeLayer layer];
        _circleLayer.bounds = bounds;
        _circleLayer.position = CGPointMake(bounds.size.width / 2, bounds.size.height / 2);
        
        UIBezierPath *circlePath = [UIBezierPath bezierPathWithOvalInRect:bounds];
        _circleLayer.path = circlePath.CGPath;
        
        _circleLayer.fillColor = [UIColor clearColor].CGColor;
        _circleLayer.strokeColor = [UIColor lightGrayColor].CGColor;
        _circleLayer.lineWidth = 10;
    }
    return _circleLayer;
}

- (CAShapeLayer *)circleProgressLayer {
    if (!_circleProgressLayer) {
        
        CGRect bounds = CGRectMake(0, 0, 200, 200);
        
        _circleProgressLayer = [CAShapeLayer layer];
        _circleProgressLayer.bounds = bounds;
        _circleProgressLayer.position = CGPointMake(bounds.size.width / 2, bounds.size.height / 2);
        
        UIBezierPath *circleProgressPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(bounds.size.width / 2, bounds.size.height / 2) radius:bounds.size.height / 2 startAngle:0 endAngle:M_PI * 2 clockwise:YES];
        _circleProgressLayer.path = circleProgressPath.CGPath;
        
        _circleProgressLayer.strokeColor = [UIColor cyanColor].CGColor;
        _circleProgressLayer.fillColor = [UIColor clearColor].CGColor;
        
        _circleProgressLayer.strokeStart = 0;
        _circleProgressLayer.strokeEnd = 0;
        _circleProgressLayer.lineWidth = 10;
        
    }
    return _circleProgressLayer;
}

#pragma mark - CAShapeLayer
#pragma mark - 绘制一个镂空图层动画

- (void)drawHollowLayer {
    
    // 创建空心CAShapeLayer
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.bounds = CGRectMake(0, 0, 100, 100);
    layer.position = self.view.center;
    [self.view.layer addSublayer:layer];
    
    // 最外侧带圆角的方形path
    UIBezierPath *squarePath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 100, 100) cornerRadius:5];
    
    // 中间镂空的圆形path
    UIBezierPath *hollowPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(10, 10, 80, 80)];
    
    // hollowPath 加入 squarePath
    [squarePath appendPath:hollowPath];
    layer.path = squarePath.CGPath;
    
    // layer填充颜色
    layer.fillColor = [UIColor lightGrayColor].CGColor;
    // 填充路径时使用的填充规则, 两个图形的非交集
    layer.fillRule = kCAFillRuleEvenOdd;
    
    // 创建进度Layer
    CAShapeLayer *progressLayer = [CAShapeLayer layer];
    progressLayer.bounds = CGRectMake(0, 0, 70, 70);
    progressLayer.position = self.view.center;
    [self.view.layer addSublayer:progressLayer];
    
    // 进度path
    UIBezierPath *progressPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(35, 35)
                                                                radius:35 / 2
                                                            startAngle:0
                                                              endAngle:M_PI * 2
                                                             clockwise:YES];
    progressLayer.path = progressPath.CGPath;
    progressLayer.lineWidth = 35;
    
    // 进度的起点和结束位置，设置进度条修改这个值和结束数值就可以了
    progressLayer.strokeStart = 0;
    progressLayer.strokeEnd = 2;
    
    progressLayer.strokeColor = [UIColor cyanColor].CGColor;
    progressLayer.fillColor = [UIColor cyanColor].CGColor;
}

#pragma mark - CAShapeLayer 基础使用

- (void)basicShapeLayer {
    
    CAShapeLayer *basicLayer = [CAShapeLayer layer];
    basicLayer.bounds = CGRectMake(0, 0, 100, 100);
    basicLayer.position = self.view.center;
    [self.view.layer addSublayer:basicLayer];
    
    UIBezierPath *basicPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 100, 100)];
    
    basicLayer.path = basicPath.CGPath;
    
    // 填充色
    basicLayer.fillColor = [UIColor clearColor].CGColor;
    // 边框色
    basicLayer.strokeColor = [UIColor cyanColor].CGColor;
    // 边框宽度
    basicLayer.lineWidth = 2;
    // 起点
    basicLayer.strokeStart = 0;
    // 终点
    basicLayer.strokeEnd = 1;
    
    // 画完实线5, 空2, 再画10, 最后画5
    basicLayer.lineDashPattern = @[@5, @2, @10, @5];
}

@end
