//
//  YHCache.m
//
//  Created by 王亚辉 on 13/12/8.
//  Copyright (c) 2013年 王亚辉. All rights reserved.
//

#import "YHCache.h"

@implementation YHCache

+ (void)saveObject:(id)object forKey:(NSString *)key {
    if (!object) return;
    NSString *path = [self getPath:key];
    [NSKeyedArchiver archiveRootObject:object toFile:path];
}

+ (id)readObjectForKey:(NSString *)key {
    NSString *path = [self getPath:key];
    return [NSKeyedUnarchiver unarchiveObjectWithFile:path];
}

+ (void)deleteObjectForKey:(NSString *)key {
    NSString *path = [self getPath:key];
    if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
        [[NSFileManager defaultManager] removeItemAtPath:path error:nil];
    }
}

+ (NSString *)getPath:(NSString *)key {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachePath = [paths objectAtIndex:0];
    cachePath = [cachePath stringByAppendingPathComponent:@"YHCache"];
    
    BOOL isDir;
    if (![[NSFileManager defaultManager] fileExistsAtPath:cachePath isDirectory:&isDir]) {
        [[NSFileManager defaultManager] createDirectoryAtPath:cachePath
                                  withIntermediateDirectories:YES
                                                   attributes:nil
                                                        error:nil];
    }
    NSString *filePath = [cachePath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@", key]];
    return filePath;
}

@end
