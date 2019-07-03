//
//  User.m
//  CoreDataLearning
//
//  Created by Valentine Galkin on 7/3/19.
//  Copyright © 2019 Valentine Galkin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "UserMO.h"

@implementation UserMO

@dynamic name;
@dynamic age;
@dynamic image;

- (NSString *)ageString {
    return [NSString stringWithFormat:@"%lu", self.age];
}

- (UIImage *)getImage {
    return [UIImage imageWithData:self.image];
}

@end
