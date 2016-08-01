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

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if ([self init]) {
        unsigned int count = 0;
        //获取所有成员变量
        Ivar *ivars = class_copyIvarList([self class], &count);
        for (int i = 0; i < count; i++) {
            //取出 i 位置对应的成员变量
            Ivar ivar = ivars[i];
            //查看成员变量
            const char *name = ivar_getName(ivar);
            //归档
            NSString *key = [NSString stringWithUTF8String:name];
            id value = [aDecoder decodeObjectForKey:key];
            [self setValue:value forKey:key];
        }
        free(ivars);
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    unsigned int count = 0;
    //获取所有成员变量
    Ivar *ivars = class_copyIvarList([self class], &count);
    for (int i = 0; i < count; i++) {
        //取出 i 位置对应的成员变量
        Ivar ivar = ivars[i];
        //查看成员变量
        const char *name = ivar_getName(ivar);
        //归档
        NSString *key = [NSString stringWithUTF8String:name];
        id value = [self valueForKey:key];
        [aCoder encodeObject:value forKey:key];
    }
    free(ivars);
}

@end
