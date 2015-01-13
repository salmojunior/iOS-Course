//
//  PersonService.h
//  iOSCourse
//
//  Created by Salmo Roberto da Silva Junior on 12/13/14.
//  Copyright (c) 2014 CIT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

@interface PersonService : NSObject

+ (void)feedFromPerson:(Person *)person withCompletionBlock:(void (^)(BOOL success, NSError *error))completion;

@end
