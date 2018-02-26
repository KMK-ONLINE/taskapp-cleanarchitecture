//
//  MyTableViewController.m
//  tasks
//
//  Created by Woi on 2/23/18.
//  Copyright © 2018 kmklabs. All rights reserved.
//

#import "TasksTableViewController.h"
#import "TaskTableViewCell.h"
#import "TaskListViewModel.h"
#import "TaskListItemViewModel.h"
#import "TaskListViewModelFactory.h"

@interface TasksTableViewController ()

@property(nonatomic, strong) TaskListViewModel* taskListVM;

@end

@implementation TasksTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.taskListVM = [TaskListViewModelFactory create];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.taskListVM.taskCount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"taskCell"
                                                            forIndexPath:indexPath];
   
    TaskTableViewCell* taskCell = (TaskTableViewCell*) cell;
    TaskListItemViewModel* taskVM = [self.taskListVM getTaskVMOnIndex:indexPath.row];
    
    [taskCell setTaskVM:taskVM];

    return cell;
}

@end
