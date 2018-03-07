//
//  TaskReminderPolicy.m
//  tasks
//
//  Created by Woi on 3/7/18.
//  Copyright © 2018 kmklabs. All rights reserved.
//

#import "TaskReminderPolicy.h"

@interface TaskReminderPolicy()

@property(nonatomic, strong) id<ReminderService> reminderService;

@end

@implementation TaskReminderPolicy

-(instancetype) initWithReminderService:(id<ReminderService>) reminderService {
    self = [super init];
    if (self) {
        self.reminderService = reminderService;
    }
    return self;
}

-(void) updateReminderForTask:(Task*) task {
    if(!task.isCompleted && task.dueDate != [NSDate distantFuture]) {
        [self.reminderService addReminderWithId:task.taskId title:task.title dueDate:task.dueDate];
    }
}

@end
