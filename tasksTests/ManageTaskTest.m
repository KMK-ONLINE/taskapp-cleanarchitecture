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
    return @[[Task new], [Task new]];
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
}

@end
