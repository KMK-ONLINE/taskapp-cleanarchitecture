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
#import "TaskReminderPolicy.h"

@interface ManageTaskImpl()

@property(nonatomic, strong) id<TaskRepository> taskRepository;
@property(nonatomic, strong) id<ReminderService> reminderService;

@end

@implementation ManageTaskImpl

-(instancetype)initWithTaskRepository: (id<TaskRepository>) taskRepository
                      reminderService:(id<ReminderService>)reminderService
{
    self = [super init];
    if (self) {
        self.taskRepository = taskRepository;
        self.reminderService = reminderService;
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
    [self updateReminder:task];
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

-(void) updateReminder:(Task*) task {
    TaskReminderPolicy* taskReminderPolicy = [[TaskReminderPolicy alloc] initWithReminderService:self.reminderService];
    [taskReminderPolicy updateReminderForTask:task];
}

@end
