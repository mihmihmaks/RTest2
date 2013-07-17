//
//  myCoreData.h
//  Interface
//
//  Created by Admin on 6/26/13.
//  Copyright (c) 2013 com.Stribog. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "TDUser.h"


@interface MyCoreData : NSObject

@property (readonly, strong, nonatomic) NSManagedObjectContext       *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel         *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory;


 //- (BOOL)createNewPersonWithFirstName:(NSString *)paramFirstName lastName:(NSString *)paramLastName age:(NSUInteger)paramAge;
- (void) createNewUserWithName:(NSString *)paramName
                          code:(NSUInteger)paramCode
                         zone1:(NSString *)paramZone1
                     zone1Code:(NSString *)paramZone1Code
                    macaddress:(NSString *)paramMacaddress;

- (void) createNewUserWithName:(NSString *)paramName
                          code:(NSUInteger)paramCode
                         zones:(NSString *)paramZones
                    macaddress:(NSString *)paramMacaddress;

- (void) creatrNewUser:(TDUser *)paramUser;


- (NSString *)GetUserName;
- (NSString *)GetUserCode;
- (NSString *)GetUserZone;
- (NSString *)GetUserZoneCode;

@end
