//
//  InMemoryTaskRepository.h
//  tasks
//
//  Created by Woi on 2/26/18.
//  Copyright © 2018 kmklabs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TaskRepository.h"

@interface InMemoryTaskRepository : NSObject<TaskRepository>

- (instancetype)init;

@end
