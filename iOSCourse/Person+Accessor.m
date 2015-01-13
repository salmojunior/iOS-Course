//
//  Person+Accessor.m
//  iOSCourse
//
//  Created by Salmo Roberto da Silva Junior on 1/9/15.
//  Copyright (c) 2015 CIT. All rights reserved.
//

#import "Person+Accessor.h"
#import "Feed.h"
#import "Feed+Accessor.h"
#import "AppDelegate.h"

@implementation Person (Accessor)

+ (NSString *)entityName
{
    NSString *name = @"Person";
    
    return name;
}

+ (instancetype)insertNewObjectInManagedObjectContext:(NSManagedObjectContext *)context withName:(NSString *)firstName andLastName:(NSString *)lastName
{
    Person *person;
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:[Person entityName] inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    // Specify criteria for filtering which objects to fetch
    NSPredicate *predicate1 = [NSPredicate predicateWithFormat:@"lastName == %@", lastName];
    NSPredicate *predicate2 = [NSPredicate predicateWithFormat:@"firstName == %@", firstName];
    
    NSCompoundPredicate *predicate = [NSCompoundPredicate orPredicateWithSubpredicates:@[predicate1, predicate2]];
    
    [fetchRequest setPredicate:predicate];
    
    NSError *error = nil;
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    
    if (fetchedObjects == nil) {
        NSLog(@"Error %@", error.description);
    } else {
        if (fetchedObjects.count == 0) {
            person = [NSEntityDescription insertNewObjectForEntityForName:[Person entityName] inManagedObjectContext:context];
            person.firstName = firstName;
            person.lastName = lastName;
        } else {
            person = [fetchedObjects lastObject];
        }
    }
    
    return person;
}

- (void)parseFeedFromArray:(NSDictionary *)jsonDic
{
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    
    for (NSDictionary *dic in jsonDic) {
        Feed *feed = [Feed insertNewObjectInManagedObjectContext:appDelegate.managedObjectContext];
        
        feed.title = dic[@"feedTitle"];
        feed.feedDescription = dic[@"feedDescription"];
        feed.feedImage = dic[@"feedImage"];
        feed.whoPost = self;
    }
    
    [appDelegate.managedObjectContext save:nil];
}

@end
