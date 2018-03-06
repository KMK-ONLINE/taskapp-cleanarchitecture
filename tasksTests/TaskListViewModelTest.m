//
//  TaskListViewModelTest.m
//  tasksTests
//
//  Created by Woi on 2/26/18.
//  Copyright © 2018 kmklabs. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "TaskListViewModel.h"
#import "ManageTask.h"
#import "TaskData.h"

@interface TaskListViewModelTest : XCTestCase

@end

@implementation TaskListViewModelTest

- (void)testLoad {
    
    id manageTask = OCMProtocolMock(@protocol(ManageTask));
    OCMStub([manageTask getAllTasks]).andReturn([self createSampleTasks]);
    
    TaskListViewModel* taskListVM = [[TaskListViewModel alloc]  initWithManageTask:manageTask];
    
    XCTAssertEqual(taskListVM.taskCount, 2);
    XCTAssertTrue([[taskListVM createTaskItemVMOnIndex:0].title isEqualToString:@"task 1"]);
}

-(NSArray<TaskData*>*) createSampleTasks {
    
    TaskData* task1 = [TaskData new];
    task1.title = @"task 1";
    
    TaskData* task2 = [TaskData new];
    task2.title = @"task 2";
    
    return @[task1, task2];
}

@end
