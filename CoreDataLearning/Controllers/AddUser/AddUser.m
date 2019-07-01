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
@property (weak, nonatomic) IBOutlet UIButton *imageButton;

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

- (BOOL)save {
    NSString *name = self.nameField.text;
    NSString *age = self.ageField.text;
    
    NSLog(@"save was called");
    
    if ([name length] != 0 & [age length] != 0) {
        NSNumberFormatter *nf = [[NSNumberFormatter alloc] init];
        nf.numberStyle = NSNumberFormatterDecimalStyle;
        NSNumber *ageNum = [nf numberFromString:age];
        NSData *dataImage = UIImageJPEGRepresentation(self.imageButton.imageView.image, 0.0);
        [self.dataController addUser:@{
                                       @"name": name,
                                       @"age": ageNum,
                                       @"image": dataImage,
                                       }];
        [self clearForm];
        [self.navigationController popViewControllerAnimated:YES];
        return YES;
    }
    
    return NO;
}

- (IBAction)selectPhoto:(id)sender {
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.allowsEditing = YES;
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        
        [self presentViewController:picker animated:YES completion:^(void) {
            NSLog(@"Presented Camera");
        }];
    } else {
        NSLog(@"No camera found");
    }
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey,id> *)info {
    NSLog(@"didFinishPickingMediaWithInfo");
    UIImage *image = info[UIImagePickerControllerEditedImage];
    [self.imageButton setImage:image forState:UIControlStateNormal];
    self.imageButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:^{
        NSLog(@"Completed dismissing picker controller");
    }];
}

- (void)clearForm {
    self.nameField.text = @"";
    self.ageField.text = @"";
    
    UIImage *defaultImage = [UIImage imageNamed:@"logo"];
    [self.imageButton setImage:defaultImage forState:UIControlStateNormal];
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
