//
//  TaskListViewModel.h
//  tasks
//
//  Created by Woi on 2/26/18.
//  Copyright © 2018 kmklabs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ManageTask.h"
#import "TaskListItemViewModel.h"

@interface TaskListViewModel : NSObject

@property(nonatomic, strong) NSArray<TaskListItemViewModel*>* tasks;

-(instancetype) initWithManageTask:(id<ManageTask>) manageTask;

@end
