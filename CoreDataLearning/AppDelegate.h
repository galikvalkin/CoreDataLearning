//
//  AppDelegate.h
//  CoreDataLearning
//
//  Created by Valentine Galkin on 10/16/18.
//  Copyright © 2018 Valentine Galkin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "Data/DataController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong) DataController *dataContainer;

@property (strong, nonatomic) UINavigationController *navigationController;

@end

