//
//  TaskListViewModel.h
//  tasks
//
//  Created by Woi on 2/26/18.
//  Copyright © 2018 kmklabs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ManageTask.h"
#import "TaskItemViewModel.h"
#import "TaskDetailViewModel.h"

@interface TaskListViewModel : NSObject

@property(nonatomic, readonly, assign) NSInteger taskCount;

-(instancetype) initWithManageTask:(id<ManageTask>) manageTask;

-(void) refreshData;
-(TaskItemViewModel*) createTaskItemVMOnIndex:(NSInteger) index;
-(TaskDetailViewModel*) createTaskDetailVMForIndex:(NSInteger) index;

@end
