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

-(NSArray<TaskData*>*) getAllTasks
{
    return
    [[[[self.taskRepository getAllTasks] rac_sequence]
      map:^TaskData* (Task * task) {
          return [ManageTaskImpl createTaskDataFrom:task];
      }] array];
}

-(void) addTaskWithTitle:(NSString *)title {
    [self.taskRepository addTaskWithTitle:title];
}

-(void) deleteTaskWithId:(NSString*) taskId {
    [self.taskRepository deleteTaskWithId:taskId];
}

-(TaskData*) toggleCompletedTaskWithId:(NSString*) taskId {
    
    Task* task = [self.taskRepository getTaskWithId:taskId];
    [task toggleCompleted];
    [self.taskRepository save:task];
    
    return [ManageTaskImpl createTaskDataFrom:task];
}

-(void) changeDueForTaskWithId:(NSString*) taskId dueDate:(NSDate*) dueDate {
    Task* task = [self.taskRepository getTaskWithId:taskId];
    task.dueDate = dueDate;
    [self.taskRepository save:task];
}

#pragma mark - private

+(TaskData*) createTaskDataFrom:(Task*) task {
    TaskData* taskData = [TaskData new];

    taskData.taskId = task.taskId;
    taskData.title = task.title;
    taskData.isCompleted = task.isCompleted;
    taskData.dueDate = task.dueDate;
    taskData.isOverdue = [task isOverdueOn:[NSDate date]];

    return taskData;
}

@end
