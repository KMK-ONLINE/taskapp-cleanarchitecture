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
#import "CoreDataTaskRepository.h"

@implementation ManageTaskFactory

+(id<ManageTask>)sharedInstance
{
    static ManageTaskImpl *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        id<TaskRepository> taskRepository = [CoreDataTaskRepository new];
        sharedInstance = [[ManageTaskImpl alloc] initWithTaskRepository:taskRepository];
    });
    return sharedInstance;
}

@end
