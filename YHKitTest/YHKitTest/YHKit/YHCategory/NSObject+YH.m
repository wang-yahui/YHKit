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
        //获取所有属性
        objc_property_t *propertys = class_copyPropertyList([self class], &count);
        for (int i = 0; i < count; i++) {
            //查看属性
            const char *name = property_getName(propertys[i]);
            //归档
            NSString *key = [NSString stringWithUTF8String:name];
            id value = [aDecoder decodeObjectForKey:key];
            [self setValue:value forKey:key];
        }
        free(propertys);
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    unsigned int count = 0;
    //获取所有属性
    objc_property_t *propertys = class_copyPropertyList([self class], &count);
    for (int i = 0; i < count; i++) {
        //查看属性
        const char *name = property_getName(propertys[i]);
        //归档
        NSString *key = [NSString stringWithUTF8String:name];
        id value = [self valueForKey:key];
        [aCoder encodeObject:value forKey:key];
    }
    free(propertys);
}

- (NSString *)description {
    NSString *string = [NSString stringWithFormat:@"\n%@:{\n", [self className]];
    
    unsigned int count = 0;
    //获取所有成员变量
    objc_property_t *propertys = class_copyPropertyList([self class], &count);
    for (int i = 0; i < count; i++) {
        //查看属性
        const char *name = property_getName(propertys[i]);
        NSString *key = [NSString stringWithUTF8String:name];
        id value = [self valueForKey:key];
        string = [string stringByAppendingString:[NSString stringWithFormat:@"  %@ = %@\n", key, value]];
    }
    string = [string stringByAppendingString:@"}\n"];
    return string;
}

@end
