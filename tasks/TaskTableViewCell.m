//
//  TaskTableViewCell.m
//  tasks
//
//  Created by Woi on 2/26/18.
//  Copyright © 2018 kmklabs. All rights reserved.
//

#import "TaskTableViewCell.h"

@implementation TaskTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

-(void) setTask:(TaskData*) task {
    self.textLabel.text = task.title;
    [self setChecked:task.isCompleted];
    [self renderDueDate:task.dueDate];
}

-(void) renderDueDate:(NSDate*)  dueDate {
    self.detailTextLabel.text = [NSDateFormatter localizedStringFromDate:dueDate
                                                               dateStyle:NSDateFormatterShortStyle
                                                               timeStyle:NSDateFormatterShortStyle];
    
}

-(void) setChecked:(BOOL) isCompleted {
    self.accessoryType = isCompleted ?
                         UITableViewCellAccessoryCheckmark :
                         UITableViewCellAccessoryNone;
}

@end
