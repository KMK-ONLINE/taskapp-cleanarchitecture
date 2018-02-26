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
#import "InMemoryTaskRepository.h"

@implementation ManageTaskFactory

+(id<ManageTask>) create {
    id<TaskRepository> taskRepository = [InMemoryTaskRepository new];;
    return [[ManageTaskImpl alloc] initWithTaskRepository:taskRepository];
}

@end
