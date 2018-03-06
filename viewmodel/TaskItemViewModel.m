//
//  TaskItemViewModel.m
//  tasks
//
//  Created by Woi on 3/6/18.
//  Copyright © 2018 kmklabs. All rights reserved.
//

#import "TaskItemViewModel.h"

@implementation TaskItemViewModel

-(instancetype) initWithTask:(TaskData*) task {
    self = [super init];
    if(!self) return self;
    
    self.title = task.title;
    self.isCompleted = task.isCompleted;
    self.due = [TaskItemViewModel renderDueDate:task.dueDate];
    
    return self;
}

#pragma mark - private

+(NSString*) renderDueDate:(NSDate*)  dueDate {
    return
    [NSDateFormatter localizedStringFromDate:dueDate
                                   dateStyle:NSDateFormatterShortStyle
                                   timeStyle:NSDateFormatterShortStyle];
}

@end
