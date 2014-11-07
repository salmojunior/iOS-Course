//
//  HomeViewController.m
//  iOSCourse
//
//  Created by Preto on 06/11/14.
//  Copyright (c) 2014 CIT. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()
@property (weak, nonatomic) IBOutlet UILabel *welcomeLabel;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self setTitle:@"Home"];
    
    if (self.person != nil) {
        self.welcomeLabel.text = [NSString stringWithFormat:@"Welcome %@!", self.person.firstName];
    }
}

@end
