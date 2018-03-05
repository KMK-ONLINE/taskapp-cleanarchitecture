//
//  Task.m
//  tasks
//
//  Created by kmklabs on 2/19/18.
//  Copyright © 2018 kmklabs. All rights reserved.
//

#import "Task.h"

@interface Task()

@property (nonatomic, assign) BOOL completed;

@end

@implementation Task

- (instancetype)init
{
    self = [super init];
    if(!self) return self;
    
    self.taskId = 0;
    self.completed = false;
    self.title = @"New Task";
    self.dueDate = [NSDate distantFuture];
    
    return self;
}

-(void) toggleCompleted {
    self.completed = !self.completed;
}

-(BOOL) isOverdueOn:(NSDate*) referenceDate {
    return [self.dueDate compare:referenceDate] == NSOrderedDescending;
}

@end
