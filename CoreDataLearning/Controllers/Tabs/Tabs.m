//
//  Tabs.m
//  CoreDataLearning
//
//  Created by Valentine Galkin on 6/30/19.
//  Copyright © 2019 Valentine Galkin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Tabs.h"

@interface TabsController()

@end


@implementation TabsController

- (void)viewDidLoad {
    NSLog(@"TabsController now used");
    self.navigationItem.title = @"Home";
    [self setSelectedIndex:1];
    
    

    
}

@end
