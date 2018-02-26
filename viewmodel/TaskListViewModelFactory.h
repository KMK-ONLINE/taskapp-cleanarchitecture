//
//  TaskListViewModelFactory.h
//  tasks
//
//  Created by Woi on 2/26/18.
//  Copyright © 2018 kmklabs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TaskListViewModel.h"

@interface TaskListViewModelFactory : NSObject

+(TaskListViewModel*) create;

@end
