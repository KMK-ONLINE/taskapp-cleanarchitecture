//
//  ManageTask.m
//  tasks
//
//  Created by Woi on 2/23/18.
//  Copyright © 2018 kmklabs. All rights reserved.
//

#import "ManageTaskImpl.h"
#import "Task.h"

@interface ManageTaskImpl()

@property(nonatomic, strong) id<TaskRepository> taskRepository;

@end

@implementation ManageTaskImpl

-(instancetype)initWithTaskRepository: (id<TaskRepository>) taskRepository{
    self = [super init];
    if (self) {
        self.taskRepository = taskRepository;
    }
    return self;
}

-(NSArray<TaskListingItem*>*) getAllTasks
{
    NSMutableArray<TaskListingItem*>* taskListing = [NSMutableArray<TaskListingItem*> new];
  
    for(Task* task in [self.taskRepository getAllTasks]){
        TaskListingItem* taskListingItem = [self createTaskListingItemFrom: task];
        [taskListing addObject:taskListingItem];
    }

    return taskListing;
}

-(TaskListingItem*) createTaskListingItemFrom:(Task*) task {
    TaskListingItem* taskListingItem = [TaskListingItem new];

    taskListingItem.title = task.title;
    taskListingItem.isCompleted = task.isCompleted;

    return taskListingItem;
}

@end
