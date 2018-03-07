//
//  TaskReminderPolicy.h
//  tasks
//
//  Created by Woi on 3/7/18.
//  Copyright © 2018 kmklabs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ReminderService.h"
#import "Task.h"

@interface TaskReminderPolicy : NSObject

-(instancetype) initWithReminderService:(id<ReminderService>) reminderService;
-(void) updateReminderForTask:(Task*) task;

@end
