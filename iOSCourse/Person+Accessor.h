//
//  Person+Accessor.h
//  iOSCourse
//
//  Created by Salmo Roberto da Silva Junior on 1/9/15.
//  Copyright (c) 2015 CIT. All rights reserved.
//

#import "Person.h"

@interface Person (Accessor)

+ (NSString *)entityName;

+ (instancetype)insertNewObjectInManagedObjectContext:(NSManagedObjectContext *)context withName:(NSString *)firstName andLastName:(NSString *)lastName;

- (void)parseFeedFromArray:(NSDictionary *)jsonDic;

@end
