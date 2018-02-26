//
//  ManageTaskTest.m
//  tasksTests
//
//  Created by Woi on 2/23/18.
//  Copyright © 2018 kmklabs. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ManageTaskImpl.h"
#import "TaskListingItem.h"
#import "TaskRepository.h"

@interface TaskRepositoryImpl : NSObject<TaskRepository>

@end

@implementation TaskRepositoryImpl

-(NSArray<Task*>*) getAllTasks {
    Task* task1 = [Task new];
    task1.title = @"task 1";
    
    Task* task2 = [Task new];
    task2.title = @"task 2";
    
    return @[task1, task2];
}

@end

@interface ManageTaskTest : XCTestCase

@end

@implementation ManageTaskTest

- (void)testGetTasks {

    id<TaskRepository> taskRepository = [TaskRepositoryImpl new];
    ManageTaskImpl* manageTask = [[ManageTaskImpl alloc] initWithTaskRepository:taskRepository];
    
    NSArray<TaskListingItem*>* tasks = [manageTask getAllTasks];
    
    XCTAssertEqual(tasks.count, 2);
    XCTAssertTrue([tasks.firstObject.title isEqualToString:@"task 1"]);
}

@end
