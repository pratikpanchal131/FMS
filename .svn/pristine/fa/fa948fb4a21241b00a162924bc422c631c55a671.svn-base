//
//  Driver.m
//
//  Created by Manish Mundra on 14/08/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "Driver.h"


NSString *const kDriverDriverId = @"driver_id";
NSString *const kDriverDriverName = @"driver_name";


@interface Driver ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Driver

@synthesize driverId = _driverId;
@synthesize driverName = _driverName;


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
            self.driverId = [self objectOrNilForKey:kDriverDriverId fromDictionary:dict];
            self.driverName = [self objectOrNilForKey:kDriverDriverName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.driverId forKey:kDriverDriverId];
    [mutableDict setValue:self.driverName forKey:kDriverDriverName];

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

    self.driverId = [aDecoder decodeObjectForKey:kDriverDriverId];
    self.driverName = [aDecoder decodeObjectForKey:kDriverDriverName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_driverId forKey:kDriverDriverId];
    [aCoder encodeObject:_driverName forKey:kDriverDriverName];
}

- (id)copyWithZone:(NSZone *)zone
{
    Driver *copy = [[Driver alloc] init];
    
    if (copy) {

        copy.driverId = [self.driverId copyWithZone:zone];
        copy.driverName = [self.driverName copyWithZone:zone];
    }
    
    return copy;
}


@end
