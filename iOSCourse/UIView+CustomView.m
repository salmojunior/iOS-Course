//
//  UIView+CustomView.m
//  iOSCourse
//
//  Created by Salmo Roberto da Silva Junior on 11/29/14.
//  Copyright (c) 2014 CIT. All rights reserved.
//

#import "UIView+CustomView.h"

@implementation UIView (CustomView)

- (void)cornerRadius:(CGFloat)radius
{
    self.layer.cornerRadius = radius;
    [self.layer masksToBounds];
}

- (void)addBorder:(CGFloat)borderWidth withBorderColor:(UIColor *)borderColor
{
    self.layer.borderWidth = borderWidth;
    self.layer.borderColor = borderColor.CGColor;
}

@end
