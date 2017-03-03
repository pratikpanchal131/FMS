//
//  FMS_Order_Status.m
//
//  Created by Manish Mundra on 17/08/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FMS_Order_Status.h"


NSString *const kFMS_Order_StatusDriverId = @"driver_id";
NSString *const kFMS_Order_StatusOrderStatus = @"order_status";
NSString *const kFMS_Order_StatusOrderId = @"order_id";
NSString *const kFMS_Order_StatusToLocation = @"to_location";
NSString *const kFMS_Order_StatusFromLocation = @"from_location";
NSString *const kFMS_Order_StatusDate = @"date";
NSString *const kFMS_Order_StatusDriverName = @"driver_name";


@interface FMS_Order_Status ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation FMS_Order_Status

@synthesize driverId = _driverId;
@synthesize orderStatus = _orderStatus;
@synthesize orderId = _orderId;
@synthesize toLocation = _toLocation;
@synthesize fromLocation = _fromLocation;
@synthesize date = _date;
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
        self.driverId = [self objectOrNilForKey:kFMS_Order_StatusDriverId fromDictionary:dict];
        self.orderStatus = [self objectOrNilForKey:kFMS_Order_StatusOrderStatus fromDictionary:dict];
        self.orderId = [self objectOrNilForKey:kFMS_Order_StatusOrderId fromDictionary:dict];
        self.toLocation = [self objectOrNilForKey:kFMS_Order_StatusToLocation fromDictionary:dict];
        self.fromLocation = [self objectOrNilForKey:kFMS_Order_StatusFromLocation fromDictionary:dict];
        self.date = [self objectOrNilForKey:kFMS_Order_StatusDate fromDictionary:dict];
        self.driverName = [self objectOrNilForKey:kFMS_Order_StatusDriverName fromDictionary:dict];
        
    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.driverId forKey:kFMS_Order_StatusDriverId];
    [mutableDict setValue:self.orderStatus forKey:kFMS_Order_StatusOrderStatus];
    [mutableDict setValue:self.orderId forKey:kFMS_Order_StatusOrderId];
    [mutableDict setValue:self.toLocation forKey:kFMS_Order_StatusToLocation];
    [mutableDict setValue:self.fromLocation forKey:kFMS_Order_StatusFromLocation];
    [mutableDict setValue:self.date forKey:kFMS_Order_StatusDate];
    [mutableDict setValue:self.driverName forKey:kFMS_Order_StatusDriverName];
    
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
    
    self.driverId = [aDecoder decodeObjectForKey:kFMS_Order_StatusDriverId];
    self.orderStatus = [aDecoder decodeObjectForKey:kFMS_Order_StatusOrderStatus];
    self.orderId = [aDecoder decodeObjectForKey:kFMS_Order_StatusOrderId];
    self.toLocation = [aDecoder decodeObjectForKey:kFMS_Order_StatusToLocation];
    self.fromLocation = [aDecoder decodeObjectForKey:kFMS_Order_StatusFromLocation];
    self.date = [aDecoder decodeObjectForKey:kFMS_Order_StatusDate];
    self.driverName = [aDecoder decodeObjectForKey:kFMS_Order_StatusDriverName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    
    [aCoder encodeObject:_driverId forKey:kFMS_Order_StatusDriverId];
    [aCoder encodeObject:_orderStatus forKey:kFMS_Order_StatusOrderStatus];
    [aCoder encodeObject:_orderId forKey:kFMS_Order_StatusOrderId];
    [aCoder encodeObject:_toLocation forKey:kFMS_Order_StatusToLocation];
    [aCoder encodeObject:_fromLocation forKey:kFMS_Order_StatusFromLocation];
    [aCoder encodeObject:_date forKey:kFMS_Order_StatusDate];
    [aCoder encodeObject:_driverName forKey:kFMS_Order_StatusDriverName];
}

- (id)copyWithZone:(NSZone *)zone
{
    FMS_Order_Status *copy = [[FMS_Order_Status alloc] init];
    
    if (copy) {
        
        copy.driverId = [self.driverId copyWithZone:zone];
        copy.orderStatus = [self.orderStatus copyWithZone:zone];
        copy.orderId = [self.orderId copyWithZone:zone];
        copy.toLocation = [self.toLocation copyWithZone:zone];
        copy.fromLocation = [self.fromLocation copyWithZone:zone];
        copy.date = [self.date copyWithZone:zone];
        copy.driverName = [self.driverName copyWithZone:zone];
    }
    
    return copy;
}


@end
