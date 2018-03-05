//
//  ManageTask.h
//  tasks
//
//  Created by Woi on 2/26/18.
//  Copyright © 2018 kmklabs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TaskData.h"

@protocol ManageTask <NSObject>

-(NSArray<TaskData*>*) getAllTasks;
-(void) addTaskWithTitle:(NSString*) title;
-(void) deleteTaskWithId:(NSString*) taskId;
-(TaskData*) toggleCompletedTaskWithId:(NSString*) taskId;

@end
