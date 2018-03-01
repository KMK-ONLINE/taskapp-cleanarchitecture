//
//  TaskRepository.h
//  tasks
//
//  Created by Woi on 2/23/18.
//  Copyright © 2018 kmklabs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Task.h"

@protocol TaskRepository <NSObject>

-(NSArray<Task*>*) getAllTasks;
-(Task*) getTaskWithId:(NSInteger) taskId;
-(void) addTaskWithTitle:(NSString *)title;
-(void) deleteTaskWithId:(NSInteger) taskId;
-(void) save:(Task*) task;

@end
