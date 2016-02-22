//
//  UIActionSheet+YH.h
//
//  Created by yahui.wang on 15/11/23.
//  Copyright © 2015年 yahui.wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIActionSheet (YH)

typedef void (^DismissBlock)(int buttonIndex);
typedef void (^CancelBlock)();

/**
 *  block形式的UIActionSheet
 */
+ (void)showActionSheetWithTitle:(NSString *)title
               cancelButtonTitle:(NSString *)cancelButtonTitle
                otherButtonTitle:(NSArray *)otherButtons
                          inView:(UIView *)view
                       onDismiss:(DismissBlock)dismissed
                        onCancel:(CancelBlock)cancelled;

@end
