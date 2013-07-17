//
//  ViewControllerArrival.m
//  Interface
//
//  Created by Admin on 6/21/13.
//  Copyright (c) 2013 com.Stribog. All rights reserved.
//

#import "ViewControllerArrival.h"
#import "TDProduction.h"
#import "MyCoreData.h"
#import "TableViewControllerSelectZone.h"



@interface ViewControllerArrival ()

@end


@implementation ViewControllerArrival
@synthesize currentZone;


MyCoreData *myDataBase;
NSString   *_barcode;
//NSString   *currentUserZone;

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //[self.tableView reloadData];
    
    NSLog(@"Это событе  - (void)viewWillAppear:(BOOL)animated");
   // self.textViewZone.text = currentUserZone;
    NSLog(@"   viewWillAppear currentZone =%@",currentZone);
   
    // получаем текущие настройки пользователя
    myDataBase = [[MyCoreData alloc] init];
    self.textFieldUser.text = [myDataBase GetUserName];
    self.textViewZone.text  = [myDataBase GetUserZone];
   
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}



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
         OperationCode:@"arrival"
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
    NSLog(@"Это событие - (void)viewDidLoad");
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.

    // подключаем сканер
    dtdev = [DTDevices sharedDevice];
    [dtdev addDelegate:self];
    [dtdev connect];

    
    
    
    // получаем текущие настройки пользователя
   // myDataBase = [[MyCoreData alloc] init];
   
    // currentUserZone = [myDataBase GetUserZone];
    //NSLog(@"viewDidLoad currentUserZone =%@",currentUserZone);
    
    
    //self.textFieldUser.text = [myDataBase GetUserName];
    //self.textViewZone.text  = [myDataBase GetUserZone];
    
    currentZone = [myDataBase GetUserZone];    // отладка
    NSLog(@"   currentZone =%@", currentZone); // отладка
    
    //self.textViewZone.text  =@"Это очень длинное название для доступной зоны которое может быть";
    //self.textFieldZone.text  =@"Это очень длинное название для доступной зоны которое может быть";
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setTextFieldUser:nil];
    //[self setTextFieldZone:nil];
    [self setTextViewZone:nil];
    [super viewDidUnload];
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

/*
 - (IBAction)textFieldZoneTouchUpInside:(id)sender {
}
*/


// Этот метод будет вызываться из TableViewControllerSelectZone  когда будет необходимо вернуть выбранное значение
- (void) setCurrentZone:(NSString *)newZone// тип NSString далее планируется заменить на класс Zone
{
    NSLog(@"Начало метода setCurrentZone ");
    NSLog(@"    newZone     =%@",newZone);
    NSLog(@"    currentZone(старое значение) =%@",currentZone);

    
    
    if (![newZone isEqual:currentZone]) {
        currentZone = newZone;
        
    }else{
        NSLog(@"   newZone isEqual:currentZone");
    }
    
    NSLog(@"    currentZone(новое значение) =%@",currentZone);
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"Начало метода prepareForSegue");
    
    if ([[segue identifier] isEqualToString:@"segueSelectZone" ]) {
        
        NSLog(@"   Провалились в условие if ([[segue identifier] isEqualToString:@'segueSelectZone' ])");
        TableViewControllerSelectZone *destination = segue.destinationViewController; //= [segue destinationViewController];
        
        // проверяем доступена ли в данном контроллере переменная delegate. setDelegate - стандартный метод для установлки значения переменной
        if ([destination respondsToSelector:@selector(setDelegate:)]) {
           
            NSLog(@"      Провалились в условие if ([destination respondsToSelector:@selector(setDelegate:)])");
            [destination setValue:self forKey:@"delegate"];
        
        }
        
        // проверяем доступна ли в этом контроллере переменная currentZone в нее будем передавать данные
        if ([destination respondsToSelector:@selector(setSelection:)]) {
            NSLog(@"      Провалились в условие if ([destination respondsToSelector:@selector(setSelection:)])");
            
            // передаем данные
            NSString *selection = currentZone;
            //[destination setValue:selection forKey:@"currentZone"];
            destination.currentZone = currentZone;
        }
    }
}


@end
