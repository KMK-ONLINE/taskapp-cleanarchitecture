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
}

-(void) setChecked:(BOOL) isCompleted {
    self.accessoryType = isCompleted ?
                         UITableViewCellAccessoryCheckmark :
                         UITableViewCellAccessoryNone;
}

@end
