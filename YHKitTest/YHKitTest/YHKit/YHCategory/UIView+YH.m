//
//  UIView+YH.m
//
//  Created by yahui.wang on 15/11/23.
//  Copyright © 2015年 yahui.wang. All rights reserved.
//

#import "UIView+YH.h"

@implementation UIView (YH)

#pragma mark - getter

- (CGPoint)yhOrigin {
    return self.frame.origin;
}

- (CGSize)yhSize {
    return self.frame.size;
}

- (CGFloat)yhHeight {
    return self.frame.size.height;
}

- (CGFloat)yhWidth {
    return self.frame.size.width;
}

- (CGFloat)yhTop {
    return self.frame.origin.y;
}

- (CGFloat)yhBottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (CGFloat)yhLeft {
    return self.frame.origin.x;
}

- (CGFloat)yhRight {
    return self.frame.origin.x + self.frame.size.width;
}

#pragma mark - setter

- (void)setYhOrigin:(CGPoint)yhOrigin {
    CGRect newframe = self.frame;
    newframe.origin = yhOrigin;
    self.frame = newframe;
}

- (void)setYhSize:(CGSize)yhSize {
    CGRect newframe = self.frame;
    newframe.size = yhSize;
    self.frame = newframe;
}

- (void)setYhHeight:(CGFloat)yhHeight {
    CGRect newframe = self.frame;
    newframe.size.height = yhHeight;
    self.frame = newframe;
}

- (void)setYhWidth:(CGFloat)yhWidth {
    CGRect newframe = self.frame;
    newframe.size.width = yhWidth;
    self.frame = newframe;
}

- (void)setYhTop:(CGFloat)yhTop {
    CGRect newframe = self.frame;
    newframe.origin.y = yhTop;
    self.frame = newframe;
}

- (void)setYhLeft:(CGFloat)yhLeft {
    CGRect newframe = self.frame;
    newframe.origin.x = yhLeft;
    self.frame = newframe;
}

- (void)setYhBottom:(CGFloat)yhBottom {
    CGRect newframe = self.frame;
    newframe.origin.y = yhBottom - self.frame.size.height;
    self.frame = newframe;
}

- (void)setYhRight:(CGFloat)yhRight {
    CGFloat delta = yhRight - (self.frame.origin.x + self.frame.size.width);
    CGRect newframe = self.frame;
    newframe.origin.x += delta ;
    self.frame = newframe;
}

- (UIViewController *)viewController {
    for (UIView *view = self; view; view = view.superview) {
        UIResponder *nextResponder = [view nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}

- (UIImage *)snapshotImage {
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.opaque, 0);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *snap = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return snap;
}

@end
