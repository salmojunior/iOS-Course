//
//  UIView+CustomView.h
//  iOSCourse
//
//  Created by Salmo Roberto da Silva Junior on 11/29/14.
//  Copyright (c) 2014 CIT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (CustomView)

- (void)cornerRadius:(CGFloat)radius;
- (void)addBorder:(CGFloat)borderWidth withBorderColor:(UIColor*)borderColor;

@end
