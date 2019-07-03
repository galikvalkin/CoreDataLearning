//
//  User.h
//  CoreDataLearning
//
//  Created by Valentine Galkin on 7/3/19.
//  Copyright © 2019 Valentine Galkin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface UserMO : NSManagedObject

@property (nonatomic, weak) NSString *name;
@property (nonatomic) int32_t age;
@property (nonatomic, weak) NSData *image;

- (NSString *)ageString;

- (UIImage *)getImage;

@end
