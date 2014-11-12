//
//  ModalViewController.m
//  iOSCourse
//
//  Created by Preto on 11/11/14.
//  Copyright (c) 2014 CIT. All rights reserved.
//

#import "ModalViewController.h"

@interface ModalViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *feedImageView;
@property (weak, nonatomic) IBOutlet UILabel *feedTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *feedDescriptionLabel;

@end

@implementation ModalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self populateFeed];
}

// Method to hide status bar
- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (void)populateFeed
{
    self.feedImageView.image = self.feed.feedImage;
    self.feedTitleLabel.text = self.feed.title;
    self.feedDescriptionLabel.text = self.feed.feedDescription;
}

- (IBAction)dismissModal:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
