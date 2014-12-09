//
//  Session.m
//  iOSCourse
//
//  Created by Salmo Roberto da Silva Junior on 12/6/14.
//  Copyright (c) 2014 CIT. All rights reserved.
//

#import "Session.h"

@implementation Session

+ (instancetype)sharedSession
{
    static id sharedInstance;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        sharedInstance = [[Session alloc] init];
    });
    
    return sharedInstance;
}

@end
