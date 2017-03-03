//
//  FiltersBaseClass.m
//
//  Created by Manish Mundra on 14/08/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FiltersBaseClass.h"
#import "Data.h"


NSString *const kFiltersBaseClassStatus = @"status";
NSString *const kFiltersBaseClassMessage = @"message";
NSString *const kFiltersBaseClassCode = @"code";
NSString *const kFiltersBaseClassData = @"data";


@interface FiltersBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation FiltersBaseClass

@synthesize status = _status;
@synthesize message = _message;
@synthesize code = _code;
@synthesize data = _data;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.status = [[self objectOrNilForKey:kFiltersBaseClassStatus fromDictionary:dict] doubleValue];
            self.message = [self objectOrNilForKey:kFiltersBaseClassMessage fromDictionary:dict];
            self.code = [[self objectOrNilForKey:kFiltersBaseClassCode fromDictionary:dict] doubleValue];
            self.data = [Data modelObjectWithDictionary:[dict objectForKey:kFiltersBaseClassData]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.status] forKey:kFiltersBaseClassStatus];
    [mutableDict setValue:self.message forKey:kFiltersBaseClassMessage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.code] forKey:kFiltersBaseClassCode];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kFiltersBaseClassData];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.status = [aDecoder decodeDoubleForKey:kFiltersBaseClassStatus];
    self.message = [aDecoder decodeObjectForKey:kFiltersBaseClassMessage];
    self.code = [aDecoder decodeDoubleForKey:kFiltersBaseClassCode];
    self.data = [aDecoder decodeObjectForKey:kFiltersBaseClassData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_status forKey:kFiltersBaseClassStatus];
    [aCoder encodeObject:_message forKey:kFiltersBaseClassMessage];
    [aCoder encodeDouble:_code forKey:kFiltersBaseClassCode];
    [aCoder encodeObject:_data forKey:kFiltersBaseClassData];
}

- (id)copyWithZone:(NSZone *)zone
{
    FiltersBaseClass *copy = [[FiltersBaseClass alloc] init];
    
    if (copy) {

        copy.status = self.status;
        copy.message = [self.message copyWithZone:zone];
        copy.code = self.code;
        copy.data = [self.data copyWithZone:zone];
    }
    
    return copy;
}


@end
