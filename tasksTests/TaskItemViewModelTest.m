//
//  TaskItemViewModelTest.m
//  tasksTests
//
//  Created by Woi on 3/6/18.
//  Copyright © 2018 kmklabs. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TaskItemViewModel.h"
#import "TaskData.h"

@interface TaskItemViewModelTest : XCTestCase

@end

@implementation TaskItemViewModelTest

- (void)testOverdueRendering {
    TaskData* overdueTask = [TaskData new];
    overdueTask.isOverdue = YES;
    
    TaskItemViewModel* viewModel = [[TaskItemViewModel alloc] initWithTask:overdueTask];
    XCTAssertTrue([viewModel.due isEqualToString:@"Overdue"]);
}

- (void)testNonOverdueRendering {
    TaskData* task = [TaskData new];
    task.dueDate = [NSDate distantFuture];
    
    TaskItemViewModel* viewModel = [[TaskItemViewModel alloc] initWithTask:task];
    XCTAssertTrue([viewModel.due isEqualToString:@"No Due"]);
}

@end