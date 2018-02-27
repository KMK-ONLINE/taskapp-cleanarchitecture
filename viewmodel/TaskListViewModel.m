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

-(NSInteger) taskCount {
    return self.tasks.count;
}

-(TaskListItemViewModel*) getTaskVMOnIndex:(NSInteger) index {
    if([self hasTaskForIndex:index]) return [TaskListItemViewModel new];
    return self.tasks[index];
}

-(BOOL) hasTaskForIndex:(NSInteger) index {
    return self.taskCount > 0 && index < 0 && index < self.taskCount;
}

-(NSArray<TaskListItemViewModel*>*) createTaskVMsFrom:(NSArray<TaskListingItem*>*) taskListing {
    NSMutableArray<TaskListItemViewModel*>* taskVMs = [NSMutableArray new];

    for(TaskListingItem* taskItem in taskListing) {
        TaskListItemViewModel* taskVM = [self createTaskVMFrom:taskItem];
        [taskVMs addObject:taskVM];
    }
    
    return taskVMs;
}

-(TaskListItemViewModel*) createTaskVMFrom:(TaskListingItem*) taskItem {
    
    TaskListItemViewModel* taskVM = [TaskListItemViewModel new];

    taskVM.title = taskItem.title;
    taskVM.isCompleted = @(taskItem.isCompleted);
   
    return taskVM;
}

@end
