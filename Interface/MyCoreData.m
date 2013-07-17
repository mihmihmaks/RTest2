//
//  myCoreData.m
//  Interface
//
//  Created by Admin on 6/26/13.
//  Copyright (c) 2013 com.Stribog. All rights reserved.
//

#import "MyCoreData.h"
#import "User.h"
#import "TDZone.h"
#import "CoreData+MagicalRecord.h"


@implementation MyCoreData

@synthesize managedObjectContext       = _managedObjectContext;
@synthesize managedObjectModel         = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;



- (void) createNewUser:(TDUser *)paramUser
{
    if(paramUser == nil){
        NSLog(@" paramUser - НЕ заполнено");
        return;
    }
    
    // удаляем записи из User
    NSFetchRequest      *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity       = [NSEntityDescription entityForName:@"User"
                                                    inManagedObjectContext:self.managedObjectContext];
    
    [fetchRequest setEntity:entity];
    
    NSError *usersError  = nil;
    NSError *savingError = nil;
    NSArray *users = [self.managedObjectContext executeFetchRequest:fetchRequest error:&usersError ];
    
    for (int i=0; i < [users count]; i++) {
        User *userToDelete = [users objectAtIndex:i];
        [self.managedObjectContext deleteObject:userToDelete];
        
    }
    
    if ([self.managedObjectContext save:&savingError]) {
        NSLog(@"Успешно удалили записи");
    }else{
        NSLog(@"Ошибка удаления записей");
        return;
    }
    
    // добавляем новую запись
    User *newUser = [NSEntityDescription insertNewObjectForEntityForName:@"User"
                                                  inManagedObjectContext:self.managedObjectContext];
    
    if (newUser == nil) {
        NSLog(@"Ошибка создания новой записи User");
        return;
    }

    newUser.code = [NSNumber numberWithInteger:paramUser.Code];
    newUser.name = paramUser.Name;
    //newUser.relationshipUserToZones = ???

    savingError = nil;
    
    if ([self.managedObjectContext save:&savingError]) {
        //return YES;
    }else{
        NSLog(@"Ошибка записи новой строки User");
    }


    
    
}

- (void) createNewUserWithName:(NSString *)paramName
                            code:(NSUInteger)paramCode
                           zone1:(NSString *)paramZone1
                       zone1Code:(NSString *)paramZone1Code
                      macaddress:(NSString *)paramMacaddress
{
/* отключено, т.к. изменился объект TDUser
    //BOOL result = NO;
    
    
    
    
    if ([paramName length] == 0) {
        NSLog(@"paramName не заполнено! ");
        //return NO;
    }
    
    //принудительное удаление всех записей из User
    
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"User" inManagedObjectContext:self.managedObjectContext];
    
    [fetchRequest setEntity:entity];
    
    NSError *usersError  = nil;
    NSError *savingError = nil;
    NSArray *users = [self.managedObjectContext executeFetchRequest:fetchRequest error:&usersError ];
 
    NSLog(@"Количество записей в Users до удаления= %d", [users count]);
    //[self.managedObjectContext deletedObjects];// нихрена не работает

    for (int i=0; i < [users count]; i++) {
        
        User *userToDelete = [users objectAtIndex:i];
        
        NSLog(@"      Попытка удаления записи %@", userToDelete.name);
        
        [self.managedObjectContext deleteObject:userToDelete];

/*        if ([userToDelete isDeleted]) {
            
            NSLog(@"      Успешно удалили запись %@", userToDelete.name);
            
            if ([self.managedObjectContext save:&savingError]) {
                NSLog(@"      Успешно записали контекст");
            }else{
                NSLog(@      "Ошибка записи контекста");
            }
            
        }else{
            
            NSLog(@"      Ошибка удаления записи %@", userToDelete.name);
        
        }
*

    }

    if ([self.managedObjectContext save:&savingError]) {
        NSLog(@"Успешно удалили записи");
    }else{
        NSLog(@"Ошибка удаления записей");
    }

    
    NSArray *usersAfterDelete = [self.managedObjectContext executeFetchRequest:fetchRequest error:&usersError ];
    NSLog(@"Количество записей в usersAfterDelete после удаления= %d", [usersAfterDelete count]);
    //NSLog(@"Количество записей в users            после удаления= %d", [users count]);
    
    User *newUser = [NSEntityDescription insertNewObjectForEntityForName:@"User"
                                                      inManagedObjectContext:self.managedObjectContext];

    if (newUser == nil) {
        NSLog(@"Ошибка создания новой записи User");
       // return NO;
    }

    newUser.name      = paramName;
    //newUser.code    = paramCode;
    newUser.code      = [NSNumber numberWithUnsignedInteger:paramCode];
    newUser.zone1     = paramZone1; //[NSNumber numberWithUnsignedInteger:paramAge];
    newUser.zone1Code = paramZone1Code;
    
    savingError = nil;
    
    if ([self.managedObjectContext save:&savingError]) {
        //return YES;
    }else{
        NSLog(@"Ошибка записи новой строки User");
    }
    
    NSArray *usersAfterCreate = [self.managedObjectContext executeFetchRequest:fetchRequest error:&usersError ];
    NSLog(@"Количество записей в usersAfterCreate после добавления = %d", [usersAfterCreate count]);
    
  //return result;
*/  
}

- (NSString *)GetUserName
{
    //return @" Этот текст отправлен из MyCoreData GetUserName";//отладка
    
    
    NSString *result;
    
    result = @"";
    
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"User" inManagedObjectContext:self.managedObjectContext];
    
    [fetchRequest setEntity:entity];
    
    NSError *usersError  = nil;
    NSArray *users = [self.managedObjectContext executeFetchRequest:fetchRequest error:&usersError ];
    
    if ([users count] > 0) {
        User *user = [users objectAtIndex:0];
        result = user.name;
    }
    
    return result;
}

- (NSString *)GetUserCode
{
    NSString *result;
    
    result = @"";
    
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"User" inManagedObjectContext:self.managedObjectContext];
    
    [fetchRequest setEntity:entity];
    
    NSError *usersError  = nil;
    NSArray *users = [self.managedObjectContext executeFetchRequest:fetchRequest error:&usersError ];
    
    if ([users count] > 0) {
        User *user = [users objectAtIndex:0];
        result = user.code;
    }
    
    return result;

}


- (NSString *)GetUserZone
{
/* отключено, т.к. изменился объект TDUser
    NSString *result=@"";
    
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"User" inManagedObjectContext:self.managedObjectContext];
    
    [fetchRequest setEntity:entity];
    
    NSError *usersError  = nil;
    NSArray *users = [self.managedObjectContext executeFetchRequest:fetchRequest error:&usersError ];
    
    if ([users count] > 0) {
        User *user = [users objectAtIndex:0];
        result = user.zone1;
    }
    
    return result;
*/
}

- (NSString *)GetUserZoneCode
{
/* отключено, т.к. изменился объект TDUser    
    NSString *result=@"";
    
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"User" inManagedObjectContext:self.managedObjectContext];
    
    [fetchRequest setEntity:entity];
    
    NSError *usersError  = nil;
    NSArray *users = [self.managedObjectContext executeFetchRequest:fetchRequest error:&usersError ];
    
    if ([users count] > 0) {
        User *user = [users objectAtIndex:0];
        result = user.zone1Code;
    }
    
    return result;
*/
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
    //NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Introduction_to_Core_Data" withExtension:@"momd"];
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"ModelCoreData" withExtension:@"momd"];
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

