//
//  FMS_GetDrivers.m
//
//  Created by indianic  on 21/08/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FMS_GetDrivers.h"


NSString *const kFMS_GetDriversDriverImage = @"driver_image";
NSString *const kFMS_GetDriversDriverName = @"driver_name";
NSString *const kFMS_GetDriversRank = @"rank";
NSString *const kFMS_GetDriversDriverId = @"driver_id";


@interface FMS_GetDrivers ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation FMS_GetDrivers

@synthesize driverImage = _driverImage;
@synthesize driverName = _driverName;
@synthesize rank = _rank;
@synthesize driverId = _driverId;


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
            self.driverImage = [self objectOrNilForKey:kFMS_GetDriversDriverImage fromDictionary:dict];
            self.driverName = [self objectOrNilForKey:kFMS_GetDriversDriverName fromDictionary:dict];
            self.rank = [self objectOrNilForKey:kFMS_GetDriversRank fromDictionary:dict];
            self.driverId = [self objectOrNilForKey:kFMS_GetDriversDriverId fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.driverImage forKey:kFMS_GetDriversDriverImage];
    [mutableDict setValue:self.driverName forKey:kFMS_GetDriversDriverName];
    [mutableDict setValue:self.rank forKey:kFMS_GetDriversRank];
    [mutableDict setValue:self.driverId forKey:kFMS_GetDriversDriverId];

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

    self.driverImage = [aDecoder decodeObjectForKey:kFMS_GetDriversDriverImage];
    self.driverName = [aDecoder decodeObjectForKey:kFMS_GetDriversDriverName];
    self.rank = [aDecoder decodeObjectForKey:kFMS_GetDriversRank];
    self.driverId = [aDecoder decodeObjectForKey:kFMS_GetDriversDriverId];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_driverImage forKey:kFMS_GetDriversDriverImage];
    [aCoder encodeObject:_driverName forKey:kFMS_GetDriversDriverName];
    [aCoder encodeObject:_rank forKey:kFMS_GetDriversRank];
    [aCoder encodeObject:_driverId forKey:kFMS_GetDriversDriverId];
}

- (id)copyWithZone:(NSZone *)zone
{
    FMS_GetDrivers *copy = [[FMS_GetDrivers alloc] init];
    
    if (copy) {

        copy.driverImage = [self.driverImage copyWithZone:zone];
        copy.driverName = [self.driverName copyWithZone:zone];
        copy.rank = [self.rank copyWithZone:zone];
        copy.driverId = [self.driverId copyWithZone:zone];
    }
    
    return copy;
}


@end
