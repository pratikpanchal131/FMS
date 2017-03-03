//
//  FMS_LoadDetail.m
//
//  Created by   on 31/08/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FMS_LoadDetail.h"


NSString *const kFMS_LoadDetailFromAddress = @"from_address";
NSString *const kFMS_LoadDetailFromCity = @"from_city";
NSString *const kFMS_LoadDetailTimeWindow = @"time_window";
NSString *const kFMS_LoadDetailOrderStatus = @"order_status";
NSString *const kFMS_LoadDetailToCity = @"to_city";
NSString *const kFMS_LoadDetailToLocation = @"to_location";
NSString *const kFMS_LoadDetailAvailableLoads = @"available_loads";
NSString *const kFMS_LoadDetailNoNeedOlNumber = @"no_need_ol_number";
NSString *const kFMS_LoadDetailOlNumber = @"ol_number";
NSString *const kFMS_LoadDetailUnits = @"units";
NSString *const kFMS_LoadDetailTicketImgRequired = @"ticket_img_required";
NSString *const kFMS_LoadDetailPickupDateNTime = @"pickup_date_n_time";
NSString *const kFMS_LoadDetailPickupImgRequired = @"pickup_img_required";
NSString *const kFMS_LoadDetailMiles = @"miles";
NSString *const kFMS_LoadDetailReason = @"reason";
NSString *const kFMS_LoadDetailToAddress = @"to_address";
NSString *const kFMS_LoadDetailPostedTime = @"posted_time";
NSString *const kFMS_LoadDetailRate = @"rate";
NSString *const kFMS_LoadDetailCommodity = @"commodity";
NSString *const kFMS_LoadDetailFromLocation = @"from_location";


@interface FMS_LoadDetail ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation FMS_LoadDetail

