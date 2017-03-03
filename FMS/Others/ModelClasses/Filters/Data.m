//
//  Data.m
//
//  Created by Manish Mundra on 14/08/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "Data.h"
#import "Status.h"
#import "Commodity.h"
#import "Location.h"
#import "Driver.h"


NSString *const kDataStatus = @"status";
NSString *const kDataCommodity = @"commodity";
NSString *const kDataLocation = @"location";
NSString *const kDataDriver = @"driver";


@interface Data ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Data

@synthesize status = _status;
@synthesize commodity = _commodity;
@synthesize location = _location;
@synthesize driver = _driver;


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
            self.status = [Status modelObjectWithDictionary:[dict objectForKey:kDataStatus]];
    NSObject *receivedCommodity = [dict objectForKey:kDataCommodity];
    NSMutableArray *parsedCommodity = [NSMutableArray array];
    if ([receivedCommodity isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedCommodity) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedCommodity addObject:[Commodity modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedCommodity isKindOfClass:[NSDictionary class]]) {
       [parsedCommodity addObject:[Commodity modelObjectWithDictionary:(NSDictionary *)receivedCommodity]];
    }

    self.commodity = [NSArray arrayWithArray:parsedCommodity];
    NSObject *receivedLocation = [dict objectForKey:kDataLocation];
    NSMutableArray *parsedLocation = [NSMutableArray array];
    if ([receivedLocation isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedLocation) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedLocation addObject:[Location modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedLocation isKindOfClass:[NSDictionary class]]) {
       [parsedLocation addObject:[Location modelObjectWithDictionary:(NSDictionary *)receivedLocation]];
    }

    self.location = [NSArray arrayWithArray:parsedLocation];
    NSObject *receivedDriver = [dict objectForKey:kDataDriver];
    NSMutableArray *parsedDriver = [NSMutableArray array];
    if ([receivedDriver isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedDriver) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedDriver addObject:[Driver modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedDriver isKindOfClass:[NSDictionary class]]) {
       [parsedDriver addObject:[Driver modelObjectWithDictionary:(NSDictionary *)receivedDriver]];
    }

    self.driver = [NSArray arrayWithArray:parsedDriver];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.status dictionaryRepresentation] forKey:kDataStatus];
    NSMutableArray *tempArrayForCommodity = [NSMutableArray array];
    for (NSObject *subArrayObject in self.commodity) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForCommodity addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForCommodity addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForCommodity] forKey:kDataCommodity];
    NSMutableArray *tempArrayForLocation = [NSMutableArray array];
    for (NSObject *subArrayObject in self.location) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForLocation addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForLocation addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForLocation] forKey:kDataLocation];
    NSMutableArray *tempArrayForDriver = [NSMutableArray array];
    for (NSObject *subArrayObject in self.driver) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForDriver addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForDriver addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForDriver] forKey:kDataDriver];

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

    self.status = [aDecoder decodeObjectForKey:kDataStatus];
    self.commodity = [aDecoder decodeObjectForKey:kDataCommodity];
    self.location = [aDecoder decodeObjectForKey:kDataLocation];
    self.driver = [aDecoder decodeObjectForKey:kDataDriver];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_status forKey:kDataStatus];
    [aCoder encodeObject:_commodity forKey:kDataCommodity];
    [aCoder encodeObject:_location forKey:kDataLocation];
    [aCoder encodeObject:_driver forKey:kDataDriver];
}

- (id)copyWithZone:(NSZone *)zone
{
    Data *copy = [[Data alloc] init];
    
    if (copy) {

        copy.status = [self.status copyWithZone:zone];
        copy.commodity = [self.commodity copyWithZone:zone];
        copy.location = [self.location copyWithZone:zone];
        copy.driver = [self.driver copyWithZone:zone];
    }
    
    return copy;
}


@end
