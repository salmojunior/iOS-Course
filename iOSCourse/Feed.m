//
//  Feed.m
//  iOSCourse
//
//  Created by Preto on 11/11/14.
//  Copyright (c) 2014 CIT. All rights reserved.
//

#import "Feed.h"

@implementation Feed

- (NSString *)description{
    NSString *descriptionFeed = [NSString stringWithFormat:@"Title: %@ - Description: %@", self.title, self.feedDescription];
    
    return descriptionFeed;
}

@end
