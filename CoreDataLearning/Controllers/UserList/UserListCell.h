//
//  UserListCell.h
//  CoreDataLearning
//
//  Created by Valentine Galkin on 6/27/19.
//  Copyright © 2019 Valentine Galkin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserListCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *labelField;
@property (weak, nonatomic) IBOutlet UILabel *ageField;

@end
