//
//  ViewControllerDeparture.m
//  Interface
//
//  Created by Admin on 6/21/13.
//  Copyright (c) 2013 com.Stribog. All rights reserved.
//

#import "ViewControllerDeparture.h"
#import "TDProduction.h"
#import "MyCoreData.h"



@interface ViewControllerDeparture ()

@end

@implementation ViewControllerDeparture

MyCoreData *myDataBase;
NSString   *_barcode;

-(void)barcodeData:(NSString *)barcode type:(int)type
{
    // если что то сосканировалось то обрабатываем в этом методе
    
    _barcode          = barcode;
    
    NSLog(@"Получили штрихкод =%@",barcode);
    
    // тут делаем что надо со штрихкодом
    //labelBarCode.text = barcode;
    
    
    //->18.06.2013
    TDProduction* service = [TDProduction service];
    service.logging = YES;
    //service.username = @"Adm";
    //service.password = @"mad";
    
    
    NSLog(@" [myDataBase GetUserZoneCode]= %@", [myDataBase GetUserZoneCode]);
    
    [service PutRecord:self action:@selector(PutRecordHandler:)
         DateOperation:[NSDate date]
              ZoneCode:[myDataBase GetUserZoneCode]
          ResourceCode:@""
         OperationCode:@"departure"
         BarcodeBefore:barcode
          BarcodeAfter:barcode
              UserCode:[myDataBase GetUserCode]
                 State: 1];
    
}

-(void)PutRecordHandler: (id) result {
    
    NSLog(@" PutRecord вернул = %@", result);
    
    
    /*
     //->20.06.2013
     // выключаем ProgressHUD
     [MBProgressHUD hideHUDForView:self.view animated:YES];
     //<-20.06.2013
     
     if([result isKindOfClass: [NSError class]]) {
     // If an error has occurred, handle it
     
     UIAlertView *AlertView = [[UIAlertView alloc]
     initWithTitle:@"Ошибка" // текст заголовка
     message:@"Ошибка сети" // текст сообщения
     delegate:nil
     cancelButtonTitle:@"Закрыть"// текст на кнопке отмены
     otherButtonTitles:nil, nil];
     [AlertView show];
     
     return;
     }
     
     if([result isKindOfClass: [SoapFault class]]) {
     // If a server error has occurred, handle it
     UIAlertView *AlertView = [[UIAlertView alloc]
     initWithTitle:@"Ошибка"
     message:@"Ошибка 1С"
     delegate:nil
     cancelButtonTitle:@"Это текст на кнопке отмены"
     otherButtonTitles:nil, nil];
     [AlertView show];
     
     return;
     }
     
     // Actually do something with the result...
     //self.myDataArray = (NSMutableArray*)result;
     
     //TDTraceObject* myTDTraceObject = (TDTraceObject*)result;// работает, но  при выходе из  {} удаляет объект
     myTDTraceObject = (TDTraceObject*)result;// работает
     NSLog(@"-(void)GetInfoHandler: (id) result myTDTraceObject.NomenclFullName = %@ ", myTDTraceObject.NomenclFullName);
     
     textFieldTest.text = myTDTraceObject.NomenclFullName;// для отладки
     //->20.06.2013
     //[MBProgressHUD hideHUDForView:self.view animated:YES];
     [self performSegueWithIdentifier:@"segueTest" sender:self];//вызываем переход на страницу детальной информации
     //<-20.06.2013
     */
}



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
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    // подключаем сканер
    dtdev = [DTDevices sharedDevice];
    [dtdev addDelegate:self];
    [dtdev connect];
    
    // получаем текущие настройки пользователя
    myDataBase = [[MyCoreData alloc] init];
    self.textFieldUser.text = [myDataBase GetUserName];
    self.textFieldZone.text = [myDataBase GetUserZone];
    

}

- (void)viewDidUnload {
    [self setTextFieldUser:nil];
    [self setTextFieldZone:nil];
    [super viewDidUnload];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonScanTouchDown:(id)sender {
    
    NSError *error = nil;
    [dtdev barcodeStartScan:&error];
    
}

- (IBAction)buttonScanTouchUpInside:(id)sender {
    
    NSError *error = nil;
    [dtdev barcodeStopScan:&error];
    
}

- (IBAction)buttonScanTouchUpOutside:(id)sender {
    
    NSError *error = nil;
    [dtdev barcodeStopScan:&error];
    
}

- (IBAction)textFieldUserTouchUpInside:(id)sender {
}

- (IBAction)textFieldZoneTouchUpInside:(id)sender {
}


@end
