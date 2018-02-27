//
//  TaskTableViewCell.m
//  tasks
//
//  Created by Woi on 2/26/18.
//  Copyright © 2018 kmklabs. All rights reserved.
//

#import "TaskTableViewCell.h"
#import <ReactiveObjC/ReactiveObjC.h>

@implementation TaskTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

-(void) setTaskVM:(TaskListItemViewModel*) taskVM {
    RAC(self.textLabel, text) = RACObserve(taskVM, title);
    [self bindIsCompletedStateFrom:taskVM];
}

-(void) bindIsCompletedStateFrom:(TaskListItemViewModel*) taskVM {
    @weakify(self)
    [[RACObserve(taskVM, isCompleted)
     takeUntil:[self rac_willDeallocSignal]]
     subscribeNext:^(NSNumber* isCompleted) {
         @strongify(self)
         [self setChecked:[isCompleted boolValue]];
     }];
}

-(void) setChecked:(BOOL) isCompleted {
    self.accessoryType = isCompleted ?
                         UITableViewCellAccessoryCheckmark :
                         UITableViewCellAccessoryNone;
}

@end
