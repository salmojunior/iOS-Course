//
//  Person.h
//  iOSCourse
//
//  Created by Preto on 06/11/14.
//  Copyright (c) 2014 CIT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (nonatomic, strong) NSString *firstName;
@property (nonatomic, strong) NSString *lastName;
@property (nonatomic, strong) NSArray *feeds;

- (instancetype)initWithFirstName:(NSString *)firstName withLastName:(NSString *)lastName;

@end
