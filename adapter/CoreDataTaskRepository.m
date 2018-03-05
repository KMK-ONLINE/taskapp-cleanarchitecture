//
//  CoreDataTaskRepository.m
//  tasks
//
//  Created by Woi on 3/2/18.
//  Copyright © 2018 kmklabs. All rights reserved.
//

#import <CoreData/CoreData.h>
#import <ReactiveObjC/ReactiveObjC.h>
#import "CoreDataTaskRepository.h"
#import "AppDelegate.h"
#import "TaskMO+CoreDataClass.h"

@interface CoreDataTaskRepository()

@property(nonatomic, strong) NSManagedObjectContext* managedObjectContext;

@end

@implementation CoreDataTaskRepository

NSString* taskEntityName = @"TaskMO";

- (instancetype)init
{
    self = [super init];
    if (!self) return self;
    
    AppDelegate* appDelegate =  (AppDelegate*) UIApplication.sharedApplication.delegate;
    self.managedObjectContext = appDelegate.persistentContainer.viewContext;
    
    return self;
}

-(NSArray<Task*>*) getAllTasks {
    
    NSFetchRequest<NSManagedObject*>* fetchRequest = [[NSFetchRequest alloc]
                                                      initWithEntityName:taskEntityName];
    
    NSError* error;
    NSArray<NSManagedObject*>* tasksMO = [self.managedObjectContext
                                        executeFetchRequest:fetchRequest error:&error];

    return
    [[[tasksMO rac_sequence]
      map:^Task* (NSManagedObject* managedObject) {
          TaskMO* taskMO = (TaskMO*) managedObject;
          return [CoreDataTaskRepository createTaskFrom:taskMO];
      }] array];
}

-(Task*) getTaskWithId:(NSString*) taskId {
    TaskMO* taskMO = [self getTaskMOWithId:taskId];
    if(!taskMO) return [Task new];

    return [CoreDataTaskRepository createTaskFrom:taskMO];
}

-(void) addTaskWithTitle:(NSString *) title {
    TaskMO* taskMO = [self createTaskMO];
    taskMO.title = title;
    [self save];
}

-(void) deleteTaskWithId:(NSString*) taskId {
    TaskMO* taskMO = [self getTaskMOWithId:taskId];
    [self.managedObjectContext deleteObject:taskMO];
    [self save];
}

-(void) save:(Task*) task {
    TaskMO* taskMO = [self getTaskMOWithId:task.taskId];
    
    taskMO.title = task.title;
    taskMO.isCompleted = task.isCompleted;
    
    [self save];
}

#pragma mark - private

+(Task*) createTaskFrom:(TaskMO*) taskMO {
    return
    [[Task alloc] initWithId:taskMO.objectID.URIRepresentation.absoluteString
                       title:taskMO.title
                 isCompleted:taskMO.isCompleted];
}

-(void) save {
    NSError* error;
    [self.managedObjectContext save:&error];
}

-(TaskMO*) createTaskMO {
    NSEntityDescription* taskEntity =
    [NSEntityDescription entityForName:taskEntityName
                inManagedObjectContext:self.managedObjectContext];
    
    NSManagedObject* managedObject =
    [[NSManagedObject alloc]initWithEntity:taskEntity
            insertIntoManagedObjectContext:self.managedObjectContext];
    
    return (TaskMO*) managedObject;
}

-(TaskMO*) getTaskMOWithId:(NSString*) taskId {
    NSURL* objectUri = [NSURL URLWithString:taskId];
    
    NSManagedObjectID* objectId =
    [self.managedObjectContext.persistentStoreCoordinator
     managedObjectIDForURIRepresentation:objectUri];
    
    NSManagedObject* managedObject = [self.managedObjectContext objectWithID:objectId];
   
    return (TaskMO*) managedObject;
}

@end
