//
//  AddTaskViewController.m
//  tasks
//
//  Created by Woi on 3/1/18.
//  Copyright © 2018 kmklabs. All rights reserved.
//

#import "AddTaskViewController.h"
#import "ManageTask.h"
#import "ManageTaskFactory.h"

@interface AddTaskViewController ()

@property(nonatomic, strong) id<ManageTask> manageTask;

@end

@implementation AddTaskViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.manageTask = [ManageTaskFactory sharedInstance];
    [self.titleTextField becomeFirstResponder];
}

- (IBAction)save:(id)sender {
    NSString* title = self.titleTextField.text;
    if([title isEqualToString:@""]) return;
    
    [self.manageTask addTaskWithTitle:self.titleTextField.text];
    [self.navigationController popViewControllerAnimated:true];
}

@end
