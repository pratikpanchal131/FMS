//
//  Location.m
//
//  Created by Manish Mundra on 14/08/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "Location.h"


NSString *const kLocationLocationId = @"location_id";
NSString *const kLocationLocationName = @"location_name";


@interface Location ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Location

@synthesize locationId = _locationId;
@synthesize locationName = _locationName;


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
            self.locationId = [self objectOrNilForKey:kLocationLocationId fromDictionary:dict];
            self.locationName = [self objectOrNilForKey:kLocationLocationName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.locationId forKey:kLocationLocationId];
    [mutableDict setValue:self.locationName forKey:kLocationLocationName];

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

    self.locationId = [aDecoder decodeObjectForKey:kLocationLocationId];
    self.locationName = [aDecoder decodeObjectForKey:kLocationLocationName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_locationId forKey:kLocationLocationId];
    [aCoder encodeObject:_locationName forKey:kLocationLocationName];
}

- (id)copyWithZone:(NSZone *)zone
{
    Location *copy = [[Location alloc] init];
    
    if (copy) {

        copy.locationId = [self.locationId copyWithZone:zone];
        copy.locationName = [self.locationName copyWithZone:zone];
    }
    
    return copy;
}


@end
