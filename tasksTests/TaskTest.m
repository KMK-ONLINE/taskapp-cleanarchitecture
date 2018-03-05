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

- (void) testInitialValue{
    Task* task = [Task new];
    XCTAssertFalse(task.isCompleted);
    XCTAssertTrue([task.title isEqualToString:@"New Task"]);
}

- (void) testToggleCompleted {
    Task* task = [Task new];

    XCTAssertFalse(task.isCompleted);
    [task toggleCompleted];
    XCTAssertTrue(task.isCompleted);
}

-(void) testIsDue {
    Task* task = [Task new];
    NSDate* currentDateTime = [NSDate date];
    NSDate* oneHourBefore = [NSDate dateWithTimeIntervalSinceNow:-3600];
    NSDate* oneHourLater = [NSDate dateWithTimeIntervalSinceNow:3600];
    
    task.dueDate = currentDateTime;
    XCTAssertTrue([task isOverdueOn:oneHourBefore]);
    XCTAssertFalse([task isOverdueOn:oneHourLater]);
}

@end