@synthesize fromAddress = _fromAddress;
@synthesize fromCity = _fromCity;
@synthesize timeWindow = _timeWindow;
@synthesize orderStatus = _orderStatus;
@synthesize toCity = _toCity;
@synthesize toLocation = _toLocation;
@synthesize availableLoads = _availableLoads;
@synthesize noNeedOlNumber = _noNeedOlNumber;
@synthesize olNumber = _olNumber;
@synthesize units = _units;
@synthesize ticketImgRequired = _ticketImgRequired;
@synthesize pickupDateNTime = _pickupDateNTime;
@synthesize pickupImgRequired = _pickupImgRequired;
@synthesize miles = _miles;
@synthesize reason = _reason;
@synthesize toAddress = _toAddress;
@synthesize postedTime = _postedTime;
@synthesize rate = _rate;
@synthesize commodity = _commodity;
@synthesize fromLocation = _fromLocation;


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
            self.fromAddress = [self objectOrNilForKey:kFMS_LoadDetailFromAddress fromDictionary:dict];
            self.fromCity = [self objectOrNilForKey:kFMS_LoadDetailFromCity fromDictionary:dict];
            self.timeWindow = [self objectOrNilForKey:kFMS_LoadDetailTimeWindow fromDictionary:dict];
            self.orderStatus = [self objectOrNilForKey:kFMS_LoadDetailOrderStatus fromDictionary:dict];
            self.toCity = [self objectOrNilForKey:kFMS_LoadDetailToCity fromDictionary:dict];
            self.toLocation = [self objectOrNilForKey:kFMS_LoadDetailToLocation fromDictionary:dict];
            self.availableLoads = [self objectOrNilForKey:kFMS_LoadDetailAvailableLoads fromDictionary:dict];
            self.noNeedOlNumber = [self objectOrNilForKey:kFMS_LoadDetailNoNeedOlNumber fromDictionary:dict];
            self.olNumber = [self objectOrNilForKey:kFMS_LoadDetailOlNumber fromDictionary:dict];
            self.units = [self objectOrNilForKey:kFMS_LoadDetailUnits fromDictionary:dict];
            self.ticketImgRequired = [self objectOrNilForKey:kFMS_LoadDetailTicketImgRequired fromDictionary:dict];
            self.pickupDateNTime = [self objectOrNilForKey:kFMS_LoadDetailPickupDateNTime fromDictionary:dict];
            self.pickupImgRequired = [self objectOrNilForKey:kFMS_LoadDetailPickupImgRequired fromDictionary:dict];
            self.miles = [self objectOrNilForKey:kFMS_LoadDetailMiles fromDictionary:dict];
            self.reason = [self objectOrNilForKey:kFMS_LoadDetailReason fromDictionary:dict];
            self.toAddress = [self objectOrNilForKey:kFMS_LoadDetailToAddress fromDictionary:dict];
            self.postedTime = [self objectOrNilForKey:kFMS_LoadDetailPostedTime fromDictionary:dict];
            self.rate = [self objectOrNilForKey:kFMS_LoadDetailRate fromDictionary:dict];
            self.commodity = [self objectOrNilForKey:kFMS_LoadDetailCommodity fromDictionary:dict];
            self.fromLocation = [self objectOrNilForKey:kFMS_LoadDetailFromLocation fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.fromAddress forKey:kFMS_LoadDetailFromAddress];
    [mutableDict setValue:self.fromCity forKey:kFMS_LoadDetailFromCity];
    [mutableDict setValue:self.timeWindow forKey:kFMS_LoadDetailTimeWindow];
    [mutableDict setValue:self.orderStatus forKey:kFMS_LoadDetailOrderStatus];
    [mutableDict setValue:self.toCity forKey:kFMS_LoadDetailToCity];
    [mutableDict setValue:self.toLocation forKey:kFMS_LoadDetailToLocation];
    [mutableDict setValue:self.availableLoads forKey:kFMS_LoadDetailAvailableLoads];
    [mutableDict setValue:self.noNeedOlNumber forKey:kFMS_LoadDetailNoNeedOlNumber];
    [mutableDict setValue:self.olNumber forKey:kFMS_LoadDetailOlNumber];
    [mutableDict setValue:self.units forKey:kFMS_LoadDetailUnits];
    [mutableDict setValue:self.ticketImgRequired forKey:kFMS_LoadDetailTicketImgRequired];
    [mutableDict setValue:self.pickupDateNTime forKey:kFMS_LoadDetailPickupDateNTime];
    [mutableDict setValue:self.pickupImgRequired forKey:kFMS_LoadDetailPickupImgRequired];
    [mutableDict setValue:self.miles forKey:kFMS_LoadDetailMiles];
    [mutableDict setValue:self.reason forKey:kFMS_LoadDetailReason];
    [mutableDict setValue:self.toAddress forKey:kFMS_LoadDetailToAddress];
    [mutableDict setValue:self.postedTime forKey:kFMS_LoadDetailPostedTime];
    [mutableDict setValue:self.rate forKey:kFMS_LoadDetailRate];
    [mutableDict setValue:self.commodity forKey:kFMS_LoadDetailCommodity];
    [mutableDict setValue:self.fromLocation forKey:kFMS_LoadDetailFromLocation];

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

    self.fromAddress = [aDecoder decodeObjectForKey:kFMS_LoadDetailFromAddress];
    self.fromCity = [aDecoder decodeObjectForKey:kFMS_LoadDetailFromCity];
    self.timeWindow = [aDecoder decodeObjectForKey:kFMS_LoadDetailTimeWindow];
    self.orderStatus = [aDecoder decodeObjectForKey:kFMS_LoadDetailOrderStatus];
    self.toCity = [aDecoder decodeObjectForKey:kFMS_LoadDetailToCity];
    self.toLocation = [aDecoder decodeObjectForKey:kFMS_LoadDetailToLocation];
    self.availableLoads = [aDecoder decodeObjectForKey:kFMS_LoadDetailAvailableLoads];
    self.noNeedOlNumber = [aDecoder decodeObjectForKey:kFMS_LoadDetailNoNeedOlNumber];
    self.olNumber = [aDecoder decodeObjectForKey:kFMS_LoadDetailOlNumber];
    self.units = [aDecoder decodeObjectForKey:kFMS_LoadDetailUnits];
    self.ticketImgRequired = [aDecoder decodeObjectForKey:kFMS_LoadDetailTicketImgRequired];
    self.pickupDateNTime = [aDecoder decodeObjectForKey:kFMS_LoadDetailPickupDateNTime];
    self.pickupImgRequired = [aDecoder decodeObjectForKey:kFMS_LoadDetailPickupImgRequired];
    self.miles = [aDecoder decodeObjectForKey:kFMS_LoadDetailMiles];
    self.reason = [aDecoder decodeObjectForKey:kFMS_LoadDetailReason];
    self.toAddress = [aDecoder decodeObjectForKey:kFMS_LoadDetailToAddress];
    self.postedTime = [aDecoder decodeObjectForKey:kFMS_LoadDetailPostedTime];
    self.rate = [aDecoder decodeObjectForKey:kFMS_LoadDetailRate];
    self.commodity = [aDecoder decodeObjectForKey:kFMS_LoadDetailCommodity];
    self.fromLocation = [aDecoder decodeObjectForKey:kFMS_LoadDetailFromLocation];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_fromAddress forKey:kFMS_LoadDetailFromAddress];
    [aCoder encodeObject:_fromCity forKey:kFMS_LoadDetailFromCity];
    [aCoder encodeObject:_timeWindow forKey:kFMS_LoadDetailTimeWindow];
    [aCoder encodeObject:_orderStatus forKey:kFMS_LoadDetailOrderStatus];
    [aCoder encodeObject:_toCity forKey:kFMS_LoadDetailToCity];
    [aCoder encodeObject:_toLocation forKey:kFMS_LoadDetailToLocation];
    [aCoder encodeObject:_availableLoads forKey:kFMS_LoadDetailAvailableLoads];
    [aCoder encodeObject:_noNeedOlNumber forKey:kFMS_LoadDetailNoNeedOlNumber];
    [aCoder encodeObject:_olNumber forKey:kFMS_LoadDetailOlNumber];
    [aCoder encodeObject:_units forKey:kFMS_LoadDetailUnits];
    [aCoder encodeObject:_ticketImgRequired forKey:kFMS_LoadDetailTicketImgRequired];
    [aCoder encodeObject:_pickupDateNTime forKey:kFMS_LoadDetailPickupDateNTime];
    [aCoder encodeObject:_pickupImgRequired forKey:kFMS_LoadDetailPickupImgRequired];
    [aCoder encodeObject:_miles forKey:kFMS_LoadDetailMiles];
    [aCoder encodeObject:_reason forKey:kFMS_LoadDetailReason];
    [aCoder encodeObject:_toAddress forKey:kFMS_LoadDetailToAddress];
    [aCoder encodeObject:_postedTime forKey:kFMS_LoadDetailPostedTime];
    [aCoder encodeObject:_rate forKey:kFMS_LoadDetailRate];
    [aCoder encodeObject:_commodity forKey:kFMS_LoadDetailCommodity];
    [aCoder encodeObject:_fromLocation forKey:kFMS_LoadDetailFromLocation];
}

