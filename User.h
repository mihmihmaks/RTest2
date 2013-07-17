//
//  User.h
//  Interface
//
//  Created by Admin on 7/9/13.
//  Copyright (c) 2013 com.Stribog. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class User;

@interface User : NSManagedObject

@property (nonatomic, retain) NSNumber * code;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * printer;
@property (nonatomic, retain) NSSet *relationshipUserToZones;
@end

@interface User (CoreDataGeneratedAccessors)

- (void)addRelationshipUserToZonesObject:(User *)value;
- (void)removeRelationshipUserToZonesObject:(User *)value;
- (void)addRelationshipUserToZones:(NSSet *)values;
- (void)removeRelationshipUserToZones:(NSSet *)values;

@end
