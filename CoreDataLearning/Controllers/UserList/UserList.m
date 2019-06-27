//
//  SignupController.m
//  CoreDataLearning
//
//  Created by Valentine Galkin on 1/23/19.
//  Copyright © 2019 Valentine Galkin. All rights reserved.
//

#import "UserList.h"
#import "UserListCell.h"
#import "AppDelegate.h"

@interface UserListConroller ()
@property (strong, nonatomic) IBOutlet UITableView *table;
@property (strong, nonatomic) NSArray *content;


@end


@implementation UserListConroller

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"UserList";
    self.content = [self.dataController userList];
    
    for (int i = 0; i < [self.content count]; i++) {
        NSLog(@"user name is: %@", [self.content[i] valueForKey:@"name"]);
    }
//    NSArray *users = [self.dataController userList];
    
    NSLog(@"UserListController now used");
    self.table.delegate = self;
    self.table.dataSource = self;
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.content count];
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellId = @"UserListCell";
    
    UserListCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];

    cell.labelField.text = [self.content[indexPath.section] valueForKey:@"name"];
    
    return cell;
}

- (void)viewDidDisappear:(BOOL)animated {
    NSLog(@"UserListController viewDidDisappear");
}

@synthesize dataController = _dataController;

- (DataController *) dataController {
    @synchronized (self) {
        if (_dataController == nil) {
            AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
            DataController *dataController = appDelegate.dataContainer;
            _dataController = dataController;
        }
    }
    
    return _dataController;
}

@end
