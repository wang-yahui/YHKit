//
//  YHMacro.h
//  YHKitTest
//
//  Created by yahui.wang on 16/2/23.
//  Copyright © 2016年 yahui.wang. All rights reserved.
//

#import <Foundation/Foundation.h>

//常用字体大小
#define H(size)             [UIFont systemFontOfSize:size]
#define HL(asize)           [UIFont fontWithName:@"Helvetica-Light" size:asize]
#define HB(size)            [UIFont boldSystemFontOfSize:size]

//屏幕的宽高
#define SCREENWIDTH         [UIScreen mainScreen].bounds.size.width
#define SCREENHEIGHT        [UIScreen mainScreen].bounds.size.height

//系统版本号
#define _SYSTEM_VERSION_    [[[UIDevice currentDevice] systemVersion] floatValue]
#define IOS(version)        (_SYSTEM_VERSION_ >= version)

//常用的
#define RGBCOLOR(r,g,b,a)   [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
#define IMAGE(image)        [UIImage imageNamed:image]
#define kUSERDEFAULTS       [NSUserDefaults standardUserDefaults]
#define kFILEMANAGER        [NSFileManager defaultManager]
#define __PSELF__           __weak typeof (self) pSelf = self
#define kYHWINDOW           [UIApplication sharedApplication].keyWindow