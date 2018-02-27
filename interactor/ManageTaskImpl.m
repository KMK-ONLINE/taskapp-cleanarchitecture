//
//  ManageTask.m
//  tasks
//
//  Created by Woi on 2/23/18.
//  Copyright © 2018 kmklabs. All rights reserved.
//

#import <ReactiveObjC/ReactiveObjC.h>
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
    return
    [[[[self.taskRepository getAllTasks] rac_sequence]
      map:^TaskListingItem* (Task * task) {
          return [ManageTaskImpl createTaskListingItemFrom:task];
      }] array];
}

+(TaskListingItem*) createTaskListingItemFrom:(Task*) task {
    TaskListingItem* taskListingItem = [TaskListingItem new];

    taskListingItem.taskId = task.taskId;
    taskListingItem.title = task.title;
    taskListingItem.isCompleted = task.isCompleted;

    return taskListingItem;
}

@end
