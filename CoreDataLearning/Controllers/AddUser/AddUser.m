//
//  UserList.m
//  CoreDataLearning
//
//  Created by Valentine Galkin on 6/27/19.
//  Copyright © 2019 Valentine Galkin. All rights reserved.
//

#import "AddUser.h"
#import "AppDelegate.h"

@interface AddUserController ()

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *ageField;

@end


@implementation AddUserController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.nameField.delegate = self;
    self.ageField.delegate = self;
    self.navigationItem.title = @"Add User";
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"Save" style:UIBarButtonItemStylePlain target:self action:@selector(save)];
    self.navigationItem.rightBarButtonItem = rightButton;
    
    NSLog(@"AddUserController now used");
}

- (void)save {
    NSString *name = self.nameField.text;
    NSString *age = self.ageField.text;
    
    NSLog(@"save was called");
    
    if ([name length] != 0 & [age length] != 0) {
        NSNumberFormatter *nf = [[NSNumberFormatter alloc] init];
        nf.numberStyle = NSNumberFormatterDecimalStyle;
        NSNumber *ageNum = [nf numberFromString:age];
        [self.dataController addUser:@{
                                       @"name": name,
                                       @"age": ageNum
                                       }];
        [self clearForm];
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)clearForm {
    self.nameField.text = @"";
    self.ageField.text = @"";
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField {
    if (textField == self.nameField) {
        [self.ageField becomeFirstResponder];
    } else if (textField == self.ageField) {
        [self.ageField resignFirstResponder];
    }
    return YES;
}

@end
