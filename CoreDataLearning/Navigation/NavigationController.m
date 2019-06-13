//
//  AppDelegate.m
//  CoreDataLearning
//
//  Created by Valentine Galkin on 10/16/18.
//  Copyright © 2018 Valentine Galkin. All rights reserved.
//

#import "NavigationController.h"

@interface NavigationController ()

@end

@implementation NavigationController


- (id)initWithRootViewController:(UIViewController *)rootViewController{
    self = [super initWithRootViewController:rootViewController];
    self.delegate = self;
    return self;
}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    NSString *className = NSStringFromClass([viewController class]);

    NSLog(@"didShowViewController %@", className);
}

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    NSString *className = NSStringFromClass([viewController class]);
    NSLog(@"willShowViewController %@", className);
}

@end
