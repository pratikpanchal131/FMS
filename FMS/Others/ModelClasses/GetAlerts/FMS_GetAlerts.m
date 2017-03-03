//
//  FMS_GetAlerts.m
//
//  Created by indianic  on 18/08/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FMS_GetAlerts.h"


NSString *const kFMS_GetAlertsLocationId = @"location_id";
NSString *const kFMS_GetAlertsAlertId = @"alert_id";
NSString *const kFMS_GetAlertsMiles = @"miles";
NSString *const kFMS_GetAlertsIsActive = @"is_active";
NSString *const kFMS_GetAlertsLocation = @"location";


@interface FMS_GetAlerts ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation FMS_GetAlerts

@synthesize locationId = _locationId;
@synthesize alertId = _alertId;
@synthesize miles = _miles;
@synthesize isActive = _isActive;
@synthesize location = _location;


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
            self.locationId = [self objectOrNilForKey:kFMS_GetAlertsLocationId fromDictionary:dict];
            self.alertId = [self objectOrNilForKey:kFMS_GetAlertsAlertId fromDictionary:dict];
            self.miles = [self objectOrNilForKey:kFMS_GetAlertsMiles fromDictionary:dict];
            self.isActive = [self objectOrNilForKey:kFMS_GetAlertsIsActive fromDictionary:dict];
            self.location = [self objectOrNilForKey:kFMS_GetAlertsLocation fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.locationId forKey:kFMS_GetAlertsLocationId];
    [mutableDict setValue:self.alertId forKey:kFMS_GetAlertsAlertId];
    [mutableDict setValue:self.miles forKey:kFMS_GetAlertsMiles];
    [mutableDict setValue:self.isActive forKey:kFMS_GetAlertsIsActive];
    [mutableDict setValue:self.location forKey:kFMS_GetAlertsLocation];

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

    self.locationId = [aDecoder decodeObjectForKey:kFMS_GetAlertsLocationId];
    self.alertId = [aDecoder decodeObjectForKey:kFMS_GetAlertsAlertId];
    self.miles = [aDecoder decodeObjectForKey:kFMS_GetAlertsMiles];
    self.isActive = [aDecoder decodeObjectForKey:kFMS_GetAlertsIsActive];
    self.location = [aDecoder decodeObjectForKey:kFMS_GetAlertsLocation];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_locationId forKey:kFMS_GetAlertsLocationId];
    [aCoder encodeObject:_alertId forKey:kFMS_GetAlertsAlertId];
    [aCoder encodeObject:_miles forKey:kFMS_GetAlertsMiles];
    [aCoder encodeObject:_isActive forKey:kFMS_GetAlertsIsActive];
    [aCoder encodeObject:_location forKey:kFMS_GetAlertsLocation];
}

- (id)copyWithZone:(NSZone *)zone
{
    FMS_GetAlerts *copy = [[FMS_GetAlerts alloc] init];
    
    if (copy) {

        copy.locationId = [self.locationId copyWithZone:zone];
        copy.alertId = [self.alertId copyWithZone:zone];
        copy.miles = [self.miles copyWithZone:zone];
        copy.isActive = [self.isActive copyWithZone:zone];
        copy.location = [self.location copyWithZone:zone];
    }
    
    return copy;
}


@end
