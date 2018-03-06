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
    XCTAssertEqual(task.dueDate, [NSDate distantFuture]);
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
    XCTAssertFalse([task isOverdueOn:oneHourBefore]);
    XCTAssertTrue([task isOverdueOn:oneHourLater]);
}

-(void) testShouldNotDueOnCompleted {

    NSDate* currentDateTime = [NSDate date];
    NSDate* oneHourBefore = [NSDate dateWithTimeIntervalSinceNow:-3600];
    
    Task* task = [Task new];
    task.dueDate = oneHourBefore;
    
    XCTAssertTrue([task isOverdueOn:currentDateTime]);
    [task toggleCompleted];
    XCTAssertFalse([task isOverdueOn:currentDateTime]);
}

@end
