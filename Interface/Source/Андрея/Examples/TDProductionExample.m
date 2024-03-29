/*
	TDProductionExample.m
	Provides example and test runs the service's proxy methods.
	Generated by SudzC.com
*/
#import "TDProductionExample.h"
#import "TDProduction.h"

@implementation TDProductionExample

- (void)run {
	// Create the service
	TDProduction* service = [TDProduction service];
	service.logging = YES;
	// service.username = @"username";
	// service.password = @"password";
	

	// Returns NSString*. 
	[service CreateBlank:self action:@selector(CreateBlankHandler:) InputBarcode: @"" NumberMfg: @"" YearMfg: @"" NomenclCode: 0];

	// Returns NSString*. 
	[service CreateBlankEx:self action:@selector(CreateBlankExHandler:) InputBarcode: @"" NumberMfg: @"" YearMfg: @"" NomenclCode: 0 NomenclSubType: @""];

	// Returns NSString*. 
	[service CreateDocControl:self action:@selector(CreateDocControlHandler:) NumberMfg: @"" YearMfg: @"" NomenclMfgCode: 0 NomenclCode: 0 InputBarcode: @"" ZoneCode: @"" UserCode: @""];

	// Returns NSString*. 
	[service CreateWaste:self action:@selector(CreateWasteHandler:) InputBarcode: @"" Lenght: 0 Width: 0];

	// Returns NSString*. 
	[service CreateWasteEx:self action:@selector(CreateWasteExHandler:) InputBarcode: @"" Lenght: 0 Width: 0 Lenght1: 0 Width1: 0];

	// Returns TDTraceObject*. 
	[service GetInfo:self action:@selector(GetInfoHandler:) Barcode: @""];

	// Returns TDUser*. 
	[service GetInitalDB:self action:@selector(GetInitalDBHandler:) UserCode: @""];

	// Returns TDUser*. 
	[service GetInitalDBFromMacAddress:self action:@selector(GetInitalDBFromMacAddressHandler:) MacAddress: @""];

	// Returns TDMfgOrder*. 
	[service GetMfg:self action:@selector(GetMfgHandler:) NumberMfg: @"" YearMfg: @""];

	// Returns TDMfgOrderEx*. 
	[service GetMfgEx:self action:@selector(GetMfgExHandler:) NumberMfg: @"" YearMfg: @""];

	// Returns TDPrinterList*. 
	[service GetPrinters:self action:@selector(GetPrintersHandler:)];

	// Returns TDNomenclSpec*. 
	[service GetSpecNomencl:self action:@selector(GetSpecNomenclHandler:) NomenclCode: 0];

	// Returns NSString*. 
	[service GetVersion:self action:@selector(GetVersionHandler:)];

	// Returns NSString*. 
	[service GetVersionLogistics:self action:@selector(GetVersionLogisticsHandler:)];

	// Returns TDStateObjectList*. 
	[service ObjectsInZone:self action:@selector(ObjectsInZoneHandler:) ZoneCode: @""];

	// Returns TDStateObjectList*. 
	[service ObjectsOnOperation:self action:@selector(ObjectsOnOperationHandler:) ZoneCode: @""];

	// Returns int. 
	[service PrintBarcode:self action:@selector(PrintBarcodeHandler:) Barcode: @"" PrinterName: @""];

	// Returns NSString*. 
	[service PutOnStorage:self action:@selector(PutOnStorageHandler:) Barcode: @"" ZoneCode: @"" UserCode: @""];

	// Returns NSString*. 
	[service PutRecord:self action:@selector(PutRecordHandler:) DateOperation: [NSDate date] ZoneCode: @"" ResourceCode: @"" OperationCode: @"" BarcodeBefore: @"" BarcodeAfter: @"" UserCode: @"" State: 0];

	// Returns int. 
	[service TestConnection:self action:@selector(TestConnectionHandler:)];
}

	

// Handle the response from CreateBlank.
		
- (void) CreateBlankHandler: (id) value {

	// Handle errors
	if([value isKindOfClass:[NSError class]]) {
		NSLog(@"%@", value);
		return;
	}

	// Handle faults
	if([value isKindOfClass:[SoapFault class]]) {
		NSLog(@"%@", value);
		return;
	}				
			

	// Do something with the NSString* result
		NSString* result = (NSString*)value;
	NSLog(@"CreateBlank returned the value: %@", result);
			
}
	

// Handle the response from CreateBlankEx.
		
- (void) CreateBlankExHandler: (id) value {

	// Handle errors
	if([value isKindOfClass:[NSError class]]) {
		NSLog(@"%@", value);
		return;
	}

	// Handle faults
	if([value isKindOfClass:[SoapFault class]]) {
		NSLog(@"%@", value);
		return;
	}				
			

	// Do something with the NSString* result
		NSString* result = (NSString*)value;
	NSLog(@"CreateBlankEx returned the value: %@", result);
			
}
	

