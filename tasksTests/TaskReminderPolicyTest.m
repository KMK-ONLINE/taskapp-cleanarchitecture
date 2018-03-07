//
//  TaskReminderPolicyTest.m
//  tasksTests
//
//  Created by Woi on 3/7/18.
//  Copyright © 2018 kmklabs. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "TaskReminderPolicy.h"
#import "ReminderService.h"
#import "Task.h"

@interface TaskReminderPolicyTest : XCTestCase

@end

@implementation TaskReminderPolicyTest

- (void)testUpdateReminderWithIncompleteTask {
   
    id reminderService = OCMProtocolMock(@protocol(ReminderService));

    TaskReminderPolicy* policy = [[TaskReminderPolicy alloc]
                                  initWithReminderService:reminderService];
    
    Task* task = [Task new];
    task.isCompleted = NO;
    
    NSDate* dueDate = [NSDate date];
    task.dueDate = dueDate;
    
    [policy updateReminderForTask:task];
    
    OCMVerify([reminderService addReminderWithId:task.taskId title:task.title dueDate:dueDate]);
}

- (void)testUpdateReminderWithCompletedTask {
    
    id reminderService = OCMProtocolMock(@protocol(ReminderService));
    OCMReject([reminderService addReminderWithId:OCMOCK_ANY title:OCMOCK_ANY dueDate:OCMOCK_ANY]);
    
    TaskReminderPolicy* policy = [[TaskReminderPolicy alloc]
                                  initWithReminderService:reminderService];
    
    Task* task = [Task new];
    task.isCompleted = YES;
    
    NSDate* dueDate = [NSDate date];
    task.dueDate = dueDate;
    
    [policy updateReminderForTask:task];
    
    OCMVerifyAll(reminderService);
}

@end
