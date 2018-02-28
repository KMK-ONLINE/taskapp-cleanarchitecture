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

@interface ManageTaskTest : XCTestCase

@end

@implementation ManageTaskTest

- (void)testGetTasks {

    id taskRepository = OCMProtocolMock(@protocol(TaskRepository));
    OCMStub([taskRepository getAllTasks]).andReturn([self createSampleTasks]);
    
    ManageTaskImpl* manageTask = [[ManageTaskImpl alloc] initWithTaskRepository:taskRepository];
    
    NSArray<TaskData*>* tasks = [manageTask getAllTasks];
    
    XCTAssertEqual(tasks.count, 2);
    XCTAssertTrue([tasks.firstObject.title isEqualToString:@"task 1"]);
}

- (void)testCompleteTask {
   
    Task* task1 = [Task new];
    task1.title = @"task 1";
    
    id taskRepository = OCMProtocolMock(@protocol(TaskRepository));
    OCMStub([taskRepository getAllTasks]).andReturn(@[task1]);
    OCMStub([taskRepository getTaskWithId:task1.taskId]).andReturn(task1);
    
    ManageTaskImpl* manageTask = [[ManageTaskImpl alloc] initWithTaskRepository:taskRepository];
    
    TaskData* taskData1 = [manageTask getAllTasks].firstObject;
    XCTAssertFalse(taskData1.isCompleted);
    
    TaskData* taskData2 = [manageTask toggleCompletedTaskWithId:taskData1.taskId];
    
    XCTAssertTrue(taskData2.isCompleted);
    
    OCMVerify([taskRepository save:[OCMArg checkWithBlock:^BOOL(Task* task) {
        return task.taskId == taskData1.taskId && task.isCompleted;
    }]]);
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
