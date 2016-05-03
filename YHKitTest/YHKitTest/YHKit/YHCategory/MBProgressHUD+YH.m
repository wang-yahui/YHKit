//
//  MBProgressHUD+YH.m
//  YHKitTest
//
//  Created by yahui.wang on 16/3/16.
//  Copyright © 2016年 yahui.wang. All rights reserved.
//

#import "MBProgressHUD+YH.h"

#define kLABELFONT [UIFont systemFontOfSize:15]

@implementation MBProgressHUD (YH)

+ (void)show:(NSString *)message toView:(UIView *)view {
    [MBProgressHUD hideAllHUDsForView:view animated:NO];
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.labelText = [message isKindOfClass:[NSString class]]? message: @"";
    hud.labelFont = kLABELFONT;
    hud.margin = 15.0f;
    // YES代表需要蒙版效果
    hud.dimBackground = NO;
    hud.minSize = CGSizeMake(88, 88);
}

+ (void)showText:(NSString *)text toView:(UIView *)view {
    [MBProgressHUD hideAllHUDsForView:view animated:NO];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.labelText = [text isKindOfClass:[NSString class]]? text: @"";
    hud.labelFont = kLABELFONT;
    hud.margin = 15.0f;
    hud.dimBackground = NO;
    hud.userInteractionEnabled = NO;
    
    [hud hide:YES afterDelay:2];
}

@end
