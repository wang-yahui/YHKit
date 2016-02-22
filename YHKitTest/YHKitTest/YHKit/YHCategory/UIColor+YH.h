//
//  UIColor+YH.h
//  YHKit
//
//  Created by yahui.wang on 16/2/3.
//  Copyright © 2016年 yahui.wang. All rights reserved.
//

#import <UIKit/UIKit.h>

//常用颜色值
#define red_color       [UIColor redColor]
#define gray_color      [UIColor grayColor]
#define blue_color      [UIColor blueColor]
#define green_color     [UIColor greenColor]
#define black_color     [UIColor blackColor]
#define brown_color     [UIColor brownColor]
#define clear_color     [UIColor clearColor]
#define white_color     [UIColor whiteColor]
#define yellow_color    [UIColor yellowColor]
#define orange_color    [UIColor orangeColor]
#define purple_color    [UIColor purpleColor]
#define magenta_color   [UIColor magentaColor]
#define darkGray_color  [UIColor darkGrayColor]
#define darkText_color  [UIColor darkTextColor]
#define lightText_color [UIColor lightTextColor]
#define lightGray_color [UIColor lightGrayColor]

@interface UIColor (YH)

/**
 *  16进制的颜色值
 */
+ (UIColor *)colorWithHexString:(NSString *)string;

+ (UIColor *)colorWithHexString:(NSString *)string
                          alpha:(float)alpha;

@end
