//
//  TaskDetailViewController.m
//  tasks
//
//  Created by Woi on 2/27/18.
//  Copyright © 2018 kmklabs. All rights reserved.
//

#import <ReactiveObjC/ReactiveObjC.h>
#import "TaskDetailViewController.h"
#import "ManageTask.h"
#import "ManageTaskFactory.h"

@interface TaskDetailViewController()

@property(nonatomic, strong) id<ManageTask> manageTask;

@end


@implementation TaskDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.manageTask = [ManageTaskFactory sharedInstance];
}

- (void)viewWillAppear:(BOOL)animated {
    if(self.task == nil) return;
    [self loadTaskData];
}

- (IBAction)delete:(id)sender {
    [self.manageTask deleteTaskWithId:self.task.taskId];
    [self.navigationController popViewControllerAnimated:true];
}

- (IBAction)completedSwitchToggled:(id)sender {
    [self.manageTask toggleCompletedTaskWithId:self.task.taskId];
}

#pragma mark - private

-(void) loadTaskData {
    self.navigationItem.title = self.task.title;
    [self.completedSwitch setOn:self.task.isCompleted];
}

@end
