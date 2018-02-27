//
//  TaskDetailViewModel.h
//  tasks
//
//  Created by Woi on 2/27/18.
//  Copyright © 2018 kmklabs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TaskDetailViewModel : NSObject

@property(nonatomic, strong) NSString* title;
@property(nonatomic, strong) NSNumber* isCompleted;

@end
