//
//  UserListCell.m
//  CoreDataLearning
//
//  Created by Valentine Galkin on 6/27/19.
//  Copyright © 2019 Valentine Galkin. All rights reserved.
//

#import "UserListCell.h"

@interface UserListCell ()

@end


@implementation UserListCell

- (void) awakeFromNib {
    [super awakeFromNib];
    self.labelText.text = @"Name:";
    self.ageText.text = @"Age:";
    
//    self
//    self.avatar = [UIImage imageNamed:@"logo"];
}

@end
