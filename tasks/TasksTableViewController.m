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
#import "TaskDetailViewModel.h"
#import "TaskDetailViewController.h"

@interface TasksTableViewController ()

@property(nonatomic, strong) TaskListViewModel* taskListVM;

@end

@implementation TasksTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.allowsMultipleSelection = NO;
    self.clearsSelectionOnViewWillAppear = YES;
    self.taskListVM = [TaskListViewModelFactory create];
}

-(void) viewWillAppear:(BOOL)animated {
    self.navigationItem.title = @"Tasks";
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

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"openTask" sender:self];
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSIndexPath* selectedIndexPath = self.tableView.indexPathForSelectedRow;
    if(selectedIndexPath == nil) return;
    
    TaskListItemViewModel* taskVM = [self.taskListVM getTaskVMOnIndex:selectedIndexPath.row];
    TaskDetailViewModel* taskDetailVM = [self createTaskDetailViewModelFrom:taskVM];
    
    TaskDetailViewController* taskDetailViewcontroller = (TaskDetailViewController*) segue.destinationViewController;
    taskDetailViewcontroller.taskDetailVM = taskDetailVM;
}

-(TaskDetailViewModel*) createTaskDetailViewModelFrom:(TaskListItemViewModel*) taskVM {
    TaskDetailViewModel* taskDetailVM = [TaskDetailViewModel new];
    
    taskDetailVM.title = taskVM.title;
    taskDetailVM.isCompleted = taskVM.isCompleted;
    
    return taskDetailVM;
}



@end
