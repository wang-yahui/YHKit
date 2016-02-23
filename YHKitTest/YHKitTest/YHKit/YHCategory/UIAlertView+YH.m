//
//  UIAlertView+YH.m
//
//  Created by yahui.wang on 15/11/23.
//  Copyright © 2015年 yahui.wang. All rights reserved.
//

#import "UIAlertView+YH.h"

static DismissBlock _dismissBlock;
static CancelBlock  _cancelBlock;
static ConfirmBlock _confirmBlock;

@implementation UIAlertView (YH)

+ (void)showAlertViewWithTitle:(NSString *)title
                       message:(NSString *)message
             cancelButtonTitle:(NSString *)cancelButtonTitle
             otherButtonTitles:(NSArray *)otherButtons
                     onDismiss:(DismissBlock)dismissed
                      onCancel:(CancelBlock)cancelled {
    _cancelBlock = [cancelled copy];
    _dismissBlock = [dismissed copy];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                    message:message
                                                   delegate:[self self]
                                          cancelButtonTitle:cancelButtonTitle
                                          otherButtonTitles:nil];
    for (NSString *buttonTitle in otherButtons) {
        [alert addButtonWithTitle:buttonTitle];
    }
    [alert show];
}

+ (void)showAlertViewWithTitle:(NSString *)title
                       message:(NSString *)message
             cancelButtonTitle:(NSString *)cancelButtonTitle
              otherButtonTitle:(NSString *)otherButtonTitle
                     onConfirm:(ConfirmBlock)confirmed
                      onCancel:(CancelBlock)cancelled {
    _confirmBlock = [confirmed copy];
    [self showAlertViewWithTitle:title
                         message:message
               cancelButtonTitle:cancelButtonTitle
               otherButtonTitles:otherButtonTitle? @[otherButtonTitle]: nil
                       onDismiss:^(int buttonIndex) {
                           if (confirmed) {
                               confirmed();
                           }
                       }
                        onCancel:cancelled];
}

+ (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    if (buttonIndex == [alertView cancelButtonIndex]) {
        if (_cancelBlock) {
            _cancelBlock();
        }
    } else {
        if (_dismissBlock) {
            _dismissBlock((int)buttonIndex - 1);
        }
    }
}

@end
