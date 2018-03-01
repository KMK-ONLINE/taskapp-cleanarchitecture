//
//  AddTaskViewController.m
//  tasks
//
//  Created by Woi on 3/1/18.
//  Copyright © 2018 kmklabs. All rights reserved.
//

#import "AddTaskViewController.h"

@interface AddTaskViewController ()

@end

@implementation AddTaskViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)save:(id)sender {
    [self.navigationController popViewControllerAnimated:true];
}
@end
