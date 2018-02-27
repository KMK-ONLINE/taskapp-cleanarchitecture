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
#import "TaskListingItem.h"

@interface TaskListViewModelTest : XCTestCase

@end

@implementation TaskListViewModelTest

- (void)testLoad {
    
    id manageTask = OCMProtocolMock(@protocol(ManageTask));
    OCMStub([manageTask getAllTasks]).andReturn([self createSampleTasks]);
    
    TaskListViewModel* taskListVM = [[TaskListViewModel alloc]  initWithManageTask:manageTask];
    
    XCTAssertEqual(taskListVM.tasks.count, 2);
    XCTAssertTrue([taskListVM.tasks.firstObject.title isEqualToString:@"task 1"]);
}

-(NSArray<TaskListingItem*>*) createSampleTasks {
    
    TaskListingItem* task1 = [TaskListingItem new];
    task1.title = @"task 1";
    
    TaskListingItem* task2 = [TaskListingItem new];
    task2.title = @"task 2";
    
    return @[task1, task2];
}

@end
