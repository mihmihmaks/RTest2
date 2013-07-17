//
//  TableViewControllerSelectZone.h
//  Interface
//
//  Created by Admin on 7/3/13.
//  Copyright (c) 2013 com.Stribog. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewControllerSelectZone : UITableViewController{
    NSMutableArray *zones;

}

@property (nonatomic,strong) NSString *currentZone;
@property (weak, nonatomic) id delegate;

@end
