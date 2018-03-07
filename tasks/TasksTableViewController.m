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
#import "TaskListViewModelFactory.h"
#import "TaskDetailViewController.h"

@interface TasksTableViewController ()

@property(nonatomic, strong) TaskListViewModel* viewModel;

@end

@implementation TasksTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.allowsMultipleSelection = NO;
    self.viewModel = [TaskListViewModelFactory create];
}

-(void) viewWillAppear:(BOOL)animated {
    [self clearSelectedItem:animated];
    [self.viewModel refreshData];
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewModel.taskCount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"taskCell"
                                                            forIndexPath:indexPath];
   
    TaskTableViewCell* taskCell = (TaskTableViewCell*) cell;
    TaskItemViewModel* task = [self.viewModel createTaskItemVMOnIndex:indexPath.row];
    
    [taskCell setViewModel:task];

    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"openTask" sender:self];
}

#pragma mark -

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSIndexPath* selectedIndexPath = self.tableView.indexPathForSelectedRow;
    if(selectedIndexPath == nil) return;
    
    TaskDetailViewModel* taskDetailVM =
    [self.viewModel createTaskDetailVMForIndex:selectedIndexPath.row];

    TaskDetailViewController* taskDetailViewcontroller = (TaskDetailViewController*) segue.destinationViewController;
    taskDetailViewcontroller.viewModel = taskDetailVM;
}

- (IBAction)addTask:(id)sender {
    [self promptAndHandleAddTask];
}

- (IBAction)refresh:(UIRefreshControl*) refreshControl {
    [self.viewModel refreshData];
    [self.tableView reloadData];
    [refreshControl endRefreshing];
}

#pragma mark - private

-(void) promptAndHandleAddTask {
    UIAlertController* alertController =
    [UIAlertController alertControllerWithTitle:@"Add Task"
                                        message:@""
                                 preferredStyle:UIAlertControllerStyleAlert];
   
    [alertController addTextFieldWithConfigurationHandler:^(UITextField*  textField) {
    }];
    
    UIAlertAction* saveAction =
    [UIAlertAction actionWithTitle:@"Save"
                             style:UIAlertActionStyleDefault
                           handler:^(UIAlertAction * action) {
                               NSString* title = alertController.textFields.firstObject.text;
                               if(![title isEqualToString:@""]) {
                                   [self.viewModel addTaskWithTitle:title];
                                   [self.viewModel refreshData];
                                   [self.tableView reloadData];
                               }
                           }];
    
    UIAlertAction* cancelAction =
    [UIAlertAction actionWithTitle:@"Cancel"
                             style:UIAlertActionStyleDefault
                           handler:^(UIAlertAction * action) {
                           }];
    
    [alertController addAction:saveAction];
    [alertController addAction:cancelAction];
    
    [self presentViewController:alertController animated:YES completion:^{
    }];
}

-(void) clearSelectedItem:(BOOL) animated {
    NSIndexPath *indexPath = self.tableView.indexPathForSelectedRow;
    if (indexPath) {
        [self.tableView deselectRowAtIndexPath:indexPath animated:animated];
    }
}


@end
