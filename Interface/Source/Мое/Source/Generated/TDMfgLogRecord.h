/*
	TDMfgLogRecord.h
	The interface definition of properties and methods for the TDMfgLogRecord object.
	Generated by SudzC.com
*/

#import "Soap.h"
	

@interface TDMfgLogRecord : SoapObject
{
	NSDate* _DateOperation;
	NSString* _ZoneCode;
	NSString* _ZoneName;
	NSString* _OperationCode;
	NSString* _OperationName;
	NSString* _ResourceCode;
	NSString* _ResourceName;
	NSString* _BarcodeBefore;
	NSString* _BarcodeAfter;
	NSString* _UserCode;
	NSString* _UserName;
	NSString* _State;
	
}
		
	@property (retain, nonatomic) NSDate* DateOperation;
	@property (retain, nonatomic) NSString* ZoneCode;
	@property (retain, nonatomic) NSString* ZoneName;
	@property (retain, nonatomic) NSString* OperationCode;
	@property (retain, nonatomic) NSString* OperationName;
	@property (retain, nonatomic) NSString* ResourceCode;
	@property (retain, nonatomic) NSString* ResourceName;
	@property (retain, nonatomic) NSString* BarcodeBefore;
	@property (retain, nonatomic) NSString* BarcodeAfter;
	@property (retain, nonatomic) NSString* UserCode;
	@property (retain, nonatomic) NSString* UserName;
	@property (retain, nonatomic) NSString* State;

	+ (TDMfgLogRecord*) createWithNode: (CXMLNode*) node;
	- (id) initWithNode: (CXMLNode*) node;
	- (NSMutableString*) serialize;
	- (NSMutableString*) serialize: (NSString*) nodeName;
	- (NSMutableString*) serializeAttributes;
	- (NSMutableString*) serializeElements;

@end
