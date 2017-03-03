//
//  StatusReason.m
//
//  Created by Manish Mundra on 12/08/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "StatusReason.h"


NSString *const kStatusReasonReasonId = @"reason_id";
NSString *const kStatusReasonReasonName = @"reason_name";


@interface StatusReason ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation StatusReason

@synthesize reasonId = _reasonId;
@synthesize reasonName = _reasonName;


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
            self.reasonId = [self objectOrNilForKey:kStatusReasonReasonId fromDictionary:dict];
            self.reasonName = [self objectOrNilForKey:kStatusReasonReasonName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.reasonId forKey:kStatusReasonReasonId];
    [mutableDict setValue:self.reasonName forKey:kStatusReasonReasonName];

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

    self.reasonId = [aDecoder decodeObjectForKey:kStatusReasonReasonId];
    self.reasonName = [aDecoder decodeObjectForKey:kStatusReasonReasonName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_reasonId forKey:kStatusReasonReasonId];
    [aCoder encodeObject:_reasonName forKey:kStatusReasonReasonName];
}

- (id)copyWithZone:(NSZone *)zone
{
    StatusReason *copy = [[StatusReason alloc] init];
    
    if (copy) {

        copy.reasonId = [self.reasonId copyWithZone:zone];
        copy.reasonName = [self.reasonName copyWithZone:zone];
    }
    
    return copy;
}


@end
