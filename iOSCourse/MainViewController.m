//
//  MainViewController.m
//  iOSCourse
//
//  Created by Salmo Roberto da Silva Junior on 1/17/15.
//  Copyright (c) 2015 CIT. All rights reserved.
//

#import "MainViewController.h"
#import "FirstViewController.h"

@interface MainViewController ()

@property (nonatomic,strong) UINavigationController *mainNavigationController;
@property(assign,nonatomic) BOOL isMenuOpen;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    FirstViewController *firstViewController = [[FirstViewController alloc] initWithNibName:@"FirstViewController" bundle:nil];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:firstViewController];
    
    self.mainNavigationController = navigationController;
    
    CGRect rect = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    self.mainNavigationController.view.frame = rect;
    
    [self.view addSubview:self.mainNavigationController.view];
    [self addChildViewController:self.mainNavigationController];
    
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(handleMenu:)];
    firstViewController.navigationItem.leftBarButtonItem = barButton;
}

- (void) handleMenu:(UIBarButtonItem *) barButton {
    
     __block CGRect cgRect = self.mainNavigationController.view.frame;
    
    if(self.isMenuOpen)
    {
        self.isMenuOpen = NO;
        
        [UIView animateWithDuration:0.3 animations:^{
            cgRect.origin.x = 0.0f;
            self.mainNavigationController.view.frame = cgRect;
        }];
    }
    else
    {
        self.isMenuOpen = YES;
        
        [UIView animateWithDuration:0.3 animations:^{
            cgRect.origin.x = 200.0f;
            self.mainNavigationController.view.frame = cgRect;
        }];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
