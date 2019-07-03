//
//  DataController.m
//  CoreDataLearning
//
//  Created by Valentine Galkin on 6/24/19.
//  Copyright © 2019 Valentine Galkin. All rights reserved.
//

#import <CoreData/CoreData.h>
#import "DataController.h"
#import "UserMO.h"

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


- (void)addUser:(NSDictionary *)data {
    if (self.persistentContainer != nil) {
        NSManagedObjectContext *context = self.persistentContainer.viewContext;
        NSManagedObject *entity = [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:context];
        
        for (NSString *key in data) {
            id value = data[key];
            [entity setValue:value forKey:key];
        }
        
        [self saveContext];
    }
}

- (void)updateUser:(NSManagedObject *)user data:(NSDictionary *)data {
    if (self.persistentContainer != nil) {
        for (NSString *key in data) {
            id value = data[key];
            [user setValue:value forKey:key];
        }
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
    
    NSMutableArray *parsed = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < [results count]; i++) {
        [parsed addObject:(UserMO *)results[i]];
    }
    
    return parsed;
}

- (void)deleteUserList {
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"User"];
    NSBatchDeleteRequest *deleteRequest = [[NSBatchDeleteRequest alloc] initWithFetchRequest:request];
    
    [context executeRequest:deleteRequest error:nil];
    [self saveContext];
}

- (void)deleteUser:(NSManagedObject *)user {
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    [context deleteObject:user];
    [self saveContext];
}


- (NSManagedObjectContext *)getContext {
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    return context;
}

@end
