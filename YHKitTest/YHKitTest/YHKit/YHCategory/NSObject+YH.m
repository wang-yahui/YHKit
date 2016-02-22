//
//  NSObject+YH.m
//  YHKit
//
//  Created by yahui.wang on 16/2/3.
//  Copyright © 2016年 yahui.wang. All rights reserved.
//

#import "NSObject+YH.h"
#import <objc/runtime.h>

@implementation NSObject (YH)

- (BOOL)isArray {
    if (self && [self isKindOfClass:[NSArray class]]) return YES;
    return NO;
}

- (BOOL)isDictionary {
    if (self && [self isKindOfClass:[NSDictionary class]]) return YES;
    return NO;
}

- (BOOL)isString {
    if (self && [self isKindOfClass:[NSString class]]) return YES;
    return NO;
}

- (NSString *)className {
    return [NSString stringWithUTF8String:class_getName([self class])];
}

@end
