//
//  NSObject+YH.h
//  YHKit
//
//  Created by yahui.wang on 16/2/3.
//  Copyright © 2016年 yahui.wang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (YH)

/** 
 *  判断OC对象是否是数组 
 */
- (BOOL)isArray;

/** 
 *  判断OC对象是否是字典
 */
- (BOOL)isDictionary;

/** 
 *  判断OC对象是否是字符串 
 */
- (BOOL)isString;

/**
 *  对象的类名
 */
- (NSString *)className;

@end
