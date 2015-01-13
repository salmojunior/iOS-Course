//
//  FeedCell.m
//  iOSCourse
//
//  Created by Preto on 07/11/14.
//  Copyright (c) 2014 CIT. All rights reserved.
//

#import "FeedCell.h"

@interface FeedCell()
@property (weak, nonatomic) IBOutlet UIImageView *feedImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;

@end

@implementation FeedCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)populateCellFromFeed:(Feed *)feed
{
    self.titleLabel.text = feed.title;
    self.descriptionLabel.text = feed.feedDescription;
    NSData  *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:feed.feedImage]];
    self.feedImageView.image = [UIImage imageWithData:imageData];
}

@end
