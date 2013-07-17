//
//  Operations.h
//  Interface
//
//  Created by Admin on 7/9/13.
//  Copyright (c) 2013 com.Stribog. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Resources;

@interface Operations : NSManagedObject

@property (nonatomic, retain) NSNumber * code;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) Resources *relationshipOperationsToResources;

@end
