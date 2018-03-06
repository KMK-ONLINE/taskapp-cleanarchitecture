//
//  Task.m
//  tasks
//
//  Created by kmklabs on 2/19/18.
//  Copyright © 2018 kmklabs. All rights reserved.
//

#import "Task.h"

@implementation Task

- (instancetype)init
{
    self = [super init];
    if(!self) return self;
    
    self.taskId = 0;
    self.isCompleted = NO;
    self.title = @"New Task";
    self.dueDate = [NSDate distantFuture];
    
    return self;
}

-(void) toggleCompleted {
    self.isCompleted = !self.isCompleted;
}

-(BOOL) isOverdueOn:(NSDate*) referenceDate {
    return
        !self.isCompleted &&
        [self.dueDate compare:referenceDate] == NSOrderedAscending;
}

@end
