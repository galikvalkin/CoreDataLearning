//
//  DataController.m
//  CoreDataLearning
//
//  Created by Valentine Galkin on 6/24/19.
//  Copyright © 2019 Valentine Galkin. All rights reserved.
//

#import <CoreData/CoreData.h>
#import "DataController.h"

@implementation DataController

- (id)initWithCompletionBlock:(void (^)(void))callback;
{
    self = [super init];
    if (!self) return nil;
    
    self.persistentContainer = [[NSPersistentContainer alloc] initWithName:@"CoreDataLearning"];
    [self.persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *description, NSError *error) {
        if (error != nil) {
            NSLog(@"Failed to load Core Data stack: %@", error);
            abort();
        }
        callback();
    }];
    
    return self;
}

@end
