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

- (id)init:(void (^)(void))callback {
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

- (void)addUser:(NSString *)name {
    if (self.persistentContainer != nil) {
        NSManagedObjectContext *context = self.persistentContainer.viewContext;
        NSManagedObject *entity = [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:context];
        [entity setValue:name forKey:@"name"];
        [self saveContext];
    }
}

- (void)saveContext {
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSError *error = nil;
    if ([context hasChanges] && ![context save:&error]) {
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}

- (NSArray *)userList {
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSFetchRequest *requestFromLocation = [NSFetchRequest fetchRequestWithEntityName:@"User"];
    
    NSArray *results = [context executeFetchRequest:requestFromLocation error:nil];
    
    return results;
}

@end
