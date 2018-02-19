//
//  TaskTest.m
//  tasksTests
//
//  Created by kmklabs on 2/19/18.
//  Copyright © 2018 kmklabs. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Task.h"

@interface TaskTest : XCTestCase

@end

@implementation TaskTest

- (void) testStartWithIncomplete {
    Task* task = [Task new];
    XCTAssertFalse(task.isCompleted);
}

- (void) testToggleCompleted {
    Task* task = [Task new];

    XCTAssertFalse(task.isCompleted);
    [task toggleCompleted];
    XCTAssertTrue(task.isCompleted);
}

@end
