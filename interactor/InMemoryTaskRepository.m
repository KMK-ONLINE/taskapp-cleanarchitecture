//
//  InMemoryTaskRepository.m
//  tasks
//
//  Created by Woi on 2/26/18.
//  Copyright © 2018 kmklabs. All rights reserved.
//

#import "InMemoryTaskRepository.h"
#import "Task.h"

@interface InMemoryTaskRepository()

@property(nonatomic, strong) NSMutableArray<Task*>* tasks;

@end

@implementation InMemoryTaskRepository

- (instancetype)init {
    self = [super init];
    if (self) {
        self.tasks = [NSMutableArray new];
        [self seedWithExampleTasks];
    }
    return self;
}

-(void) seedWithExampleTasks {
    Task* task1 = [Task new];
    task1.taskId = 100;
    task1.title = @"Example task 1";

    Task* task2 = [Task new];
    task1.taskId = 200;
    task2.title = @"Example task 2";
    [task2 toggleCompleted];

    [self.tasks addObjectsFromArray:@[task1, task2]];
}

-(NSArray<Task*>*) getAllTasks {
    return self.tasks;
}

@end
