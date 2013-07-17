//
//  Zones.h
//  Interface
//
//  Created by Admin on 7/9/13.
//  Copyright (c) 2013 com.Stribog. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Resources, User;

@interface Zones : NSManagedObject

@property (nonatomic, retain) NSNumber * code;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) User *relationshipZonesToUser;
@property (nonatomic, retain) NSSet *relationshipZonesToResource;
@end

@interface Zones (CoreDataGeneratedAccessors)

- (void)addRelationshipZonesToResourceObject:(Resources *)value;
- (void)removeRelationshipZonesToResourceObject:(Resources *)value;
- (void)addRelationshipZonesToResource:(NSSet *)values;
- (void)removeRelationshipZonesToResource:(NSSet *)values;

@end
