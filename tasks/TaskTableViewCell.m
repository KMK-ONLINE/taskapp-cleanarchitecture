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

-(void) setViewModel:(TaskItemViewModel*) viewModel {
    self.textLabel.attributedText = viewModel.title;
    [self setChecked:viewModel.isCompleted];
    self.detailTextLabel.text = viewModel.due;
    self.backgroundColor = viewModel.backgroundColor;
}

-(void) setChecked:(BOOL) isCompleted {
    self.accessoryType = isCompleted ?
                         UITableViewCellAccessoryCheckmark :
                         UITableViewCellAccessoryNone;
}

@end