- (id)copyWithZone:(NSZone *)zone
{
    FMS_LoadDetail *copy = [[FMS_LoadDetail alloc] init];
    
    if (copy) {

        copy.fromAddress = [self.fromAddress copyWithZone:zone];
        copy.fromCity = [self.fromCity copyWithZone:zone];
        copy.timeWindow = [self.timeWindow copyWithZone:zone];
        copy.orderStatus = [self.orderStatus copyWithZone:zone];
        copy.toCity = [self.toCity copyWithZone:zone];
        copy.toLocation = [self.toLocation copyWithZone:zone];
        copy.availableLoads = [self.availableLoads copyWithZone:zone];
        copy.noNeedOlNumber = [self.noNeedOlNumber copyWithZone:zone];
        copy.olNumber = [self.olNumber copyWithZone:zone];
        copy.units = [self.units copyWithZone:zone];
        copy.ticketImgRequired = [self.ticketImgRequired copyWithZone:zone];
        copy.pickupDateNTime = [self.pickupDateNTime copyWithZone:zone];
        copy.pickupImgRequired = [self.pickupImgRequired copyWithZone:zone];
        copy.miles = [self.miles copyWithZone:zone];
        copy.reason = [self.reason copyWithZone:zone];
        copy.toAddress = [self.toAddress copyWithZone:zone];
        copy.postedTime = [self.postedTime copyWithZone:zone];
        copy.rate = [self.rate copyWithZone:zone];
        copy.commodity = [self.commodity copyWithZone:zone];
        copy.fromLocation = [self.fromLocation copyWithZone:zone];
    }
    
    return copy;
}


@end