// Handle the response from CreateDocControl.
		
- (void) CreateDocControlHandler: (id) value {

	// Handle errors
	if([value isKindOfClass:[NSError class]]) {
		NSLog(@"%@", value);
		return;
	}

	// Handle faults
	if([value isKindOfClass:[SoapFault class]]) {
		NSLog(@"%@", value);
		return;
	}				
			

	// Do something with the NSString* result
		NSString* result = (NSString*)value;
	NSLog(@"CreateDocControl returned the value: %@", result);
			
}
	

// Handle the response from CreateWaste.
		
- (void) CreateWasteHandler: (id) value {

	// Handle errors
	if([value isKindOfClass:[NSError class]]) {
		NSLog(@"%@", value);
		return;
	}

	// Handle faults
	if([value isKindOfClass:[SoapFault class]]) {
		NSLog(@"%@", value);
		return;
	}				
			

	// Do something with the NSString* result
		NSString* result = (NSString*)value;
	NSLog(@"CreateWaste returned the value: %@", result);
			
}
	

// Handle the response from CreateWasteEx.
		
- (void) CreateWasteExHandler: (id) value {

	// Handle errors
	if([value isKindOfClass:[NSError class]]) {
		NSLog(@"%@", value);
		return;
	}

	// Handle faults
	if([value isKindOfClass:[SoapFault class]]) {
		NSLog(@"%@", value);
		return;
	}				
			

	// Do something with the NSString* result
		NSString* result = (NSString*)value;
	NSLog(@"CreateWasteEx returned the value: %@", result);
			
}
	

// Handle the response from GetInfo.
		
- (void) GetInfoHandler: (id) value {

	// Handle errors
	if([value isKindOfClass:[NSError class]]) {
		NSLog(@"%@", value);
		return;
	}

	// Handle faults
	if([value isKindOfClass:[SoapFault class]]) {
		NSLog(@"%@", value);
		return;
	}				
			

	// Do something with the TDTraceObject* result
		TDTraceObject* result = (TDTraceObject*)value;
	NSLog(@"GetInfo returned the value: %@", result);
			
}
	

// Handle the response from GetInitalDB.
		
- (void) GetInitalDBHandler: (id) value {

	// Handle errors
	if([value isKindOfClass:[NSError class]]) {
		NSLog(@"%@", value);
		return;
	}

	// Handle faults
	if([value isKindOfClass:[SoapFault class]]) {
		NSLog(@"%@", value);
		return;
	}				
			

	// Do something with the TDUser* result
		TDUser* result = (TDUser*)value;
	NSLog(@"GetInitalDB returned the value: %@", result);
			
}
	

// Handle the response from GetInitalDBFromMacAddress.
		
- (void) GetInitalDBFromMacAddressHandler: (id) value {

	// Handle errors
	if([value isKindOfClass:[NSError class]]) {
		NSLog(@"%@", value);
		return;
	}

	// Handle faults
	if([value isKindOfClass:[SoapFault class]]) {
		NSLog(@"%@", value);
		return;
	}				
			

	// Do something with the TDUser* result
		TDUser* result = (TDUser*)value;
	NSLog(@"GetInitalDBFromMacAddress returned the value: %@", result);
			
}
	

// Handle the response from GetMfg.
		
- (void) GetMfgHandler: (id) value {

	// Handle errors
	if([value isKindOfClass:[NSError class]]) {
		NSLog(@"%@", value);
		return;
	}

	// Handle faults
	if([value isKindOfClass:[SoapFault class]]) {
		NSLog(@"%@", value);
		return;
	}				
			

	// Do something with the TDMfgOrder* result
		TDMfgOrder* result = (TDMfgOrder*)value;
	NSLog(@"GetMfg returned the value: %@", result);
			
}
	

// Handle the response from GetMfgEx.
		
- (void) GetMfgExHandler: (id) value {

	// Handle errors
	if([value isKindOfClass:[NSError class]]) {
		NSLog(@"%@", value);
		return;
	}

	// Handle faults
	if([value isKindOfClass:[SoapFault class]]) {
		NSLog(@"%@", value);
		return;
	}				
			

	// Do something with the TDMfgOrderEx* result
		TDMfgOrderEx* result = (TDMfgOrderEx*)value;
	NSLog(@"GetMfgEx returned the value: %@", result);
			
}
	

// Handle the response from GetPrinters.
		
