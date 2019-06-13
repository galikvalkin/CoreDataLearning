//
//  SignupController.m
//  CoreDataLearning
//
//  Created by Valentine Galkin on 1/23/19.
//  Copyright © 2019 Valentine Galkin. All rights reserved.
//

#import "SignupController.h"

@interface SignupController ()

@end


@implementation SignupController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Signup";
    
    NSLog(@"SignupController now used");
}

- (void)viewDidDisappear:(BOOL)animated {
    NSLog(@"SignupController viewDidDisappear");
}

@end
