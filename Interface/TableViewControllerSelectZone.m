//
//  TableViewControllerSelectZone.m
//  Interface
//
//  Created by Admin on 7/3/13.
//  Copyright (c) 2013 com.Stribog. All rights reserved.
//

#import "TableViewControllerSelectZone.h"

@interface TableViewControllerSelectZone ()

@end

@implementation TableViewControllerSelectZone

@synthesize delegate;
@synthesize currentZone;

//@synthesize zones;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    
    NSLog(@"Начало метода viewDidLoad");
    
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;

    self.title = @"Доступные зоны";
    
    zones =[[NSMutableArray alloc] init];
    [zones addObject:@"Тестовая зона 1"];
    [zones addObject:@"Тестовая зона 2"];
    [zones addObject:@"Тестовая зона 3"];
    [zones addObject:@"Тестовая зона 4"];
    [zones addObject:@"Тестовая зона 5"];
    
    NSLog(@"   zones count=%d", zones.count);
    NSLog(@"   полученное значение currentZone=%@", currentZone);
    
    
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    //return 0;
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
   
    NSLog(@"!!!zones.count=%d",zones.count);
    
    //return 0;
    //return 1;
    return zones.count; // ВЫЛЕТАЕТ С ОШИБКОЙ
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Начало функции cellForRowAtIndexPath:");
    if (tableView == nil) {
        NSLog(@"   !!! tableView == nil");
    }
    static NSString *CellIdentifier = @"Cell";
    
    // для iOS 6
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];// при попытке выполнения на iOS 5 вылетает с ошибкой.
    
    
    
    
    //-> для iOS 5
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    //<-
    // Configure the cell...

    if (cell == nil) {
        NSLog(@"   cell == nil");
        cell =[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = [zones objectAtIndex:indexPath.row];

 return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
    
    NSLog(@"Выбрали строку %@", [zones objectAtIndex:indexPath.row]);
    //self.currentZone = [zones objectAtIndex:indexPath.row];
    currentZone = [zones objectAtIndex:indexPath.row];
    NSLog(@"   currentZone =%@", currentZone);
    NSLog(@" ");

}


- (void)viewWillDisappear:(BOOL)animated_
{
    NSLog(@"Начало метода viewWillDisappear");
    NSLog(@"   currentZone до передачи =%@", currentZone);
    
    [super viewWillDisappear:animated_];
    
    if ([delegate respondsToSelector:@selector(setCurrentZone:)]) {
        
        NSLog(@"   Провалились в условие if ([delegate respondsToSelector:@selector(setCurrentZone:)])");
        //NSString *currentZoneToSend = currentZone;
        
        
        [delegate setValue:currentZone forKey:@"currentZone"]; // возвращаем новое значение в delegate
        
        
        [delegate setCurrentZone:currentZone];// вызываем метод из delegate
    
    }
    //[delegate setValue:self.currentZone forKey:@"currentZone"];

    
}


- (void)viewDidUnload {
    [self setTableView:nil];
    [super viewDidUnload];
}


@end
