//
//  YHCache.h
//
//  Created by 王亚辉 on 13/12/8.
//  Copyright (c) 2013年 王亚辉. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YHCache : NSObject

/**
 *  存储OC对象到沙盒
 */
+ (void)saveObject:(id)object forKey:(NSString *)key;

/** 
 *  根据key读取数据
 */
+ (id)readObjectForKey:(NSString *)key;

/** 
 *  根据key删除数据
 */
+ (void)deleteObjectForKey:(NSString *)key;

@end
