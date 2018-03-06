//
//  TaskDetailViewModel.m
//  tasks
//
//  Created by Woi on 3/6/18.
//  Copyright © 2018 kmklabs. All rights reserved.
//

#import "TaskDetailViewModel.h"
#import "DueDateRenderer.h"

@interface TaskDetailViewModel()

@property(nonatomic, strong) NSString* taskId;
@property(nonatomic, strong) id<ManageTask> manageTask;

@end

@implementation TaskDetailViewModel

-(instancetype) initWithTask:(TaskData*) task manageTask:(id<ManageTask>) manageTask {
    self = [super init];
    if(!self) return self;
   
    self.taskId = task.taskId;
    self.title = task.title;
    self.isCompleted = task.isCompleted;
    self.due = [DueDateRenderer render:task.dueDate];
    
    self.manageTask = manageTask;
    
    return self;
}

-(void) toggleCompleted {
    [self.manageTask toggleCompletedTaskWithId:self.taskId];
}

-(void) changeDue:(NSDate*) dueDate {
    self.due = [DueDateRenderer render:dueDate];
    [self.manageTask changeDueForTaskWithId:self.taskId dueDate:dueDate];
}

-(void) delete {
    [self.manageTask deleteTaskWithId:self.taskId];
}

@end
