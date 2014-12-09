//
//  Session.h
//  iOSCourse
//
//  Created by Salmo Roberto da Silva Junior on 12/6/14.
//  Copyright (c) 2014 CIT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

@interface Session : NSObject

@property (nonatomic, strong) Person *person;

+ (instancetype)sharedSession;

@end
