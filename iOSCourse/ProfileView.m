//
//  ProfileView.m
//  iOSCourse
//
//  Created by Salmo Roberto da Silva Junior on 11/29/14.
//  Copyright (c) 2014 CIT. All rights reserved.
//

#import "ProfileView.h"

@implementation ProfileView

- (instancetype)initWithFrame:(CGRect)frame
{
    //self = [super init];
    if(self) {
        self = [[[NSBundle mainBundle] loadNibNamed:@"ProfileView" owner:nil options:nil] lastObject];
        self.frame = frame;
    }
    return self;
}

- (IBAction)touchProfile:(id)sender {
    if ([self.delegate respondsToSelector:@selector(profileDidSelected)]) {
        [self.delegate profileDidSelected];
    }
}

@end
