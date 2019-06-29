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
    NSLog(@"initWithRootViewController");
    [self setAppearence];
    self.delegate = self;
    return self;
}

- (void) setAppearence {
    NSDictionary *titleTextAttributes = [
                                         NSDictionary dictionaryWithObjectsAndKeys:
                                         [UIFont fontWithName:@"Montserrat-Regular" size: 18.0],
                                         NSFontAttributeName,
                                         nil];
    [[UIBarButtonItem appearance] setTitleTextAttributes:titleTextAttributes forState:UIControlStateNormal];
    [[UIBarButtonItem appearance] setTitleTextAttributes:titleTextAttributes forState:UIControlStateHighlighted ];
    [[UINavigationBar appearance] setTitleTextAttributes: titleTextAttributes];
}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    NSString *className = NSStringFromClass([viewController class]);

    NSLog(@"didShowViewController %@", className);
}

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    NSString *className = NSStringFromClass([viewController class]);
    
    [self setNavigationBarHidden:[className isEqualToString:@"WelcomeController"] animated:YES];
    NSLog(@"willShowViewController %@", className);
}

@end
