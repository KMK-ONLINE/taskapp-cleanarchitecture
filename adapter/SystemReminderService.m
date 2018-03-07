//
//  SystemReminderService.m
//  tasks
//
//  Created by Woi on 3/7/18.
//  Copyright © 2018 kmklabs. All rights reserved.
//

#import "SystemReminderService.h"
#import <UserNotifications/UserNotifications.h>

@implementation SystemReminderService

-(void) addReminderWithId:(NSString*) taskId title:(NSString*) title dueDate:(NSDate*) dueDate {
    
    UNMutableNotificationContent *objNotificationContent = [UNMutableNotificationContent new];
    objNotificationContent.title = @"Task Due";
    objNotificationContent.body = title;
    objNotificationContent.sound = [UNNotificationSound defaultSound];
    
    NSCalendar* calendar = NSCalendar.currentCalendar;
    unsigned unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth |  NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitWeekday | NSCalendarUnitWeekOfYear | NSCalendarUnitWeekOfMonth |NSCalendarUnitWeekOfMonth;
    NSDateComponents* dateComponents = [calendar components:unitFlags fromDate:dueDate];
    
    UNCalendarNotificationTrigger* trigger =
    [UNCalendarNotificationTrigger triggerWithDateMatchingComponents:dateComponents repeats:NO];
    
    UNNotificationRequest *request =
    [UNNotificationRequest requestWithIdentifier:taskId
                                         content:objNotificationContent
                                         trigger:trigger];
    
    UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
    [center removePendingNotificationRequestsWithIdentifiers:@[taskId]];
    [center addNotificationRequest:request withCompletionHandler:^(NSError * _Nullable error) {
        if (!error) {
            NSLog(@"Local Notification set");
        } else {
            NSLog(@"Local Notification failed");
        }
    }];
}

@end
