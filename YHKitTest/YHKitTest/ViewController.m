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
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 80, self.view.frame.size.width, 40)];
    label.font = [UIFont systemFontOfSize:16];
    label.text = @"王亚辉是个好人";
    label.textColor = red_color;
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = yellow_color;
    [self.view addSubview:label];
    
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, label.yhBottom+50, label.yhWidth, 40)];
    imgView.backgroundColor = blue_color;
    imgView.image = [label snapshotImage];
    [self.view addSubview:imgView];
}

@end
