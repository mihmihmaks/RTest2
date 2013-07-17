//
//  ViewController2.m
//  Interface
//
//  Created by Admin on 6/7/13.
//  Copyright (c) 2013 com.Stribog. All rights reserved.
//

#import "ViewControllerDetalInfo.h"

@interface ViewControllerDetalInfo ()

@end

@implementation ViewControllerDetalInfo
@synthesize
    textViewFullName,          // полное наименование
    textFieldSerialNumber,     // серийный номер
    textFieldSerialNamberCode, // код
    textViewLastOperationName, // последняя операция,
    textFieldMfg,              // производственное задание
    traceObject; // объект содержащий ответ сервера по веб запросу GetInfo


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    //textViewFullName.text = @"ZZZ";// отображается
    //textViewFullName.text = traceObject.NomenclFullName; // не отображается
    
    textViewFullName.text          = traceObject.NomenclFullName;
    textFieldSerialNumber.text     = traceObject.SerialNumber;
    textFieldSerialNamberCode.text = [NSString stringWithFormat:@"%d", traceObject.SerialNumberCode] ;
    textViewLastOperationName.text = traceObject.LastOperationName;
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"dd/MM/yyyy"];
    textFieldMfg.text              = [NSString stringWithFormat:@"№%@ от %@",
                                      traceObject.MfgNumber,
                                      [dateFormat stringFromDate:traceObject.MfgDate]];
    
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    //->20.06.2013
    
    //                   распознование жестов
    // Инстанцируем объект
    self.swipeGestureRecognizerRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipes:)];
    self.swipeGestureRecognizerDown = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipes:)];
    
    // необходимо обнаруживать жесты смахивания направленные слева направо
    self.swipeGestureRecognizerRight.direction = UISwipeGestureRecognizerDirectionRight;
    self.swipeGestureRecognizerRight.direction = UISwipeGestureRecognizerDirectionDown;
    
    // только одним пальцем
    self.swipeGestureRecognizerRight.numberOfTouchesRequired = 1;
    self.swipeGestureRecognizerDown.numberOfTouchesRequired  = 1;
    // добавляем к виду
    [self.view addGestureRecognizer:self.swipeGestureRecognizerRight];
    [self.view addGestureRecognizer:self.swipeGestureRecognizerDown];
    //<-20.06.2013
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setTextViewFullName:nil];
    [self setTextFieldTest:nil];
    [self setTextFieldSerialNumber:nil];
    [self setTextFieldSerialNamberCode:nil];
    [self setTextViewLastOperationName:nil];
    [self setTextFieldMfg:nil];
    [self setSwipeGestureRecognizerRight:nil];
    [self setSwipeGestureRecognizerDown:nil];
    [super viewDidUnload];
}
- (IBAction)buttonBackTouchUpInside:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
}

//->20.06.2013
- (void) handleSwipes:(UISwipeGestureRecognizer *)paramSender{
    [self dismissModalViewControllerAnimated:YES];
}
//<-20.06.2013
@end
