//
//  ViewControllerDeparture.h
//  Interface
//
//  Created by Admin on 6/21/13.
//  Copyright (c) 2013 com.Stribog. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DTDevices.h"

@interface ViewControllerDeparture : UIViewController
{
    DTDevices *dtdev;
}

- (IBAction)buttonScanTouchDown:(id)sender;
- (IBAction)buttonScanTouchUpInside:(id)sender;
- (IBAction)buttonScanTouchUpOutside:(id)sender;
- (IBAction)textFieldUserTouchUpInside:(id)sender;
- (IBAction)textFieldZoneTouchUpInside:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *textFieldUser;
@property (strong, nonatomic) IBOutlet UITextField *textFieldZone;

@end
