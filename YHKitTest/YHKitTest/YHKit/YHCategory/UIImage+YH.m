//
//  UIImage+YH.m
//  DAIGJ
//
//  Created by yahui.wang on 2016/11/14.
//  Copyright © 2016年 lee_zhou. All rights reserved.
//

#import "UIImage+YH.h"

@implementation UIImage (YH)

+ (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
