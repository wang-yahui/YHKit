//
//  UIColor+YH.m
//  YHKit
//
//  Created by yahui.wang on 16/2/3.
//  Copyright © 2016年 yahui.wang. All rights reserved.
//

#import "UIColor+YH.h"

@implementation UIColor (YH)

+ (UIColor *)colorWithHexString:(NSString *)string {
    return [self colorWithHexString:string alpha:1.0f];
}

+ (UIColor *)colorWithHexString:(NSString *)string
                          alpha:(float)alpha {
    //从字符串中去除空格和换行
    NSString *cString = [[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    if ([cString length] < 6) return nil;
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"]) cString = [cString substringFromIndex:1];
    if ([cString length] != 6) return nil;
    
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:alpha];
}

@end
