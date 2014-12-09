//
//  UtilsViewController.m
//  iOSCourse
//
//  Created by Salmo Roberto da Silva Junior on 11/28/14.
//  Copyright (c) 2014 CIT. All rights reserved.
//

#import "UtilsViewController.h"
#import "UtilsView.h"
#import "ProfileView.h"

@interface UtilsViewController () <ProfileDelegate>

@property (strong, nonatomic) IBOutlet UtilsView *mainView;

@end

@implementation UtilsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self setTitle:@"Utils"];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(testReceiveNotification:)
                                                 name:UIApplicationDidBecomeActiveNotification
                                               object:nil];
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.mainView setup];
    [self.mainView addImageProfile:self];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (UtilsView *)mainView
{
    UtilsView *mainView = (UtilsView *)self.view;
    
    return mainView;
}

- (void)testReceiveNotification:(NSNotification *)notification
{
    [self.mainView valueLabel:@""];
}

#pragma mark - Profile Delegate

- (void)profileDidSelected
{
    [self.mainView valueLabel:@"Profile was clicked!"];
}

@end
