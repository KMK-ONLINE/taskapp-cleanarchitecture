//
//  ManageTaskTest.m
//  tasksTests
//
//  Created by Woi on 2/23/18.
//  Copyright © 2018 kmklabs. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "ManageTaskImpl.h"
#import "TaskRepository.h"
#import "ReminderService.h"

@interface ManageTaskTest : XCTestCase

@end

@implementation ManageTaskTest

- (void)testGetTasks {

    id taskRepository = OCMProtocolMock(@protocol(TaskRepository));
    OCMStub([taskRepository getAllTasks]).andReturn([self createSampleTasks]);
    
    id reminderService = OCMProtocolMock(@protocol(ReminderService));
    
    ManageTaskImpl* manageTask = [[ManageTaskImpl alloc]
                                  initWithTaskRepository:taskRepository
                                  reminderService:reminderService];
    
    NSArray<TaskData*>* tasks = [manageTask getAllTasks];
    
    XCTAssertEqual(tasks.count, 2);
    XCTAssertTrue([tasks.firstObject.title isEqualToString:@"task 1"]);
}

- (void)testToggleCompleted {
   
    Task* task1 = [Task new];
    task1.title = @"task 1";
    
    id taskRepository = OCMProtocolMock(@protocol(TaskRepository));
    OCMStub([taskRepository getAllTasks]).andReturn(@[task1]);
    OCMStub([taskRepository getTaskWithId:task1.taskId]).andReturn(task1);
    
    id reminderService = OCMProtocolMock(@protocol(ReminderService));
    
    ManageTaskImpl* manageTask = [[ManageTaskImpl alloc]
                                  initWithTaskRepository:taskRepository
                                  reminderService:reminderService];
    
    TaskData* initialTask = [manageTask getAllTasks].firstObject;
    TaskData* toggledTask = [manageTask toggleCompletedTaskWithId:initialTask.taskId];
   
    XCTAssertNotEqual(initialTask.isCompleted, toggledTask.isCompleted);

    OCMVerify([taskRepository save:[OCMArg checkWithBlock:^BOOL(Task* task) {
        return task.taskId == initialTask.taskId && task.isCompleted;
    }]]);
}

-(void) testAddTask {
    id taskRepository = OCMProtocolMock(@protocol(TaskRepository));
    id reminderService = OCMProtocolMock(@protocol(ReminderService));
    ManageTaskImpl* manageTask = [[ManageTaskImpl alloc]
                                  initWithTaskRepository:taskRepository
                                  reminderService:reminderService];
    
    NSString* taskTitle = @"My New Task";
    
    [manageTask addTaskWithTitle:taskTitle];

    OCMVerify([taskRepository addTaskWithTitle:taskTitle]);
}

-(void) testDeleteTask {
    id taskRepository = OCMProtocolMock(@protocol(TaskRepository));
    id reminderService = OCMProtocolMock(@protocol(ReminderService));
    ManageTaskImpl* manageTask = [[ManageTaskImpl alloc]
                                  initWithTaskRepository:taskRepository
                                  reminderService:reminderService];

    [manageTask deleteTaskWithId:@"100"];
    
    OCMVerify([taskRepository deleteTaskWithId:@"100"]);
}

#pragma mark - private

-(NSArray<Task*>*) createSampleTasks {
    Task* task1 = [Task new];
    task1.title = @"task 1";
    
    Task* task2 = [Task new];
    task2.title = @"task 2";
    
    return @[task1, task2];
}

@end
