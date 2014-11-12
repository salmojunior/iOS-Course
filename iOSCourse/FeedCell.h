//
//  FeedCell.h
//  iOSCourse
//
//  Created by Preto on 07/11/14.
//  Copyright (c) 2014 CIT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Feed.h"

@interface FeedCell : UITableViewCell

- (void)populateCellFromFeed:(Feed *)feed;

@end