- (void) GetPrintersHandler: (id) value {

	// Handle errors
	if([value isKindOfClass:[NSError class]]) {
		NSLog(@"%@", value);
		return;
	}

	// Handle faults
	if([value isKindOfClass:[SoapFault class]]) {
		NSLog(@"%@", value);
		return;
	}				
			

	// Do something with the TDPrinterList* result
		TDPrinterList* result = (TDPrinterList*)value;
	NSLog(@"GetPrinters returned the value: %@", result);
			
}
	

// Handle the response from GetSpecNomencl.
		
- (void) GetSpecNomenclHandler: (id) value {

	// Handle errors
	if([value isKindOfClass:[NSError class]]) {
		NSLog(@"%@", value);
		return;
	}

	// Handle faults
	if([value isKindOfClass:[SoapFault class]]) {
		NSLog(@"%@", value);
		return;
	}				
			

	// Do something with the TDNomenclSpec* result
		TDNomenclSpec* result = (TDNomenclSpec*)value;
	NSLog(@"GetSpecNomencl returned the value: %@", result);
			
}
	

// Handle the response from GetVersion.
		
- (void) GetVersionHandler: (id) value {

	// Handle errors
	if([value isKindOfClass:[NSError class]]) {
		NSLog(@"%@", value);
		return;
	}

	// Handle faults
	if([value isKindOfClass:[SoapFault class]]) {
		NSLog(@"%@", value);
		return;
	}				
			

	// Do something with the NSString* result
		NSString* result = (NSString*)value;
	NSLog(@"GetVersion returned the value: %@", result);
			
}
	

// Handle the response from GetVersionLogistics.
		
- (void) GetVersionLogisticsHandler: (id) value {

	// Handle errors
	if([value isKindOfClass:[NSError class]]) {
		NSLog(@"%@", value);
		return;
	}

	// Handle faults
	if([value isKindOfClass:[SoapFault class]]) {
		NSLog(@"%@", value);
		return;
	}				
			

	// Do something with the NSString* result
		NSString* result = (NSString*)value;
	NSLog(@"GetVersionLogistics returned the value: %@", result);
			
}
	

// Handle the response from ObjectsInZone.
		
- (void) ObjectsInZoneHandler: (id) value {

	// Handle errors
	if([value isKindOfClass:[NSError class]]) {
		NSLog(@"%@", value);
		return;
	}

	// Handle faults
	if([value isKindOfClass:[SoapFault class]]) {
		NSLog(@"%@", value);
		return;
	}				
			

	// Do something with the TDStateObjectList* result
		TDStateObjectList* result = (TDStateObjectList*)value;
	NSLog(@"ObjectsInZone returned the value: %@", result);
			
}
	

// Handle the response from ObjectsOnOperation.
		
- (void) ObjectsOnOperationHandler: (id) value {

	// Handle errors
	if([value isKindOfClass:[NSError class]]) {
		NSLog(@"%@", value);
		return;
	}

	// Handle faults
	if([value isKindOfClass:[SoapFault class]]) {
		NSLog(@"%@", value);
		return;
	}				
			

	// Do something with the TDStateObjectList* result
		TDStateObjectList* result = (TDStateObjectList*)value;
	NSLog(@"ObjectsOnOperation returned the value: %@", result);
			
}
	

// Handle the response from PrintBarcode.
		
- (void) PrintBarcodeHandler: (int) value {
			

	// Do something with the int result
		
	NSLog(@"PrintBarcode returned the value: %@", [NSNumber numberWithInt:value]);
			
}
	

// Handle the response from PutOnStorage.
		
- (void) PutOnStorageHandler: (id) value {

	// Handle errors
	if([value isKindOfClass:[NSError class]]) {
		NSLog(@"%@", value);
		return;
	}

	// Handle faults
	if([value isKindOfClass:[SoapFault class]]) {
		NSLog(@"%@", value);
		return;
	}				
			

	// Do something with the NSString* result
		NSString* result = (NSString*)value;
	NSLog(@"PutOnStorage returned the value: %@", result);
			
}
	

// Handle the response from PutRecord.
		
- (void) PutRecordHandler: (id) value {

	// Handle errors
	if([value isKindOfClass:[NSError class]]) {
		NSLog(@"%@", value);
		return;
	}

	// Handle faults
	if([value isKindOfClass:[SoapFault class]]) {
		NSLog(@"%@", value);
		return;
	}				
			

	// Do something with the NSString* result
		NSString* result = (NSString*)value;
	NSLog(@"PutRecord returned the value: %@", result);
			
}
	

// Handle the response from TestConnection.
		
- (void) TestConnectionHandler: (int) value {
			

	// Do something with the int result
		
	NSLog(@"TestConnection returned the value: %@", [NSNumber numberWithInt:value]);
			
}
	

@end
		