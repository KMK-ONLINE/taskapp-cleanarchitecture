//
//  TaskListViewModelTest.m
//  tasksTests
//
//  Created by Woi on 2/26/18.
//  Copyright © 2018 kmklabs. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TaskListViewModel.h"
#import "ManageTask.h"
#import "TaskListingItem.h"

@interface ManageTaskMock : NSObject<ManageTask>

@end

@implementation ManageTaskMock

-(NSArray<TaskListingItem*>*) getAllTasks {
    TaskListingItem* task1 = [TaskListingItem new];
    task1.title = @"task 1";
    
    return @[task1, [TaskListingItem new]];
}

@end


@interface TaskListViewModelTest : XCTestCase

@end

@implementation TaskListViewModelTest

- (void)testLoad {
    
    id<ManageTask> manageTask = [ManageTaskMock new];
    TaskListViewModel* taskListVM = [[TaskListViewModel alloc]  initWithManageTask:manageTask];

    XCTAssertEqual(taskListVM.tasks.count, 2);
    XCTAssertTrue([taskListVM.tasks.firstObject.title isEqualToString:@"task 1"]);
}

@end
