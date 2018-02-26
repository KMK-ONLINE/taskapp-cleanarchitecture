//
//  ManageTaskFactory.m
//  tasks
//
//  Created by Woi on 2/26/18.
//  Copyright © 2018 kmklabs. All rights reserved.
//

#import "ManageTaskFactory.h"
#import "Task.h"
#import "TaskRepository.h"
#import "ManageTaskImpl.h"

@interface TaskRepositoryDummy : NSObject<TaskRepository>

@end

@implementation TaskRepositoryDummy

-(NSArray<Task*>*) getAllTasks {
    Task* task1 = [Task new];
    task1.title = @"task 1";
    
    Task* task2 = [Task new];
    task2.title = @"task 2";
    
    return @[task1, task2];
}

@end

@implementation ManageTaskFactory

+(id<ManageTask>) create {
    id<TaskRepository> taskRepository = [TaskRepositoryDummy new];
    return [[ManageTaskImpl alloc] initWithTaskRepository:taskRepository];
}

@end
