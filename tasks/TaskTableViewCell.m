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

-(void) setTaskVM:(TaskListItemViewModel*) taskVM {
    self.textLabel.text = taskVM.title;
    [self setChecked:[taskVM.isCompleted boolValue]];
}

-(void) setChecked:(BOOL) isCompleted {
    self.accessoryType = isCompleted ?
                         UITableViewCellAccessoryCheckmark :
                         UITableViewCellAccessoryNone;
}

@end
