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
#import "SystemReminderService.h"

@interface TaskDetailViewController()

@property(nonatomic, strong) UIDatePicker* dueDatePicker;
@property(nonatomic, strong) id<ManageTask> manageTask;

@end


@implementation TaskDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.manageTask = [ManageTaskFactory sharedInstance];
    [self setupDueDatePicker];
}

- (void)viewWillAppear:(BOOL)animated {
    if(self.viewModel == nil) return;
    [self bindViewModel];
}

- (IBAction)delete:(id)sender {
    [self.viewModel delete];
    [self.navigationController popViewControllerAnimated:true];
}

- (IBAction)completedSwitchToggled:(id)sender {
    [self.viewModel toggleCompleted];
}

#pragma mark - datePicking handler

-(void)dueDatePickerValueChanged:(id) sender {
    //NOTE : handler required by compiler
}

-(void)dueDatePickingDone:(id) sender {
    
    [self.viewModel changeDue:self.dueDatePicker.date];
    [self.dueTextField resignFirstResponder];
}

#pragma mark - private

-(void) bindViewModel {
    self.navigationItem.title = self.viewModel.title;
    [self.completedSwitch setOn:self.viewModel.isCompleted];
    RAC(self.dueTextField, text) = RACObserve(self.viewModel, due);
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


@end
