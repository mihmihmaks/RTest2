//
//  ViewController2.h
//  Interface
//
//  Created by Admin on 6/7/13.
//  Copyright (c) 2013 com.Stribog. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TDProduction.h"


@interface ViewControllerDetalInfo : UIViewController
- (IBAction)buttonBackTouchUpInside:(id)sender;
@property (strong, nonatomic) IBOutlet UISwipeGestureRecognizer *swipeGestureRecognizerRight;
@property (strong, nonatomic) IBOutlet UISwipeGestureRecognizer *swipeGestureRecognizerDown;
@property (strong, nonatomic) IBOutlet UITextView  *textViewFullName;
@property (strong, nonatomic) IBOutlet UITextField *textFieldTest;
@property (strong, nonatomic) IBOutlet UITextField *textFieldSerialNumber;
@property (strong, nonatomic) IBOutlet UITextField *textFieldSerialNamberCode;
@property (strong, nonatomic) IBOutlet UITextView *textViewLastOperationName;
@property (strong, nonatomic) IBOutlet UITextField *textFieldMfg;
@property (strong, nonatomic) TDTraceObject        *traceObject;
@property (strong, nonatomic) NSString             *gettingString;
@end 
