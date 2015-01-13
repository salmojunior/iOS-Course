//
//  Feed+Accessor.m
//  iOSCourse
//
//  Created by Salmo Roberto da Silva Junior on 1/9/15.
//  Copyright (c) 2015 CIT. All rights reserved.
//

#import "Feed+Accessor.h"

@implementation Feed (Accessor)

+ (NSString *)entityName
{
    NSString *name = @"Feed";
    
    return name;
}

+ (instancetype)insertNewObjectInManagedObjectContext:(NSManagedObjectContext *)context
{
    return [NSEntityDescription insertNewObjectForEntityForName:[Feed entityName] inManagedObjectContext:context];
}

+ (NSArray *)retrieveFeedsInManagedObjectContext:(NSManagedObjectContext *)context fromPerson:(Person *)person
{
    NSArray *result;
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:[Feed entityName] inManagedObjectContext:context];
    [fetchRequest setEntity:entityDescription];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"whoPost == %@", person];
    [fetchRequest setPredicate:predicate];
    
    NSError *error = nil;
    result = [context executeFetchRequest:fetchRequest error:&error];
    
    return result;
}

@end
