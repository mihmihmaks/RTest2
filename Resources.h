//
//  Resources.h
//  Interface
//
//  Created by Admin on 7/9/13.
//  Copyright (c) 2013 com.Stribog. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Resources : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * code;
@property (nonatomic, retain) NSManagedObject *relationshipResourcesToZones;
@property (nonatomic, retain) NSSet *relationshipResourcesToOperations;
@end

@interface Resources (CoreDataGeneratedAccessors)

- (void)addRelationshipResourcesToOperationsObject:(NSManagedObject *)value;
- (void)removeRelationshipResourcesToOperationsObject:(NSManagedObject *)value;
- (void)addRelationshipResourcesToOperations:(NSSet *)values;
- (void)removeRelationshipResourcesToOperations:(NSSet *)values;

@end
