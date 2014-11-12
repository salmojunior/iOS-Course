//
//  Feed.h
//  iOSCourse
//
//  Created by Preto on 11/11/14.
//  Copyright (c) 2014 CIT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Feed : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *feedDescription;
@property (nonatomic, strong) UIImage *feedImage;

@end
