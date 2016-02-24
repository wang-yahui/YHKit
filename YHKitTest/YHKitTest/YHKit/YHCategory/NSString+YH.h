//
//  NSString+YH.h
//  YHKit
//
//  Created by yahui.wang on 16/2/15.
//  Copyright © 2016年 yahui.wang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (YH)

/**
 *  md5加密
 */
- (NSString *)md5String;

/**
 *  是否包含emoji表情
 */
- (BOOL)isContainEmoji;

/**
 *  是否包含某个字符串
 */
- (BOOL)isContainString:(NSString *)string;

/**
 *  验证手机号
 */
- (BOOL)isMobilePhone;

/**
 *  验证邮箱
 */
- (BOOL)isEmail;

/**
 *  验证身份证号
 */
- (BOOL)isIdentityCardID;

/**
 *  string的高度
 */
- (CGFloat)heightForFont:(UIFont *)font
                   width:(CGFloat)width;

/**
 *  string的宽度
 */
- (CGFloat)widthForFont:(UIFont *)font;

/**
 *  时间戳转换成date
 */
- (NSDate *)date;

/**
 *  时间戳转换成显示的string
 */
- (NSString *)dateStringWithFormatter:(NSString *)formatter;

@end
