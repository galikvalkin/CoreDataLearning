//
//  AppDelegate.m
//  CoreDataLearning
//
//  Created by Valentine Galkin on 10/16/18.
//  Copyright © 2018 Valentine Galkin. All rights reserved.
//

#import "TabBarController.h"

@interface TabBarController ()

@end

@implementation TabBarController
- (id)initWithControllerArray: (NSArray<UIViewController *> *)controllerList {
    
    UITabBarController *tabBar = [[UITabBarController alloc] initWithNibName:nil bundle:nil];
    
    self = tabBar;
    
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
