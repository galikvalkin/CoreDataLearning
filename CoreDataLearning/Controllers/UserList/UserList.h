//
//  UserList.h
//  CoreDataLearning
//
//  Created by Valentine Galkin on 6/27/19.
//  Copyright © 2019 Valentine Galkin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataControllerProtocol.h"

@interface UserListConroller : UITableViewController<DataControllerProtocol, UITableViewDelegate, UITableViewDataSource, NSFetchedResultsControllerDelegate>

@end
