//
//  myCoreData.m
//  Interface
//
//  Created by Admin on 6/26/13.
//  Copyright (c) 2013 com.Stribog. All rights reserved.
//
/*
#import "myCoreData.h"
#import "User.h"
#import "TDZone.h"

@implementation myCoreData

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;



- (BOOL) createNewUseronWithName:(NSString *)paramName
                            code:(NSString *)paramCode
                           zone1:(TDZone *)paramZone1
                      macaddress:(NSString *)paramMacaddress
{
    BOOL result = NO;
    
    
    
    
    if ([paramName length] == 0) {
        NSLog(@"paramName не заполнено! ");
        return NO;
    }
    
    //принудительное удаление всех записей из User
    
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"User" inManagedObjectContext:self.managedObjectContext];
    
    [fetchRequest setEntity:entity];
    
    NSError *usersError = nil;
    NSArray *users = [self.managedObjectContext executeFetchRequest:fetchRequest error:&usersError ];
    
    NSLog(@"Количество записей в Users до удаления=%d", [users count]);
    
    for (int i=0; i < [users count]; i++) {
        User *lastUser = [users lastObject];
        [self.managedObjectContext deleteObject:lastUser];
        //[self.managedObjectContext deletedObjects];
    }
    
    NSLog(@"Количество записей в Users после удаления=%d", [users count]);
    
    User *newUser = [NSEntityDescription insertNewObjectForEntityForName:@"User"
                                                      inManagedObjectContext:self.managedObjectContext];
    if (newUser == nil) {
        NSLog(@"Ошибка создания новой записи User");
        return NO;
    }
    
    newUser.name  = paramName;
    newUser.code  = paramCode;
    newUser.zone1 = paramZone1.Name; //[NSNumber numberWithUnsignedInteger:paramAge];
    
    NSError *savingError = nil;
    
    if ([self.managedObjectContext save:&savingError]) {
        return YES;
    }else{
        NSLog(@"Ошибка записи новой строки User");
    }
    
    return result;
}



#pragma mark - Core Data stack

// Returns the managed object context for the application.
// If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
- (NSManagedObjectContext *)managedObjectContext
{
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        _managedObjectContext = [[NSManagedObjectContext alloc] init];
        [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return _managedObjectContext;
}

// Returns the managed object model for the application.
// If the model doesn't already exist, it is created from the application's model.
- (NSManagedObjectModel *)managedObjectModel
{
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Introduction_to_Core_Data" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

// Returns the persistent store coordinator for the application.
// If the coordinator doesn't already exist, it is created and the application's store added to it.
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"Introduction_to_Core_Data.sqlite"];
    
    NSError *error = nil;
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        /*
         Replace this implementation with code to handle the error appropriately.
         
         abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
         
         Typical reasons for an error here include:
         * The persistent store is not accessible;
         * The schema for the persistent store is incompatible with current managed object model.
         Check the error message to determine what the actual problem was.
         
         
         If the persistent store is not accessible, there is typically something wrong with the file path. Often, a file URL is pointing into the application's resources directory instead of a writeable directory.
         
         If you encounter schema incompatibility errors during development, you can reduce their frequency by:
         * Simply deleting the existing store:
         [[NSFileManager defaultManager] removeItemAtURL:storeURL error:nil]
         
         * Performing automatic lightweight migration by passing the following dictionary as the options parameter:
         @{NSMigratePersistentStoresAutomaticallyOption:@YES, NSInferMappingModelAutomaticallyOption:@YES}
         
         Lightweight migration will only work for a limited set of schema changes; consult "Core Data Model Versioning and Data Migration Programming Guide" for details.
         
         */

/*
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}

#pragma mark - Application's Documents directory

// Returns the URL to the application's Documents directory.
- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

@end
*/