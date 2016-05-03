//
//  YHTimerView.m
//  Timer
//
//  Created by yahui.wang on 16/4/26.
//  Copyright © 2016年 yahui.wang. All rights reserved.
//

#import "YHTimerView.h"

#define TLWIDTH 18

@implementation YHTimerView
{
    UIView *bgView;
    NSTimer *timer;
    NSMutableArray *labels;
    NSDate *endDate;
}

- (instancetype)init {
    return [self initWithFrame:CGRectMake(0, 0, 100, 20)];
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setSubViews];
    }
    return self;
}

- (void)setSubViews {
    labels = [NSMutableArray array];
    
    bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, TLWIDTH*3+20, 20)];
    bgView.backgroundColor = clear_color;
    [self addSubview:bgView];
    
    for (int i = 0; i < 3; i++) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake((TLWIDTH+10)*i, 0, TLWIDTH, bgView.yhHeight)];
        label.textColor = black_color;
        label.font = H(13);
        label.backgroundColor = white_color;
        label.text = @"00";
        label.textAlignment = NSTextAlignmentCenter;
        label.layer.cornerRadius = 3;
        label.clipsToBounds = YES;
        [bgView addSubview:label];
        [labels addObject:label];
        
        if (i) {
            UILabel *dLabel = [[UILabel alloc] initWithFrame:CGRectMake(label.yhLeft-10, label.yhTop, 10, label.yhHeight)];
            dLabel.textColor = label.backgroundColor;
            dLabel.backgroundColor = clear_color;
            dLabel.font = HB(14);
            dLabel.text = @":";
            dLabel.textAlignment = NSTextAlignmentCenter;
            [bgView addSubview:dLabel];
        }
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    bgView.yhTop = (self.yhHeight-bgView.yhHeight)/2.0f;
    bgView.yhLeft = (self.yhWidth-bgView.yhWidth)/2.0f;
}

- (void)setTextColor:(UIColor *)textColor {
    for (UILabel *label in labels) {
        label.textColor = textColor;
    }
}

- (void)updateTimerLabels {
    NSTimeInterval timeDiff = [endDate timeIntervalSinceNow];
    
    if (timeDiff >= 0) {
        NSDate *date1970 = [NSDate dateWithTimeIntervalSince1970:timeDiff];
        if (labels.count >= 3) {
            [labels[0] setText:[self stringWithFormatter:@"HH" withDate:date1970]];
            [labels[1] setText:[self stringWithFormatter:@"mm" withDate:date1970]];
            [labels[2] setText:[self stringWithFormatter:@"ss" withDate:date1970]];
        }
    } else {
        [self stopTimer];
    }
}

- (NSString *)stringWithFormatter:(NSString *)formatter
                         withDate:(NSDate *)date {
    NSDateFormatter *fromat = [[NSDateFormatter alloc] init];
    [fromat setDateFormat:formatter];
    [fromat setTimeZone:[NSTimeZone timeZoneWithName:@"GMT"]];
    NSString *time = [fromat stringFromDate:date];
    return time;
}

- (void)setCountDownTime:(int)countDownTime {
    _countDownTime = countDownTime;
    
    endDate = [[NSDate date] dateByAddingTimeInterval:_countDownTime+1];
    timer = [NSTimer scheduledTimerWithTimeInterval:0.1
                                             target:self
                                           selector:@selector(updateTimerLabels)
                                           userInfo:nil
                                            repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    [timer fire];
}

- (void)stopTimer {
    [timer invalidate];
    timer = nil;
}

@end
