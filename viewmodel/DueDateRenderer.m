//
//  DueDateRenderer.m
//  tasks
//
//  Created by Woi on 3/6/18.
//  Copyright © 2018 kmklabs. All rights reserved.
//

#import "DueDateRenderer.h"

@implementation DueDateRenderer

+(NSString*) render:(NSDate*) dueDate {
    if(dueDate == [NSDate distantFuture]) return @"No Due";
    
    return
    [NSDateFormatter localizedStringFromDate:dueDate
                                   dateStyle:NSDateFormatterShortStyle
                                   timeStyle:NSDateFormatterShortStyle];
}

@end
