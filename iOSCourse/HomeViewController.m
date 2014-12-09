//
//  HomeViewController.m
//  iOSCourse
//
//  Created by Preto on 06/11/14.
//  Copyright (c) 2014 CIT. All rights reserved.
//

#import "HomeViewController.h"
#import "FeedViewController.h"
#import "UtilsViewController.h"
#import "Session.h"
#import "ProgressViewController.h"

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
    } else {
        Session *session = [Session sharedSession];
        self.person = session.person;
        
        self.welcomeLabel.text = [NSString stringWithFormat:@"Welcome %@!", self.person.firstName];
    }
}

- (IBAction)feed:(id)sender {
    FeedViewController *feedViewController = [[FeedViewController alloc] initWithNibName:@"FeedViewController" bundle:nil];
    feedViewController.person = self.person;
    
    [self.navigationController pushViewController:feedViewController animated:YES];
}

- (IBAction)utils:(id)sender {
    UtilsViewController *utilsViewController = [[UtilsViewController alloc] init];
    [self.navigationController pushViewController:utilsViewController animated:YES];
}

- (IBAction)progress:(id)sender {
    ProgressViewController *progressViewController = [[ProgressViewController alloc] init];
    [self.navigationController pushViewController:progressViewController animated:YES];
}

@end
