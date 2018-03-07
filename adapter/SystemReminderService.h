//
//  SystemReminderService.h
//  tasks
//
//  Created by Woi on 3/7/18.
//  Copyright © 2018 kmklabs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ReminderService.h"

@interface SystemReminderService : NSObject<ReminderService>

-(void) addReminderWithId:(NSString*) taskId title:(NSString*) title dueDate:(NSDate*) dueDate;

@end
