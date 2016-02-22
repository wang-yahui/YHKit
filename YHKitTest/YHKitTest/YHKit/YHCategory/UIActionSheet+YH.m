//
//  UIActionSheet+YH.m
//
//  Created by yahui.wang on 15/11/23.
//  Copyright © 2015年 yahui.wang. All rights reserved.
//

#import "UIActionSheet+YH.h"

static DismissBlock  _dismissBlock;
static CancelBlock   _cancelBlock;

@implementation UIActionSheet (YH)

+ (void)showActionSheetWithTitle:(NSString *)title
               cancelButtonTitle:(NSString *)cancelButtonTitle
                otherButtonTitle:(NSArray *)otherButtons
                          inView:(UIView *)view
                       onDismiss:(DismissBlock)dismissed
                        onCancel:(CancelBlock)cancelled {
    _cancelBlock = [cancelled copy];
    _dismissBlock = [dismissed copy];
    
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:title
                                                       delegate:[self self]
                                              cancelButtonTitle:cancelButtonTitle
                                         destructiveButtonTitle:nil
                                              otherButtonTitles: nil];
    for (NSString *buttonTitle in otherButtons) {
        [sheet addButtonWithTitle:buttonTitle];
    }
    [sheet showInView:view];
}

+ (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == [actionSheet cancelButtonIndex]) {
        _cancelBlock();
    } else {
        _dismissBlock((int)buttonIndex - 1);
    }
}

@end
