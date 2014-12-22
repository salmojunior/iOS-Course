//
//  Person.m
//  iOSCourse
//
//  Created by Preto on 06/11/14.
//  Copyright (c) 2014 CIT. All rights reserved.
//

#import "Person.h"
#import "Feed.h"

@implementation Person

- (instancetype)initWithFirstName:(NSString *)firstName withLastName:(NSString *)lastName
{
    self = [super init];
    if (self) {
        self.firstName = firstName;
        self.lastName = lastName;
//        self.feeds = [self mockFeed];
    }
    
    return self;
}

//- (NSArray *)mockFeed{
//    NSMutableArray *feeds = [[NSMutableArray alloc] init];
//    
//    for (int i = 0; i < 6; i++) {
//        Feed *feed = [[Feed alloc] init];
//        
//        feed.title = [NSString stringWithFormat:@"Title %d", i];
//        feed.feedDescription = [NSString stringWithFormat:@"Description %d", i];
//        feed.feedImage = [UIImage imageNamed:@"feed"];
//        
//        [feeds addObject:feed];
//    }
//    
//    return feeds;
//}

- (void)parseFeedFromArray:(NSDictionary *)jsonDic
{
    NSMutableArray *tempFeeds = [NSMutableArray new];
    
    for (NSDictionary *dic in jsonDic) {
        Feed *feed = [[Feed alloc] init];
        
        feed.title = dic[@"feedTitle"];
        feed.feedDescription = dic[@"feedDescription"];
        
        NSURL *imageURL = [NSURL URLWithString:dic[@"feedImage"]];
        NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
        
        UIImage *feedImage = [UIImage imageWithData:imageData];
        
        if (feedImage == nil) {
            feedImage = [UIImage imageNamed:@"defaultFeed"];
        }
        
        feed.feedImage = feedImage;
        
        [tempFeeds addObject:feed];
    }
    
    self.feeds = tempFeeds;
}

@end
