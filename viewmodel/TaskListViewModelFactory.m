//
//  TaskListViewModelFactory.m
//  tasks
//
//  Created by Woi on 2/26/18.
//  Copyright © 2018 kmklabs. All rights reserved.
//

#import "TaskListViewModelFactory.h"
#import "ManageTask.h"
#import "ManageTaskFactory.h"

@implementation TaskListViewModelFactory

+(TaskListViewModel*) create {
    id<ManageTask> manageTask = [ManageTaskFactory sharedInstance];
    TaskListViewModel* taskListVM = [[TaskListViewModel alloc] initWithManageTask:manageTask];
    return taskListVM;
}

@end
