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
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 80, [string widthForFont:H(15)], 20)];
    label.font = [UIFont systemFontOfSize:15];
    label.text = string;
    label.textColor = red_color;
    label.textAlignment = NSTextAlignmentCenter;
    label.numberOfLines = 0;
    label.backgroundColor = yellow_color;
    [self.view addSubview:label];
}

@end
