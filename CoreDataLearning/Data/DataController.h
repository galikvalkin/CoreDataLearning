//
//  DataController.m
//  CoreDataLearning
//
//  Created by Valentine Galkin on 6/24/19.
//  Copyright © 2019 Valentine Galkin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface DataController : NSObject

@property (strong, nonatomic) NSPersistentContainer *persistentContainer;

- (id)init:(void (^)(void))callback;

- (NSArray *)userList;

- (void)addUser:(NSDictionary *)data;

- (void)updateUser:(NSManagedObject *)user data:(NSDictionary *)data;

- (void)saveContext;

- (void)deleteUserList;

- (void)deleteUser:(NSManagedObject *)user;

- (NSManagedObjectContext *)getContext;

@end
