//
//  Task.h
//  tasks
//
//  Created by kmklabs on 2/19/18.
//  Copyright © 2018 kmklabs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Task : NSObject

@property(nonatomic, strong) NSString* taskId;
@property(nonatomic, strong) NSString* title;
@property(nonatomic, assign, readonly) BOOL isCompleted;


-(instancetype) init;
-(instancetype) initWithId:(NSString*) taskId
                     title:(NSString*) title
               isCompleted:(BOOL) isCompleted;

-(void) toggleCompleted;

@end
