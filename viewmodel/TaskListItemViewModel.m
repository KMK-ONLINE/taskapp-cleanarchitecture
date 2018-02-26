//
//  TaskListItemViewModel.m
//  tasks
//
//  Created by Woi on 2/26/18.
//  Copyright © 2018 kmklabs. All rights reserved.
//

#import "TaskListItemViewModel.h"

@implementation TaskListItemViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.title = @"";
    }
    return self;
}

@end
