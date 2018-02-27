//
//  TaskDetailViewController.h
//  tasks
//
//  Created by Woi on 2/27/18.
//  Copyright © 2018 kmklabs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TaskDetailViewModel.h"

@interface TaskDetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UISwitch *completedSwitch;

@property(nonatomic, strong) TaskDetailViewModel* taskDetailVM;

@end
