//
//  TaskDetailViewController.m
//  tasks
//
//  Created by Woi on 2/27/18.
//  Copyright © 2018 kmklabs. All rights reserved.
//

#import <ReactiveObjC/ReactiveObjC.h>
#import "TaskDetailViewController.h"
#import "ManageTask.h"
#import "ManageTaskFactory.h"

@interface TaskDetailViewController()

@property(nonatomic, strong) UIDatePicker* dueDatePicker;
@property(nonatomic, strong) id<ManageTask> manageTask;

@end


@implementation TaskDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.manageTask = [ManageTaskFactory sharedInstance];
}

- (void)viewWillAppear:(BOOL)animated {
    if(self.task == nil) return;
    [self loadTaskData];
}

- (IBAction)delete:(id)sender {
    [self.manageTask deleteTaskWithId:self.task.taskId];
    [self.navigationController popViewControllerAnimated:true];
}

- (IBAction)completedSwitchToggled:(id)sender {
    [self.manageTask toggleCompletedTaskWithId:self.task.taskId];
}

#pragma mark - datePicking handler

-(void)dueDatePickerValueChanged:(id) sender {
    //NOTE : handler required by compiler
}

-(void)dueDatePickingDone:(id) sender {
    self.dueTextField.text = [TaskDetailViewController renderDate:self.dueDatePicker.date];
    [self.manageTask changeDueForTaskWithId:self.task.taskId dueDate:self.dueDatePicker.date];
    [self.dueTextField resignFirstResponder];
}

#pragma mark - private

+(NSString*) renderDate:(NSDate*) date {
    return
    [NSDateFormatter localizedStringFromDate:date
                                   dateStyle:NSDateFormatterShortStyle
                                   timeStyle:NSDateFormatterShortStyle];
}

-(void) setupDueDatePicker {

    self.dueDatePicker = [[UIDatePicker alloc] init];
    self.dueDatePicker.datePickerMode = UIDatePickerModeDateAndTime;
    [self.dueDatePicker addTarget:self action:@selector(dueDatePickerValueChanged:)
                 forControlEvents:UIControlEventValueChanged];
    
    self.dueTextField.inputView = self.dueDatePicker;
    
    UIToolbar* bar = [UIToolbar new];

    UIBarButtonItem* space =
    [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                  target:nil
                                                  action:nil];
    
    UIBarButtonItem* doneButton =
    [[UIBarButtonItem alloc] initWithTitle:@"Done"
                                     style:UIBarButtonItemStyleDone
                                    target:self
                                    action:@selector(dueDatePickingDone:)];
    
    [bar setItems:@[space, doneButton] animated:NO];
    bar.userInteractionEnabled = YES;
    [bar sizeToFit];
    
    self.dueTextField.inputAccessoryView = bar;
}

-(void) loadTaskData {
    self.navigationItem.title = self.task.title;
    [self.completedSwitch setOn:self.task.isCompleted];
    
    self.dueTextField.text = [TaskDetailViewController renderDate:self.task.dueDate];
}

@end
