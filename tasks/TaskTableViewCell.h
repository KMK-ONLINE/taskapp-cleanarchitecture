//
//  TaskTableViewCell.h
//  tasks
//
//  Created by Woi on 2/26/18.
//  Copyright © 2018 kmklabs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TaskListItemViewModel.h"

@interface TaskTableViewCell : UITableViewCell

-(void) setTaskVM:(TaskListItemViewModel*) taskVM;

@end
