//
//  TaskItemViewModel.m
//  tasks
//
//  Created by Woi on 3/6/18.
//  Copyright © 2018 kmklabs. All rights reserved.
//

#import "TaskItemViewModel.h"
#import "DueDateRenderer.h"

@implementation TaskItemViewModel

-(instancetype) initWithTask:(TaskData*) task {
    self = [super init];
    if(!self) return self;
    
    self.title = task.title;
    self.isCompleted = task.isCompleted;
    self.due = task.isOverdue ? @"Overdue" : [DueDateRenderer render:task.dueDate];
    
    UIColor* overdueColor = [UIColor colorWithRed:241.0/255 green:169.0/255 blue:169.0/255 alpha:1];
    self.backgroundColor = task.isOverdue ?  overdueColor : UIColor.whiteColor;
    
    return self;
}

@end
