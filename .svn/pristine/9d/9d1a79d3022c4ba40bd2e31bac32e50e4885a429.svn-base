//
//  Missed.m
//
//  Created by Manish Mundra on 14/08/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "Missed.h"


NSString *const kMissedReasonId = @"reason_id";
NSString *const kMissedReason = @"reason";


@interface Missed ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Missed

@synthesize reasonId = _reasonId;
@synthesize reason = _reason;


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
            self.reasonId = [self objectOrNilForKey:kMissedReasonId fromDictionary:dict];
            self.reason = [self objectOrNilForKey:kMissedReason fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.reasonId forKey:kMissedReasonId];
    [mutableDict setValue:self.reason forKey:kMissedReason];

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

    self.reasonId = [aDecoder decodeObjectForKey:kMissedReasonId];
    self.reason = [aDecoder decodeObjectForKey:kMissedReason];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_reasonId forKey:kMissedReasonId];
    [aCoder encodeObject:_reason forKey:kMissedReason];
}

- (id)copyWithZone:(NSZone *)zone
{
    Missed *copy = [[Missed alloc] init];
    
    if (copy) {

        copy.reasonId = [self.reasonId copyWithZone:zone];
        copy.reason = [self.reason copyWithZone:zone];
    }
    
    return copy;
}


@end
