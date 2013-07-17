//
//  ViewController.m
//  Interface
//
//  Created by Admin on 6/6/13.
//  Copyright (c) 2013 com.Stribog. All rights reserved.
//

#import "ViewController.h"
#import "TDProduction.h"
#import "ViewControllerDetalInfo.h"


@interface ViewController ()

@end
@implementation ViewController
@synthesize labelBarCode;
//@synthesize textViewFullName;
//@synthesize textFieldTest;// для тестирования
@synthesize textFieldTest;

NSString *_barcode;
TDTraceObject *myTDTraceObject;

-(void)connectionState:(int)state
{
    // здесь необходимо устанавливать доступность для кнопки "Сканировать"
    // если сканер не подключен, то вывести сообщение что сканер не подключен и заблокировать кнопку сканировать
}

- (void)viewDidLoad
{
    //->
    dtdev = [DTDevices sharedDevice];
    [dtdev addDelegate:self];
    //labelBarCode.text = @"отработал - (void)viewDidLoad";
    [dtdev connect];
    //<-
    
    
    //->
    
    //<-
    
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //->20.06.2013
    //                   распознование жестов
    // Инстанцируем объект
    self.swipeGestureRecognizerRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipes:)];
    
    // необходимо обнаруживать жесты смахивания направленные слева направо
    self.swipeGestureRecognizerRight.direction = UISwipeGestureRecognizerDirectionRight;
    
    // только одним пальцем
    self.swipeGestureRecognizerRight.numberOfTouchesRequired = 1;
    // добавляем к виду
    [self.view addGestureRecognizer:self.swipeGestureRecognizerRight];
    //<-20.06.2013

    
}

    //->20.06.2013
- (void) handleSwipes:(UISwipeGestureRecognizer *)paramSender{
    [self dismissModalViewControllerAnimated:YES];// закрываем текущий экран НЕ РАБОТАЕТ
}
    //<-20.06.2013

-(void)barcodeData:(NSString *)barcode type:(int)type
{
    // если что то сосканировалось то обрабатываем в этом методе
    
    
    /*// код из демо
     NSMutableString *status;
     
     [status setString:@""];
     
     [status appendFormat:@"Type: %d\n",type];
     [status appendFormat:@"Type text: %@\n",[dtdev barcodeType2Text:type]];
     [status appendFormat:@"Barcode: %@",barcode];
     */
    
    //->
    //[myLabel setText:status];
    //myLabel.text            = barcode;
    //myLabelBarcodeType.text = [myDevice barcodeType2Text:type];
    //labelBarCode.text         = barcode;
    //<-
    
    _barcode          = barcode;
    labelBarCode.text = barcode;
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setLabelBarCode:nil];
    [self setTextFieldTest:nil];
    [self setSwipeGestureRecognizerRight:nil];
    [super viewDidUnload];
}
- (IBAction)buttonScanTouchDown:(id)sender
{
    NSError *error = nil;
    [dtdev barcodeStartScan:&error];
}

- (IBAction)buttonScanTouchUpInside:(id)sender {
    
    NSError *error = nil;
    //[dtdev barcodeStartScan:&error];
    [dtdev barcodeStopScan:&error];
    

    /*
    //->18.06.2013
    TDProduction* service = [TDProduction service];
	service.logging = YES;
    service.username = @"Adm";
    service.password = @"mad";
    
    [service GetInfo:self action:@selector(GetInfoHandler:) Barcode: _barcode];//боевой режим
    //[service GetInfo:self action:@selector(GetInfoHandler:) Barcode: @"20120000075809"];//отладка
    //<-18.06.2013
    */
    
    
    
}



-(void)GetInfoHandler: (id) result {
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
}


- (IBAction)buttonGetInfoTouchUpInside:(id)sender {
  
  
    //->20.06.2013
    // запускаем PhjuressHUD
    HUD = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    HUD.delegate = self;
    HUD.labelText = @"Запрос сервера";
    //[HUD showWhileExecuting:@selector(GetInfoHandler) onTarget:self withObject:nil animated:YES];
    
    //<-20.06.2013
 
    
    
    TDProduction* service = [TDProduction service];
	service.logging = YES; // выводить лог
    //service.logging = NO;// в релизе использовать данный вариант
	service.username = @"Adm";
    service.password = @"mad";
    
    
    [service GetInfo:self action:@selector(GetInfoHandler:) Barcode: _barcode]; // боевой режим
    //[service GetInfo:self action:@selector(GetInfoHandler:) Barcode: @"20120000075809"];// отладка
   
    //sleep(3);
    //->20.06.2013
    //[MBProgressHUD hideHUDForView:self.view animated:YES];
    //<-20.06.2013
    //[self performSegueWithIdentifier:@"segueTest" sender:self];
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"===============");
    NSLog(@"Source Controller      = %@", [segue sourceViewController]);
    NSLog(@"Destination Controller = %@", [segue destinationViewController]);
    NSLog(@"Segue Identifier       = %@", [segue identifier]);
   
    //if ([[segue identifier] isEqualToString:@"segueDetailInfo"]) {
    if ([[segue identifier] isEqualToString:@"segueTest"]) {
        NSLog(@"Поймали переход по сегвейю с экрана сканирования на экран детальной информации");
        
        ViewControllerDetalInfo *viewControllerDetailInfo = [segue destinationViewController];
        
        viewControllerDetailInfo.traceObject = myTDTraceObject;
        //viewControllerDetailInfo.gettingString = @"20130618 этот текст передан из сегвейя";// работает
        
        
    
    }else{
        NSLog(@"Поймали неидентифицированный переход по сегвейю ");
    }
    
    
}

- (IBAction)buttonPrintTouchUpInside:(id)sender
{
    // включить HUD
    HUD = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    HUD.delegate = self;
    HUD.labelText = @"Печать этикетки";
    
    // вызываем веб-сервис печати штрихкода
    TDProduction* service = [TDProduction service];
	service.logging = YES; // выводить лог
    //service.logging = NO;// в релизе использовать данный вариант
	service.username = @"Adm";
    service.password = @"mad";
    
    [service PrintBarcode:self
              action:@selector(RecivePrintStatus:)
              Barcode:_barcode
              PrinterName:@"zebraTMP2 - подменный"// надо подставлять из настроек пользователя
     ];
    
}


-(void) RecivePrintStatus:(id) value
{
   // Отключаем HUD
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    if ([value isKindOfClass:[NSError class]])
    {
        NSLog(@"%@", value);
        return;
    }
    if ([value isKindOfClass:[SoapFault class]])
    {
        NSLog(@"%@", value);
        return;
    }
    
    NSNumber* result = (NSNumber*) value;
    if (result.intValue == 0 ) {
        
    }
    
}

@end
