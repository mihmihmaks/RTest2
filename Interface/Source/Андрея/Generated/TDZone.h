/*
	TDZone.h
	The interface definition of properties and methods for the TDZone object.
	Generated by SudzC.com
*/

#import "Soap.h"
	
@class TDResource;

@interface TDZone : SoapObject
{
	NSString*   _Code;
	NSString*   _Name;
	TDResource* _Resources;
	NSString*   _Error;
	
}
		
	@property (retain, nonatomic) NSString* Code;
	@property (retain, nonatomic) NSString* Name;
	@property (retain, nonatomic) TDResource* Resources;
	@property (retain, nonatomic) NSString* Error;

	+ (TDZone*) createWithNode: (CXMLNode*) node;
	- (id) initWithNode: (CXMLNode*) node;
	- (NSMutableString*) serialize;
	- (NSMutableString*) serialize: (NSString*) nodeName;
	- (NSMutableString*) serializeAttributes;
	- (NSMutableString*) serializeElements;

@end
