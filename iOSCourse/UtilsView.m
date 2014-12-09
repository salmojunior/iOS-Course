//
//  UtilsView.m
//  iOSCourse
//
//  Created by Salmo Roberto da Silva Junior on 11/28/14.
//  Copyright (c) 2014 CIT. All rights reserved.
//

#import "UtilsView.h"
#import "ProfileView.h"
#import "UIView+CustomView.h"

@interface UtilsView()

@property (weak, nonatomic) IBOutlet UILabel *resultLabel;

@end

@implementation UtilsView

- (void)setup
{
    self.backgroundColor = [UIColor redColor];
}

-(void) addImageProfile:(id<ProfileDelegate>)delegate
{
    CGFloat x = (self.frame.size.width / 2) - 50;
    CGFloat y = (self.frame.size.height / 2) - 50;
    
    CGRect frame = CGRectMake(x, y, 100.0f, 100.0f);
    ProfileView *profileView = [[ProfileView alloc] initWithFrame:frame];
    
    profileView.delegate = delegate;
    
    [profileView cornerRadius:50];
    [profileView addBorder:3.0f withBorderColor:[UIColor lightGrayColor]];
    [self addSubview:profileView];
}

-(void)valueLabel:(NSString *)texto
{
    self.resultLabel.text = texto;
}

@end

