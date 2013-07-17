//
//  ViewController1.m
//  Interface
//
//  Created by Admin on 6/23/13.
//  Copyright (c) 2013 com.Stribog. All rights reserved.
//

#import "ViewController1.h"

#import "UIDevice-Hardware.h"
#import "TDProduction.h"

#import "MyCoreData.h"


@interface ViewController1 ()

@end


@implementation ViewController1

TDUser *myTDUser;
NSString *macaddr;

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
    UIDevice* device = [UIDevice alloc];
    //NSString *macaddr = device.macaddress;//
    macaddr = device.macaddress;
    NSLog(@"!!! macaddr =%@",macaddr);
     
     
     //NSLog(@"!!! device.identifierForVendor =%@",device.identifierForVendor);
     // NSLog(@"!!! device.uniqueIdentifier =%@",device.uniqueIdentifier);
    
    
        
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    HUD = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    HUD.delegate = self;
    HUD.labelText = @"Запрос сервера";
    
    
    TDProduction* service = [TDProduction service];
	service.logging = YES; // выводить лог
    //service.logging = NO;// в релизе использовать данный вариант
	//service.username = @"Adm";
    //service.password = @"mad";

    [service GetInitalDBFromMacAddress:self
             action:@selector(GetInitalDBFromMacAddressHandler:)
             MacAddress:macaddr];
   
   
    
    //NSLog(@" myTDUser.Name=%@",myTDUser.Name);   // выводит nil
    //NSLog(@" myTDUser.Zones=%@",myTDUser.Zones); // выводит nil
}

//- (void) GetInitalDBFromMacAddressHandler: (id) value {
- (void) GetInitalDBFromMacAddressHandler: (id) result {
    // выключаем ProgressHUD
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    
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
    
    myTDUser = (TDUser*)result;
 
    NSLog(@" myTDUser.Name=%@",myTDUser.Name);
    
    NSLog(@" myTDUser.Zones.count=%d", myTDUser.Zones.count);
    
    for (int i=0; i < [myTDUser.Zones count]; i++) {
       
        NSLog(@" myTDUser.Zones.Name=%@",[[myTDUser.Zones objectAtIndex:i] Name]);
        NSLog(@"    Resources.count=%d", [[[myTDUser.Zones objectAtIndex:i] Resources] count]);
        
        for (int j=0; j < [[[myTDUser.Zones objectAtIndex:i] Resources] count]; j++) {
            NSLog(@"        myTDUser.Zones.Recource.Name=%@", [[[[myTDUser.Zones objectAtIndex:i] Resources] objectAtIndex:j] Name]);
            NSLog(@"            Operations.count=%d", [[[[[myTDUser.Zones objectAtIndex:i] Resources] objectAtIndex:j] Operations] count] );
            
         
            for (int n=0; n < [[[[[myTDUser.Zones objectAtIndex:i ] Resources] objectAtIndex:j] Operations]  count]; n++) {
                NSLog(@"            myTDUser.Zones.Recource.Operaton.Name=%@", [[[[[[myTDUser.Zones objectAtIndex:i] Resources] objectAtIndex:j] Operations] objectAtIndex:n] Name] );
            }
        }
    }
    
    
    
    return; // отладка
    
 //   NSLog(@" myTDUser.Zones=%@",myTDUser.Zones.Name);
 //   NSLog(@" myTDUser.ZonesCode=%@",myTDUser.Zones.Code);
    
 
    
 /*   UIAlertView* alert = [[UIAlertView alloc] initWithTitle:self.title
                                          message:[NSString stringWithFormat:@"Пользователь: %@ Зона: %@",myTDUser.Name, myTDUser.Zones.Name]
                                          delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles: nil];
    [alert show];
*/
    

    MyCoreData *myDataBase = [[MyCoreData alloc ] init] ;
 /*   [myDataBase createNewUserWithName:myTDUser.Name
                                 code:myTDUser.Code
                                zone1:myTDUser.Zones.Name
                            zone1Code:myTDUser.Zones.Code
                           macaddress:macaddr];
 */   
    
/*    //[MBProgressHUD hideHUDForView:self.view animated:YES];
    
    
	// Handle errors
	if([value isKindOfClass:[NSError class]]) {
		NSLog(@"%@", value);
		NSNumber *count = [Zones MR_numberOfEntities];
        if (count==0) {
            UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Проблема" message:@"Сервер недоступен и нет сохраненных настроек" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alert show];
        }else {
            if ([self.title isEqualToString:@"StartSIP"]) { UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Проблема" message:@"Сервер недоступен используются сохраненные настройки" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
                
                //Переход дальше
                UIStoryboard *storyboard=self.storyboard;
                UIViewController  *pick = [storyboard instantiateViewControllerWithIdentifier:@"MainMenu"];
                //
                
                [self presentViewController:pick animated:YES completion:nil];
                [alert show];
            }
        }
        
        
        return;
	}
    
	// Handle faults
	if([value isKindOfClass:[SoapFault class]]) {
		NSLog(@"%@", value);
        NSNumber *count = [Zones MR_numberOfEntities];
        if (count==0) {
            UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Проблема" message:@"Сервер недоступен и нет сохраненных настроек" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alert show];
        }else if ([self.title isEqualToString:@"StartSIP"]) { UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Проблема" message:@"Сервер недоступен используются сохраненные настройки" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
            
            //Переход дальше
            UIStoryboard *storyboard=self.storyboard;
            UIViewController  *pick = [storyboard instantiateViewControllerWithIdentifier:@"MainMenu"];
            //
            
            [self presentViewController:pick animated:YES completion:nil];
            [alert show];
            
            
            
        }
		return;
	}
    
    
	// Do something with the r1User* result
    r1User* result = (r1User*)value;
    // NSInteger count = [result.Zones count];
    
	NSLog(@"GetInitalDB returned the value: %@", result);
    //1.Проверить результат, если Error не  nil, надо обработать ошибку, если настройки имеются можно продолжать
    
    // 2. Заполняем базу данных полученными настройками
    if (result.Code==0) {
        
        //Есть ли настройки?
        NSNumber *count = [Zones MR_numberOfEntities];
        if (count==0) {
            UIAlertView* alert = [[UIAlertView alloc] initWithTitle:self.title message:@"Сервер недоступен и нет сохраненных настроек" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alert show];
            return;
        }else {
            UIAlertView* alert = [[UIAlertView alloc] initWithTitle:self.title message:@"Сервер недоступен используются сохраненные настройки" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alert show];
            //Переход дальше
            UIStoryboard *storyboard=self.storyboard;
            UIViewController  *pick = [storyboard instantiateViewControllerWithIdentifier:@"MainMenu"];
            //
            
            [self presentViewController:pick animated:YES completion:nil];
            
        }
    } else {
        [self InitSettings:result];
        //Переход дальше
        UIStoryboard *storyboard=self.storyboard;
        UIViewController  *pick = [storyboard instantiateViewControllerWithIdentifier:@"MainMenu"];
        //
        
        [self presentViewController:pick animated:YES completion:nil];
        
    }
    
*/
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
