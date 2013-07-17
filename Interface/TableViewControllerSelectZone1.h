//
//  TableViewControllerSelectZone1.h
//  Interface
//
//  Created by Admin on 7/2/13.
//  Copyright (c) 2013 com.Stribog. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewControllerSelectZone1 : UITableViewController
//->
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UITableViewCell *tableVewCell;


//@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *zones;
//<-
@end
