//
//  Person.m
//  iOSCourse
//
//  Created by Preto on 06/11/14.
//  Copyright (c) 2014 CIT. All rights reserved.
//

#import "Person.h"

@implementation Person

- (instancetype)initWithFirstName:(NSString *)firstName withLastName:(NSString *)lastName
{
    self = [super init];
    if (self) {
        self.firstName = firstName;
        self.lastName = lastName;
    }
    
    return self;
}

@end
