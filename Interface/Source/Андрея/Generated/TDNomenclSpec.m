/*
	TDNomenclSpec.h
	The implementation of properties and methods for the TDNomenclSpec object.
	Generated by SudzC.com
*/
#import "TDNomenclSpec.h"

#import "TDNomenclature.h"
#import "TDNomenclSpecRow.h"
@implementation TDNomenclSpec
	@synthesize Nomencl_Out = _Nomencl_Out;
	@synthesize Nomencl_In = _Nomencl_In;
	@synthesize Error = _Error;

	- (id) init
	{
		if(self = [super init])
		{
			self.Nomencl_Out = nil; // [[TDNomenclature alloc] init];
			self.Nomencl_In = nil; // [[TDNomenclSpecRow alloc] init];
			self.Error = nil;

		}
		return self;
	}

	+ (TDNomenclSpec*) createWithNode: (CXMLNode*) node
	{
		if(node == nil) { return nil; }
		return [[self alloc] initWithNode: node];
	}

	- (id) initWithNode: (CXMLNode*) node {
		if(self = [super initWithNode: node])
		{
			self.Nomencl_Out = [[TDNomenclature createWithNode: [Soap getNode: node withName: @"Nomencl_Out"]] object];
			self.Nomencl_In = [[TDNomenclSpecRow createWithNode: [Soap getNode: node withName: @"Nomencl_In"]] object];
			self.Error = [Soap getNodeValue: node withName: @"Error"];
		}
		return self;
	}

	- (NSMutableString*) serialize
	{
		return [self serialize: @"NomenclSpec"];
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
		if (self.Nomencl_Out != nil) [s appendString: [self.Nomencl_Out serialize: @"Nomencl_Out"]];
		if (self.Nomencl_In != nil) [s appendString: [self.Nomencl_In serialize: @"Nomencl_In"]];
		if (self.Error != nil) [s appendFormat: @"<Error>%@</Error>", [[self.Error stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];

		return s;
	}
	
	- (NSMutableString*) serializeAttributes
	{
		NSMutableString* s = [super serializeAttributes];

		return s;
	}
	
	-(BOOL)isEqual:(id)object{
		if(object != nil && [object isKindOfClass:[TDNomenclSpec class]]) {
			return [[self serialize] isEqualToString:[object serialize]];
		}
		return NO;
	}
	
	-(NSUInteger)hash{
		return [Soap generateHash:self];

	}

@end
