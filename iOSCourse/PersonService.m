//
//  PersonService.m
//  iOSCourse
//
//  Created by Salmo Roberto da Silva Junior on 12/13/14.
//  Copyright (c) 2014 CIT. All rights reserved.
//

#import "PersonService.h"

@implementation PersonService

+ (void)feedFromPerson:(Person *)person withCompletionBlock:(void (^)(Person *, NSError *))completion
{
    NSURL *url = [[NSURL alloc] initWithString:@"http://private-18ed9-cursoposts.apiary-mock.com/notes"];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    [request setHTTPMethod:@"GET"];
    [request setTimeoutInterval:10.0];
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        if (!error) {
            NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
            
            if (httpResponse.statusCode == 200) {
                
                NSError *jsonError;
                NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&jsonError];
                
                if (!jsonError) {
                    [person parseFeedFromArray:jsonDic];
                }
            }
        }
        
        completion(person, error);
    }];
    
    [dataTask resume];
    
}

@end
