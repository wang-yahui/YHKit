//
//  UIAlertView+YH.h
//
//  Created by yahui.wang on 15/11/23.
//  Copyright © 2015年 yahui.wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertView (YH)

typedef void (^DismissBlock)(int buttonIndex);
typedef void (^ConfirmBlock)();
typedef void (^CancelBlock)();

/**
 *  block形式的UIAlertView -两个以上按钮
 */
+ (void)showAlertViewWithTitle:(NSString *)title
                       message:(NSString *)message
             cancelButtonTitle:(NSString *)cancelButtonTitle
             otherButtonTitles:(NSArray *)otherButtons
                     onDismiss:(DismissBlock)dismissed
                      onCancel:(CancelBlock)cancelled;

/**
 *  block形式的UIAlertView -两个按钮
 */
+ (void)showAlertViewWithTitle:(NSString *)title
                       message:(NSString *)message
             cancelButtonTitle:(NSString *)cancelButtonTitle
              otherButtonTitle:(NSString *)otherButtonTitle
                     onConfirm:(ConfirmBlock)confirmed
                      onCancel:(CancelBlock)cancelled;

@end
