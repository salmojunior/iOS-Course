//
//  FeedViewController.m
//  iOSCourse
//
//  Created by Preto on 07/11/14.
//  Copyright (c) 2014 CIT. All rights reserved.
//

#import "FeedViewController.h"
#import "FeedCell.h"
#import "ModalViewController.h"

#define cellIdentifier @"cell"

@interface FeedViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *feedTableView;
@end

@implementation FeedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self setTitle:@"Feed"];
    
    UINib *nib = [UINib nibWithNibName:@"FeedCell" bundle:nil];
    [self.feedTableView registerNib:nib forCellReuseIdentifier:cellIdentifier];
}

#pragma mark - UITableView Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.person.feeds.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FeedCell *cell =(FeedCell *) [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];

    Feed *feed = self.person.feeds[indexPath.row];
    [cell populateCellFromFeed:feed];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Feed *feed = self.person.feeds[indexPath.row];
    
    ModalViewController *modalViewController = [[ModalViewController alloc] init];
    modalViewController.feed = feed;
    
    [self presentViewController:modalViewController animated:YES completion:nil];
}

@end
