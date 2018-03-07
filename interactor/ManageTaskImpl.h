//
//  ManageTask.h
//  tasks
//
//  Created by Woi on 2/23/18.
//  Copyright © 2018 kmklabs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TaskData.h"
#import "ManageTask.h"
#import "TaskRepository.h"
#import "ReminderService.h"

@interface ManageTaskImpl : NSObject<ManageTask>

-(instancetype)initWithTaskRepository:(id<TaskRepository>)taskRepository
                      reminderService:(id<ReminderService>)reminderService;

@end
