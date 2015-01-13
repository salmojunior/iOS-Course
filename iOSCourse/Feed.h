//
//  Feed.h
//  iOSCourse
//
//  Created by Salmo Roberto da Silva Junior on 1/13/15.
//  Copyright (c) 2015 CIT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Feed : NSManagedObject

@property (nonatomic, retain) NSString * feedDescription;
@property (nonatomic, retain) NSString * feedImage;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSManagedObject *whoPost;

@end
