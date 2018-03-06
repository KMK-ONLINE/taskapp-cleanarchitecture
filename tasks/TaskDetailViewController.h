//
//  TaskDetailViewController.h
//  tasks
//
//  Created by Woi on 2/27/18.
//  Copyright © 2018 kmklabs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TaskData.h"

@interface TaskDetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UISwitch *completedSwitch;
@property (weak, nonatomic) IBOutlet UITextField *dueTextField;
@property(nonatomic, strong) TaskData* task;

- (IBAction)delete:(id)sender;
- (IBAction)completedSwitchToggled:(id)sender;

@end
