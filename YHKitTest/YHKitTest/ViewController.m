//
//  ViewController.m
//  YHKitTest
//
//  Created by yahui.wang on 16/2/22.
//  Copyright © 2016年 yahui.wang. All rights reserved.
//

#import "ViewController.h"
#import "YHKit.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *string = @"王亚辉是个好人卷帘大将来得及啊进来贷款换衣额李加大剂量的设计费节快乐减肥快来得及雷达及偶尔忽高忽低说两句按劳动法龙卷风IE哦那来得及阿奎了开始极度疯狂不好飞洛杉矶啊拉接触面埋藏在的飞机看的";
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 80, SCREENWIDTH-20, [string heightForFont:H(15) width:SCREENWIDTH-20])];
    label.font = H(15);
    label.text = string;
    label.textColor = red_color;
    label.numberOfLines = 0;
    label.backgroundColor = yellow_color;
    [self.view addSubview:label];
    
    [MBProgressHUD show:@"正在加载" toView:self.view];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [MBProgressHUD showText:@"请登录后访问!" toView:self.view];
    });
    
    YHTimerView *timerView = [[YHTimerView alloc] initWithFrame:CGRectMake(0, label.yhBottom+50, SCREENWIDTH, 40)];
    timerView.backgroundColor = [UIColor colorWithHexString:@"2fcfc3"];
    timerView.textColor = timerView.backgroundColor;
    [self.view addSubview:timerView];
    
    timerView.countDownTime = 795;
}

@end
