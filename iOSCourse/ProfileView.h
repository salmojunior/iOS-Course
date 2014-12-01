//
//  ProfileView.h
//  iOSCourse
//
//  Created by Salmo Roberto da Silva Junior on 11/29/14.
//  Copyright (c) 2014 CIT. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ProfileDelegate <NSObject>

- (void) profileDidSelected;

@end

@interface ProfileView : UIView

@property (assign, nonatomic) id<ProfileDelegate> delegate;
@end
