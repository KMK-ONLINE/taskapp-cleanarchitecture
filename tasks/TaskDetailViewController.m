//
//  TaskDetailViewController.m
//  tasks
//
//  Created by Woi on 2/27/18.
//  Copyright © 2018 kmklabs. All rights reserved.
//

#import <ReactiveObjC/ReactiveObjC.h>
#import "TaskDetailViewController.h"

@implementation TaskDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    if(self.taskDetailVM == nil) return;
    
    self.navigationItem.title = self.taskDetailVM.title;
    [self.completedSwitch setOn:[self.taskDetailVM.isCompleted boolValue]];
}


@end
