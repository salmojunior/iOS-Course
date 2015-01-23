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
    
    UIPanGestureRecognizer *tapGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleGesture:)];
    
    [self.mainView addGestureRecognizer:tapGesture];
}

- (void)handleGesture:(UIPanGestureRecognizer *)panGesture
{
    CGPoint location = [panGesture locationInView:self.mainView];
    
    if (panGesture.state == UIGestureRecognizerStateBegan)
    {
        [self.mainView updateProfilePosition:location];
    }
    else if (panGesture.state == UIGestureRecognizerStateBegan || panGesture.state == UIGestureRecognizerStateChanged)
    {
        CGPoint translation = [(UIPanGestureRecognizer *)panGesture translationInView:self.mainView];
        CGPoint newLocation = CGPointMake(location.x+translation.x, location.y+translation.y);
        
        [self.mainView updateProfilePosition:newLocation];
    }
    else if (panGesture.state == UIGestureRecognizerStateEnded)
    {
        //Do what you want
    }
}

//- (void) handleGesture: (UITapGestureRecognizer *) tapGesture {
//    
//    CGPoint location = [tapGesture locationInView:self.mainView];
//    
//    [self.mainView updateProfilePosition:location];
//    
//}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.mainView setup];
    [self.mainView addImageProfile:self];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
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
