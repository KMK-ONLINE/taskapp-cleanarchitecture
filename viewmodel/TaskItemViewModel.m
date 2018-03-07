//
//  TaskItemViewModel.m
//  tasks
//
//  Created by Woi on 3/6/18.
//  Copyright © 2018 kmklabs. All rights reserved.
//

#import "TaskItemViewModel.h"
#import "DueDateRenderer.h"
#import "UIColor+Preset.h"

@implementation TaskItemViewModel

-(instancetype) initWithTask:(TaskData*) task {
    self = [super init];
    if(!self) return self;
    
    self.title = task.isCompleted ?
        [self renderWithCompletedStylingForTitle:task.title] :
        [[NSAttributedString alloc] initWithString:task.title];
    
    self.isCompleted = task.isCompleted;
    self.due = task.isOverdue ? @"Overdue" : [DueDateRenderer render:task.dueDate];
    self.backgroundColor = task.isOverdue ?  [UIColor lightRed] : UIColor.whiteColor;

    return self;
}

#pragma mark -

-(NSAttributedString*) renderWithCompletedStylingForTitle:(NSString*) title {

    NSMutableAttributedString* completedTitle =
    [[NSMutableAttributedString alloc] initWithString:title];
    
    [completedTitle addAttribute:NSStrikethroughStyleAttributeName
                           value:@2
                           range:NSMakeRange(0, completedTitle.length)];
    
    return completedTitle;
}

@end
