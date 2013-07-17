/*
	TDMfgOrderEx.h
	The implementation of properties and methods for the TDMfgOrderEx object.
	Generated by SudzC.com
*/
#import "TDMfgOrderEx.h"

#import "TDNomenclSpec.h"
@implementation TDMfgOrderEx
	@synthesize DocNumber = _DocNumber;
	@synthesize DocDate = _DocDate;
	@synthesize Error = _Error;
	@synthesize NomenclSpec = _NomenclSpec;

	- (id) init
	{
		if(self = [super init])
		{
			self.DocNumber = nil;
			self.DocDate = nil;
			self.Error = nil;
			self.NomenclSpec = nil; // [[TDNomenclSpec alloc] init];

		}
		return self;
	}

	+ (TDMfgOrderEx*) createWithNode: (CXMLNode*) node
	{
		if(node == nil) { return nil; }
		return [[self alloc] initWithNode: node];
	}

	- (id) initWithNode: (CXMLNode*) node {
		if(self = [super initWithNode: node])
		{
			self.DocNumber = [Soap getNodeValue: node withName: @"DocNumber"];
			self.DocDate = [Soap dateFromString: [Soap getNodeValue: node withName: @"DocDate"]];
			self.Error = [Soap getNodeValue: node withName: @"Error"];
			self.NomenclSpec = [[TDNomenclSpec createWithNode: [Soap getNode: node withName: @"NomenclSpec"]] object];
		}
		return self;
	}

	- (NSMutableString*) serialize
	{
		return [self serialize: @"MfgOrderEx"];
	}
  
	- (NSMutableString*) serialize: (NSString*) nodeName
	{
		NSMutableString* s = [NSMutableString string];
		[s appendFormat: @"<%@", nodeName];
		[s appendString: [self serializeAttributes]];
		[s appendString: @">"];
		[s appendString: [self serializeElements]];
		[s appendFormat: @"</%@>", nodeName];
		return s;
	}
	
	- (NSMutableString*) serializeElements
	{
		NSMutableString* s = [super serializeElements];
		if (self.DocNumber != nil) [s appendFormat: @"<DocNumber>%@</DocNumber>", [[self.DocNumber stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.DocDate != nil) [s appendFormat: @"<DocDate>%@</DocDate>", [Soap getDateString: self.DocDate]];
		if (self.Error != nil) [s appendFormat: @"<Error>%@</Error>", [[self.Error stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.NomenclSpec != nil) [s appendString: [self.NomenclSpec serialize: @"NomenclSpec"]];

		return s;
	}
	
	- (NSMutableString*) serializeAttributes
	{
		NSMutableString* s = [super serializeAttributes];

		return s;
	}
	
	-(BOOL)isEqual:(id)object{
		if(object != nil && [object isKindOfClass:[TDMfgOrderEx class]]) {
			return [[self serialize] isEqualToString:[object serialize]];
		}
		return NO;
	}
	
	-(NSUInteger)hash{
		return [Soap generateHash:self];

	}

@end
