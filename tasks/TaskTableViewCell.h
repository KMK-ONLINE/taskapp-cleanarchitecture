//
//  TaskTableViewCell.h
//  tasks
//
//  Created by Woi on 2/26/18.
//  Copyright © 2018 kmklabs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TaskItemViewModel.h"

@interface TaskTableViewCell : UITableViewCell

-(void) setTask:(TaskItemViewModel*) task;

@end
