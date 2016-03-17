//
//  MBProgressHUD+YH.h
//  YHKitTest
//
//  Created by yahui.wang on 16/3/16.
//  Copyright © 2016年 yahui.wang. All rights reserved.
//

#import <MBProgressHUD/MBProgressHUD.h>

@interface MBProgressHUD (YH)

/**
 *  显示菊花加文字;
 *  message为nil时只显示菊花;
 */
+ (void)show:(NSString *)message toView:(UIView *)view;

/**
 *  显示提示文字
 */
+ (void)showText:(NSString *)text toView:(UIView *)view;

@end
