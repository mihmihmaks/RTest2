/*
	TDTraceObject.h
	The implementation of properties and methods for the TDTraceObject object.
	Generated by SudzC.com
*/
#import "TDTraceObject.h"

@implementation TDTraceObject
	@synthesize DocNumber = _DocNumber;
	@synthesize DocDate = _DocDate;
	@synthesize Barcode = _Barcode;
	@synthesize NomenclType = _NomenclType;
	@synthesize NomenclCode = _NomenclCode;
	@synthesize NomenclFullName = _NomenclFullName;
	@synthesize ManufacturerCode = _ManufacturerCode;
	@synthesize Manufacturer = _Manufacturer;
	@synthesize PartCode = _PartCode;
	@synthesize Part = _Part;
	@synthesize CastCode = _CastCode;
	@synthesize Cast = _Cast;
	@synthesize PipeCode = _PipeCode;
	@synthesize Pipe = _Pipe;
	@synthesize SerialNumberCode = _SerialNumberCode;
	@synthesize SerialNumber = _SerialNumber;
	@synthesize SourceType = _SourceType;
	@synthesize SourceNumber = _SourceNumber;
	@synthesize SourceDate = _SourceDate;
	@synthesize Error = _Error;
	@synthesize IsWaste = _IsWaste;
	@synthesize MfgNumber = _MfgNumber;
	@synthesize MfgDate = _MfgDate;
	@synthesize MfgNomenclCode = _MfgNomenclCode;
	@synthesize MfgNomenclFullName = _MfgNomenclFullName;
	@synthesize LastOperationCode = _LastOperationCode;
	@synthesize LastOperationName = _LastOperationName;
	@synthesize NomenclSubType = _NomenclSubType;

	- (id) init
	{
		if(self = [super init])
		{
			self.DocNumber = nil;
			self.DocDate = nil;
			self.Barcode = nil;
			self.NomenclType = nil;
			self.NomenclFullName = nil;
			self.Manufacturer = nil;
			self.Part = nil;
			self.Cast = nil;
			self.Pipe = nil;
			self.SerialNumber = nil;
			self.SourceType = nil;
			self.SourceNumber = nil;
			self.SourceDate = nil;
			self.Error = nil;
			self.MfgNumber = nil;
			self.MfgDate = nil;
			self.MfgNomenclFullName = nil;
			self.LastOperationCode = nil;
			self.LastOperationName = nil;
			self.NomenclSubType = nil;

		}
		return self;
	}

	+ (TDTraceObject*) createWithNode: (CXMLNode*) node
	{
		if(node == nil) { return nil; }
		return [[self alloc] initWithNode: node];
	}

	- (id) initWithNode: (CXMLNode*) node {
		if(self = [super initWithNode: node])
		{
			self.DocNumber = [Soap getNodeValue: node withName: @"DocNumber"];
			self.DocDate = [Soap dateFromString: [Soap getNodeValue: node withName: @"DocDate"]];
			self.Barcode = [Soap getNodeValue: node withName: @"Barcode"];
			self.NomenclType = [Soap getNodeValue: node withName: @"NomenclType"];
			self.NomenclCode = [[Soap getNodeValue: node withName: @"NomenclCode"] intValue];
			self.NomenclFullName = [Soap getNodeValue: node withName: @"NomenclFullName"];
			self.ManufacturerCode = [[Soap getNodeValue: node withName: @"ManufacturerCode"] intValue];
			self.Manufacturer = [Soap getNodeValue: node withName: @"Manufacturer"];
			self.PartCode = [[Soap getNodeValue: node withName: @"PartCode"] intValue];
			self.Part = [Soap getNodeValue: node withName: @"Part"];
			self.CastCode = [[Soap getNodeValue: node withName: @"CastCode"] intValue];
			self.Cast = [Soap getNodeValue: node withName: @"Cast"];
			self.PipeCode = [[Soap getNodeValue: node withName: @"PipeCode"] intValue];
			self.Pipe = [Soap getNodeValue: node withName: @"Pipe"];
			self.SerialNumberCode = [[Soap getNodeValue: node withName: @"SerialNumberCode"] intValue];
			self.SerialNumber = [Soap getNodeValue: node withName: @"SerialNumber"];
			self.SourceType = [Soap getNodeValue: node withName: @"SourceType"];
			self.SourceNumber = [Soap getNodeValue: node withName: @"SourceNumber"];
			self.SourceDate = [Soap dateFromString: [Soap getNodeValue: node withName: @"SourceDate"]];
			self.Error = [Soap getNodeValue: node withName: @"Error"];
			self.IsWaste = [[Soap getNodeValue: node withName: @"IsWaste"] boolValue];
			self.MfgNumber = [Soap getNodeValue: node withName: @"MfgNumber"];
			self.MfgDate = [Soap dateFromString: [Soap getNodeValue: node withName: @"MfgDate"]];
			self.MfgNomenclCode = [[Soap getNodeValue: node withName: @"MfgNomenclCode"] intValue];
			self.MfgNomenclFullName = [Soap getNodeValue: node withName: @"MfgNomenclFullName"];
			self.LastOperationCode = [Soap getNodeValue: node withName: @"LastOperationCode"];
			self.LastOperationName = [Soap getNodeValue: node withName: @"LastOperationName"];
			self.NomenclSubType = [Soap getNodeValue: node withName: @"NomenclSubType"];
		}
		return self;
	}

	- (NSMutableString*) serialize
	{
		return [self serialize: @"TraceObject"];
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
		if (self.Barcode != nil) [s appendFormat: @"<Barcode>%@</Barcode>", [[self.Barcode stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.NomenclType != nil) [s appendFormat: @"<NomenclType>%@</NomenclType>", [[self.NomenclType stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		[s appendFormat: @"<NomenclCode>%@</NomenclCode>", [NSString stringWithFormat: @"%i", self.NomenclCode]];
		if (self.NomenclFullName != nil) [s appendFormat: @"<NomenclFullName>%@</NomenclFullName>", [[self.NomenclFullName stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		[s appendFormat: @"<ManufacturerCode>%@</ManufacturerCode>", [NSString stringWithFormat: @"%i", self.ManufacturerCode]];
		if (self.Manufacturer != nil) [s appendFormat: @"<Manufacturer>%@</Manufacturer>", [[self.Manufacturer stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		[s appendFormat: @"<PartCode>%@</PartCode>", [NSString stringWithFormat: @"%i", self.PartCode]];
		if (self.Part != nil) [s appendFormat: @"<Part>%@</Part>", [[self.Part stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		[s appendFormat: @"<CastCode>%@</CastCode>", [NSString stringWithFormat: @"%i", self.CastCode]];
		if (self.Cast != nil) [s appendFormat: @"<Cast>%@</Cast>", [[self.Cast stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		[s appendFormat: @"<PipeCode>%@</PipeCode>", [NSString stringWithFormat: @"%i", self.PipeCode]];
		if (self.Pipe != nil) [s appendFormat: @"<Pipe>%@</Pipe>", [[self.Pipe stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		[s appendFormat: @"<SerialNumberCode>%@</SerialNumberCode>", [NSString stringWithFormat: @"%i", self.SerialNumberCode]];
		if (self.SerialNumber != nil) [s appendFormat: @"<SerialNumber>%@</SerialNumber>", [[self.SerialNumber stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.SourceType != nil) [s appendFormat: @"<SourceType>%@</SourceType>", [[self.SourceType stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.SourceNumber != nil) [s appendFormat: @"<SourceNumber>%@</SourceNumber>", [[self.SourceNumber stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.SourceDate != nil) [s appendFormat: @"<SourceDate>%@</SourceDate>", [Soap getDateString: self.SourceDate]];
		if (self.Error != nil) [s appendFormat: @"<Error>%@</Error>", [[self.Error stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		[s appendFormat: @"<IsWaste>%@</IsWaste>", (self.IsWaste)?@"true":@"false"];
		if (self.MfgNumber != nil) [s appendFormat: @"<MfgNumber>%@</MfgNumber>", [[self.MfgNumber stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.MfgDate != nil) [s appendFormat: @"<MfgDate>%@</MfgDate>", [Soap getDateString: self.MfgDate]];
		[s appendFormat: @"<MfgNomenclCode>%@</MfgNomenclCode>", [NSString stringWithFormat: @"%i", self.MfgNomenclCode]];
		if (self.MfgNomenclFullName != nil) [s appendFormat: @"<MfgNomenclFullName>%@</MfgNomenclFullName>", [[self.MfgNomenclFullName stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.LastOperationCode != nil) [s appendFormat: @"<LastOperationCode>%@</LastOperationCode>", [[self.LastOperationCode stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.LastOperationName != nil) [s appendFormat: @"<LastOperationName>%@</LastOperationName>", [[self.LastOperationName stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.NomenclSubType != nil) [s appendFormat: @"<NomenclSubType>%@</NomenclSubType>", [[self.NomenclSubType stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];

		return s;
	}
	
	- (NSMutableString*) serializeAttributes
	{
		NSMutableString* s = [super serializeAttributes];

		return s;
	}
	
	-(BOOL)isEqual:(id)object{
		if(object != nil && [object isKindOfClass:[TDTraceObject class]]) {
			return [[self serialize] isEqualToString:[object serialize]];
		}
		return NO;
	}
	
	-(NSUInteger)hash{
		return [Soap generateHash:self];

	}

@end
