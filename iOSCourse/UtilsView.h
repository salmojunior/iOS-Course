//
//  UtilsView.h
//  iOSCourse
//
//  Created by Salmo Roberto da Silva Junior on 11/28/14.
//  Copyright (c) 2014 CIT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProfileView.h"

@interface UtilsView : UIView

- (void)setup;
- (void)addImageProfile:(id<ProfileDelegate>)delegate;
- (void)valueLabel:(NSString*)texto;
- (void)updateProfilePosition:(CGPoint)position;

@end
