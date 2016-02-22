//
//  UIView+YH.h
//
//  Created by yahui.wang on 15/11/23.
//  Copyright © 2015年 yahui.wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (YH)

/**
 *  view的起点
 */
@property CGPoint yhOrigin;

/**
 *  view的size
 */
@property CGSize yhSize;

/**
 *  view的高度
 */
@property CGFloat yhHeight;

/**
 *  view的宽度
 */
@property CGFloat yhWidth;

/**
 *  view的顶部
 */
@property CGFloat yhTop;

/**
 *  view的左边
 */
@property CGFloat yhLeft;

/**
 *  view的底部
 */
@property CGFloat yhBottom;

/**
 *  view的右边
 */
@property CGFloat yhRight;

/**
 *  view所在的viewController
 */
@property (nonatomic, readonly) UIViewController *viewController;

/**
 *  当前view的截图
 */
- (UIImage *)snapshotImage;

@end
