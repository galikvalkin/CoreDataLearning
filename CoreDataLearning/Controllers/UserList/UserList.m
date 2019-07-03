//
//  UserList.m
//  CoreDataLearning
//
//  Created by Valentine Galkin on 6/27/19.
//  Copyright © 2019 Valentine Galkin. All rights reserved.
//

#import "UserList.h"
#import "UserListCell.h"
#import "AppDelegate.h"
#import "UserMO.h"

@interface UserListConroller ()
@property (strong, nonatomic) IBOutlet UITableView *table;
@property (strong, nonatomic) NSArray *content;


@end


@implementation UserListConroller

- (void)viewDidLoad {
    [super viewDidLoad];
    self.content = [self.dataController userList];
    
    NSLog(@"UserListController now used");
    self.table.delegate = self;
    self.table.dataSource = self;
    
    NSManagedObjectContext *context = [self.dataController getContext];
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    
    [notificationCenter addObserver:self selector:@selector(managedObjectContextObjectsDidChange) name:NSManagedObjectContextDidSaveNotification object:context];
}

- (void)addNew {
    NSLog(@"Add New Was pressed");
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"AddUser" bundle:nil];
    UIViewController *sc = [sb instantiateViewControllerWithIdentifier:@"AddUser"];
    [self.navigationController pushViewController:sc animated:YES];
}

- (void)managedObjectContextObjectsDidChange {
    self.content = [self.dataController userList];
    [self.tableView reloadData];
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
    UserMO *item = self.content[indexPath.section];
    
    cell.labelValue.text = item.name;
    cell.ageValue.text = [item ageString];
    [cell.avatar setImage:[item getImage]];
    
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
