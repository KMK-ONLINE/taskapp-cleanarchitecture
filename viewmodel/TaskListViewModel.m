//
//  TaskListViewModel.m
//  tasks
//
//  Created by Woi on 2/26/18.
//  Copyright © 2018 kmklabs. All rights reserved.
//

#import "TaskListViewModel.h"

@interface TaskListViewModel()

@property(nonatomic, retain) id<ManageTask> manageTask;

@end

@implementation TaskListViewModel

-(instancetype) initWithManageTask:(id<ManageTask>) manageTask {
    self = [super init];
    if (self) {
        self.manageTask = manageTask;
        self.tasks = [self createTaskVMsFrom:self.manageTask.getAllTasks];
    }
    return self;
}

-(NSArray<TaskListItemViewModel*>*) createTaskVMsFrom:(NSArray<TaskListingItem*>*) taskListing {
    NSMutableArray<TaskListItemViewModel*>* taskVMs = [NSMutableArray new];

    for(TaskListingItem* taskListingItem in taskListing) {
        TaskListItemViewModel* taskVM = [TaskListItemViewModel new];
        taskVM.title = taskListingItem.title;
        [taskVMs addObject:taskVM];
    }
    
    return taskVMs;
}

@end
