//
//  TaskDisplay.h
//  tasks
//
//  Created by Woi on 2/23/18.
//  Copyright © 2018 kmklabs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TaskData : NSObject

@property(nonatomic, assign) NSInteger taskId;
@property(nonatomic, strong) NSString* title;
@property(nonatomic, assign) BOOL isCompleted;

@end
