//
//  Commodity.m
//
//  Created by Manish Mundra on 14/08/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "Commodity.h"


NSString *const kCommodityCommodityId = @"commodity_id";
NSString *const kCommodityCommodityName = @"commodity_name";


@interface Commodity ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Commodity

@synthesize commodityId = _commodityId;
@synthesize commodityName = _commodityName;


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
            self.commodityId = [self objectOrNilForKey:kCommodityCommodityId fromDictionary:dict];
            self.commodityName = [self objectOrNilForKey:kCommodityCommodityName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.commodityId forKey:kCommodityCommodityId];
    [mutableDict setValue:self.commodityName forKey:kCommodityCommodityName];

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

    self.commodityId = [aDecoder decodeObjectForKey:kCommodityCommodityId];
    self.commodityName = [aDecoder decodeObjectForKey:kCommodityCommodityName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_commodityId forKey:kCommodityCommodityId];
    [aCoder encodeObject:_commodityName forKey:kCommodityCommodityName];
}

- (id)copyWithZone:(NSZone *)zone
{
    Commodity *copy = [[Commodity alloc] init];
    
    if (copy) {

        copy.commodityId = [self.commodityId copyWithZone:zone];
        copy.commodityName = [self.commodityName copyWithZone:zone];
    }
    
    return copy;
}


@end
