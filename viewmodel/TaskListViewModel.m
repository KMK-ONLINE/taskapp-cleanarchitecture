//
//  TaskListViewModel.m
//  tasks
//
//  Created by Woi on 2/26/18.
//  Copyright © 2018 kmklabs. All rights reserved.
//

#import "TaskListViewModel.h"
#import "TaskData.h"

@interface TaskListViewModel()

@property(nonatomic, strong) id<ManageTask> manageTask;
@property(nonatomic, strong) NSArray<TaskData*>* tasks;

@end

@implementation TaskListViewModel

-(instancetype) initWithManageTask:(id<ManageTask>) manageTask {
    self = [super init];
    if (self) {
        self.manageTask = manageTask;
        [self refreshData];
    }
    return self;
}

-(void) refreshData {
    self.tasks = [self.manageTask getAllTasks];
}

-(NSInteger) taskCount {
    return self.tasks.count;
}

- (IBAction)save:(id)sender {
}

-(TaskData*) getTaskOnIndex:(NSInteger) index {
    if(![self hasTaskForIndex:index]) return [TaskData new];
    return self.tasks[index];
}

-(BOOL) hasTaskForIndex:(NSInteger) index {
    return self.taskCount > 0 && index >= 0 && index < self.taskCount;
}

@end
