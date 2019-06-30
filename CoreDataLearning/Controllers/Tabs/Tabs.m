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
    
    [self setUsersHeader];
    
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
        BOOL saved = [addUser save];
        if (saved) {
            [self setUsersHeader];
            [self setSelectedIndex:0];
        }
        
    }
}

- (void)setUsersHeader {
    self.navigationItem.title = @"Users";
    self.navigationItem.rightBarButtonItem = nil;
}

- (void)setAddUserHeader {
    self.navigationItem.title = @"Add User";
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"Save" style:UIBarButtonItemStylePlain target:self action:@selector(save)];
    self.navigationItem.rightBarButtonItem = rightButton;
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    NSUInteger indexOfTab = [[tabBar items] indexOfObject:item];
    
    int index = (int)indexOfTab;
    if (index == 0) {
        [self setUsersHeader];
    } else if (index == 1) {
        [self setAddUserHeader];
    }
}

@end
