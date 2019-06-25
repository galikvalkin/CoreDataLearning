//
//  BaseController.m
//  CoreDataLearning
//
//  Created by Valentine Galkin on 6/25/19.
//  Copyright © 2019 Valentine Galkin. All rights reserved.
//

#import "BaseController.h"
#import "AppDelegate.h"

@implementation BaseController

@synthesize dataController = _dataController;

- (DataController *) dataController {
    @synchronized (self) {
        if (_dataController == nil) {
            AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
            DataController *dataController = appDelegate.dataContainer;
            _dataController = dataController;
        }
    }
    
    return _dataController;
}

@end
