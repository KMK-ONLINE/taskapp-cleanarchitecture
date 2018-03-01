//
//  AddTaskViewController.h
//  tasks
//
//  Created by Woi on 3/1/18.
//  Copyright © 2018 kmklabs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddTaskViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *titleTextField;

- (IBAction)save:(id)sender;

@end
