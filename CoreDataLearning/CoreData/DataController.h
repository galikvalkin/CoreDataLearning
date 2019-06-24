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

- (id)initWithCompletionBlock:(void (^)(void))callback;

@end
