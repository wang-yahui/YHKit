//
//  YHTimerView.h
//  Timer
//
//  Created by yahui.wang on 16/4/26.
//  Copyright © 2016年 yahui.wang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YHKit.h"

@interface YHTimerView : UIView

@property (nonatomic, strong) UIColor *textColor;

/**
 *  倒计时的秒数
 *  赋值即开始计时
 *  计时结束自动停止
 */
@property (nonatomic, assign) int countDownTime;

/**
 *  手动停止计时
 */
- (void)stopTimer;

@end
