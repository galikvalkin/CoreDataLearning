//
//  WelcomeController.m
//  CoreDataLearning
//
//  Created by Valentine Galkin on 1/23/19.
//  Copyright © 2019 Valentine Galkin. All rights reserved.
//

#import "WelcomeController.h"
#import "AppDelegate.h"

@interface WelcomeController()

@end

@implementation WelcomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"WelcomeController now used");
}

- (IBAction)goToSignin:(UIButton *)button {
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Signin" bundle:nil];
    UIViewController *sc = [sb instantiateViewControllerWithIdentifier:@"Signin"];
    [self.navigationController pushViewController:sc animated:YES];
}

- (IBAction)goToSignup:(UIButton *)button {
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Signup" bundle:nil];
    UIViewController *sc = [sb instantiateViewControllerWithIdentifier:@"Signup"];
    [self.navigationController pushViewController:sc animated:YES];
}

@end
