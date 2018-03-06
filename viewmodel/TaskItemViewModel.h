//
//  TaskItemViewModel.h
//  tasks
//
//  Created by Woi on 3/6/18.
//  Copyright © 2018 kmklabs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "TaskData.h"

@interface TaskItemViewModel : NSObject

@property(nonatomic, strong) NSString* title;
@property(nonatomic, assign) BOOL isCompleted;
@property(nonatomic, strong) NSString* due;
@property(nonatomic, strong) UIColor* backgroundColor;

-(instancetype) initWithTask:(TaskData*) taskData;

@end
