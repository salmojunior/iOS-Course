//
//  ProgressView.m
//  iOSCourse
//
//  Created by Salmo Roberto da Silva Junior on 12/6/14.
//  Copyright (c) 2014 CIT. All rights reserved.
//

#import "ProgressView.h"

@interface ProgressView()

@property (strong, nonatomic) IBOutletCollection(UIProgressView) NSArray *progressViews;

@end

@implementation ProgressView

- (void)setupProgressViews
{
    CGAffineTransform transform = CGAffineTransformMakeScale(1.0f, 10.0f);
    
    for (UIProgressView *progressView in self.progressViews) {
        progressView.transform = transform;
        progressView.trackTintColor = [UIColor grayColor];
        progressView.progress = 0;
    }
}

- (void)cancelProgress:(UIProgressView *)progress
{
    progress.progress = 0;
    progress.trackTintColor = [UIColor redColor];
}

- (void)setprogress:(UIProgressView *)progress withInterval:(CGFloat)interval
{
    progress.progress = interval;
}

- (void)resetAllProgressViews
{
    for (UIProgressView *progressView in self.progressViews) {
        progressView.progress = 0;
        progressView.trackTintColor = [UIColor grayColor];
    }
}

@end
