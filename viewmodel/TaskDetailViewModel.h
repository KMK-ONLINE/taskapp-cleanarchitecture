//
//  TaskDetailViewModel.h
//  tasks
//
//  Created by Woi on 3/6/18.
//  Copyright © 2018 kmklabs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ManageTask.h"
#import "TaskData.h"

@interface TaskDetailViewModel : NSObject

@property(nonatomic, strong) NSString* title;
@property(nonatomic, assign) BOOL isCompleted;
@property(nonatomic, strong) NSString* due;

-(instancetype) initWithTask:(TaskData*) task manageTask:(id<ManageTask>) manageTask;

-(void) toggleCompleted;
-(void) changeDue:(NSDate*) due;
-(void) delete;

@end
