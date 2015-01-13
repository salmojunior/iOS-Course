//
//  Feed+Accessor.h
//  iOSCourse
//
//  Created by Salmo Roberto da Silva Junior on 1/9/15.
//  Copyright (c) 2015 CIT. All rights reserved.
//

#import "Feed.h"
#import "Person.h"

@interface Feed (Accessor)

+ (NSString *)entityName;
+ (instancetype)insertNewObjectInManagedObjectContext:(NSManagedObjectContext *)context;
+ (NSArray *)retrieveFeedsInManagedObjectContext:(NSManagedObjectContext *)context fromPerson:(Person *)person;

@end
