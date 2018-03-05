//
//  TaskDisplay.h
//  tasks
//
//  Created by Woi on 2/23/18.
//  Copyright © 2018 kmklabs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TaskData : NSObject

@property(nonatomic, strong) NSString* taskId;
@property(nonatomic, strong) NSString* title;
@property(nonatomic, assign) BOOL isCompleted;
@property(nonatomic, strong) NSDate* dueDate;
@property(nonatomic, assign) BOOL isOverdue;

@end
