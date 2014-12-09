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

@interface FeedViewController ()<UITableViewDelegate, UITableViewDataSource, UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *feedTableView;
@end

@implementation FeedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self setTitle:@"Feed"];
    
    UINib *nib = [UINib nibWithNibName:@"FeedCell" bundle:nil];
    [self.feedTableView registerNib:nib forCellReuseIdentifier:cellIdentifier];
    
   __block int test = 10;
    
    void (^testBlock)(void) = ^{
        NSLog(@"test dentro do Block= %d", test);
    };
    
    test = 20;
    
    testBlock();
    
    NSLog(@"Fora do block: %d", test);
}

- (void)viewDidAppear:(BOOL)animated
{
    [self doSomethingWithBlock:^(NSInteger value) {
        NSLog(@"Result block: %ld", value);
    }];
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

#pragma mark - methods with blocks

- (void)doSomethingWithBlock:(void (^)(NSInteger value))completionBlock
{
    NSLog(@"Block");
    
    NSInteger value = 10;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
       
       [NSThread sleepForTimeInterval:5.0];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"Finish!!" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
            [alertView show];
            
        });
    });
    
    completionBlock(value);
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"Foi clicado!!");
}

@end
