//
//  AppDelegate.h
//  tasks
//
//  Created by kmklabs on 2/19/18.
//  Copyright © 2018 kmklabs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

