//
//  ManageTaskFactory.h
//  tasks
//
//  Created by Woi on 2/26/18.
//  Copyright © 2018 kmklabs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ManageTask.h"

@interface ManageTaskFactory : NSObject

+(id<ManageTask>) sharedInstance;

@end
