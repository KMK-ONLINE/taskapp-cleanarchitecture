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
    
    return self;
}

-(instancetype) initWithId:(NSString*) taskId
                     title:(NSString*) title
               isCompleted:(BOOL) isCompleted
{
    self = [super init];
    if(!self) return self;
    
    self.taskId = taskId;
    self.title = title;
    self.completed = isCompleted;
    
    return self;
}

-(BOOL) isCompleted {
    return self.completed;
}

-(void) toggleCompleted {
    self.completed = !self.completed;
}

@end
