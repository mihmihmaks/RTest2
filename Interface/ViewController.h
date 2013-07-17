//
//  ViewController.h
//  Interface
//
//  Created by Admin on 6/6/13.
//  Copyright (c) 2013 com.Stribog. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DTDevices.h"
#import "MBProgressHUD.h"
//->24.06.2013
//<-24.06.2013

@interface ViewController : UIViewController
{
    MBProgressHUD *HUD;
    DTDevices *dtdev;
}

@property (strong, nonatomic) IBOutlet UISwipeGestureRecognizer *swipeGestureRecognizerRight;
@property (strong, nonatomic) IBOutlet UITextField *labelBarCode; // экран "Информация об изделии" label отображения штрихкода
- (IBAction)buttonScanTouchDown:(id)sender;
- (IBAction)buttonScanTouchUpInside:(id)sender; // экран "Информация об изделии" обработчик нажатия кнопки "Сканировать"
- (IBAction)buttonGetInfoTouchUpInside:(id)sender; // экран "Информация об изделии" обработчик нажатия кнопки "Получить информацию"
- (IBAction)buttonPrintTouchUpInside:(id)sender; // обработчик нажатия кнопки "Печать"
//@property (strong, nonatomic) IBOutlet UITextView *textViewFullName;
//@property (strong, nonatomic) IBOutlet UITextField *textFieldTest;// для тестирования
@property (strong, nonatomic) IBOutlet UITextField *textFieldTest;



@end
