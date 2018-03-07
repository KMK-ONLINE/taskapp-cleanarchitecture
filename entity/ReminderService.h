//
//  ReminderService.h
//  tasks
//
//  Created by Woi on 3/7/18.
//  Copyright © 2018 kmklabs. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ReminderService <NSObject>

-(void) addReminderWithId:(NSString*) taskId title:(NSString*) title dueDate:(NSDate*) dueDate;

@end
