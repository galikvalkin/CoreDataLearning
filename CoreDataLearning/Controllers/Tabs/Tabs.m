//
//  Tabs.m
//  CoreDataLearning
//
//  Created by Valentine Galkin on 6/30/19.
//  Copyright © 2019 Valentine Galkin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Tabs.h"
#import "UserList.h"
#import "AddUser.h"

@interface TabsController()

@end


@implementation TabsController


- (void)viewDidLoad {
    NSLog(@"TabsController now used");
    self.delegate = self;
    
//    UITabBarController *tabBar = (UITabBarController *) self.window.rootViewController;
//    [tabBar setDelegate:self];
    
    self.navigationItem.title = @"Users";
    
    UserListConroller *userListController = (UserListConroller *)[self setController:@"UserList" and:@"UserList"];
    UITabBarItem *userListTabbarItem = [[UITabBarItem alloc] initWithTitle:@"Users" image:nil tag:0];
    userListController.tabBarItem = userListTabbarItem;
    
    AddUserController *addUserController = (AddUserController *)[self setController:@"AddUser" and:@"AddUser"];
    UITabBarItem *addUserTabbarItem = [[UITabBarItem alloc] initWithTitle:@"Add User" image:nil tag:1];
    addUserController.tabBarItem = addUserTabbarItem;
    
    
    self.viewControllers = @[userListController, addUserController];
}

- (UIViewController *)setController:(NSString *)storyboardName and:(NSString *)controllerName {
    return [[UIStoryboard storyboardWithName:storyboardName bundle:nil] instantiateViewControllerWithIdentifier:controllerName];
}

- (void)save{
    UIViewController *selectedController =  self.viewControllers[1];
    
    if ([selectedController class] == [AddUserController class]) {
        AddUserController *addUser = (AddUserController *)selectedController;
        [addUser save];
        [self setSelectedIndex:0];
    }
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    NSUInteger indexOfTab = [[tabBar items] indexOfObject:item];
    
    NSLog(@"Tab index = %u", (int)indexOfTab);
    if ((int)indexOfTab == 0) {
        self.navigationItem.title = @"Users";
    } else if ((int)indexOfTab == 1) {
        self.navigationItem.title = @"Add User";
        UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"Save" style:UIBarButtonItemStylePlain target:self action:@selector(save)];
        self.navigationItem.rightBarButtonItem = rightButton;
    }
    NSLog(@"tab changed");
}

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    return YES;
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    NSLog(@"tab changed - 2");
}

@end
