//
//  ProgressView.h
//  iOSCourse
//
//  Created by Salmo Roberto da Silva Junior on 12/6/14.
//  Copyright (c) 2014 CIT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProgressView : UIView

@property (weak, nonatomic) IBOutlet UIProgressView *progress1;
@property (weak, nonatomic) IBOutlet UIProgressView *progress2;
@property (weak, nonatomic) IBOutlet UIProgressView *progress3;
@property (weak, nonatomic) IBOutlet UIProgressView *progress4;

- (void)setupProgressViews;
- (void)cancelProgress:(UIProgressView *)progress;
- (void)setprogress:(UIProgressView *)progress withInterval:(CGFloat)interval;
- (void)resetAllProgressViews;

@end
