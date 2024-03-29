/*
	TDStateObjectRecord.h
	The interface definition of properties and methods for the TDStateObjectRecord object.
	Generated by SudzC.com
*/

#import "Soap.h"
	

@interface TDStateObjectRecord : SoapObject
{
	NSString* _Barcode;
	NSString* _Name;
	NSString* _ZoneCode;
	NSString* _ZoneName;
	NSString* _OperationCode;
	NSString* _OperationName;
	NSString* _ResourceCode;
	NSString* _ResourceName;
	NSString* _State;
	
}
		
	@property (retain, nonatomic) NSString* Barcode;
	@property (retain, nonatomic) NSString* Name;
	@property (retain, nonatomic) NSString* ZoneCode;
	@property (retain, nonatomic) NSString* ZoneName;
	@property (retain, nonatomic) NSString* OperationCode;
	@property (retain, nonatomic) NSString* OperationName;
	@property (retain, nonatomic) NSString* ResourceCode;
	@property (retain, nonatomic) NSString* ResourceName;
	@property (retain, nonatomic) NSString* State;

	+ (TDStateObjectRecord*) createWithNode: (CXMLNode*) node;
	- (id) initWithNode: (CXMLNode*) node;
	- (NSMutableString*) serialize;
	- (NSMutableString*) serialize: (NSString*) nodeName;
	- (NSMutableString*) serializeAttributes;
	- (NSMutableString*) serializeElements;

@end
