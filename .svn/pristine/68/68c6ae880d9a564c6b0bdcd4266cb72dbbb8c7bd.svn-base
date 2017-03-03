//
//  Status.m
//
//  Created by Manish Mundra on 14/08/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "Status.h"
#import "Missed.h"
#import "Cancelled.h"


NSString *const kStatusMissed = @"Missed";
NSString *const kStatusCancelled = @"Cancelled";


@interface Status ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Status

@synthesize missed = _missed;
@synthesize cancelled = _cancelled;


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
    NSObject *receivedMissed = [dict objectForKey:kStatusMissed];
    NSMutableArray *parsedMissed = [NSMutableArray array];
    if ([receivedMissed isKindOfClass:[NSMutableArray class]]) {
        for (NSDictionary *item in (NSMutableArray *)receivedMissed) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedMissed addObject:[Missed modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedMissed isKindOfClass:[NSDictionary class]]) {
       [parsedMissed addObject:[Missed modelObjectWithDictionary:(NSDictionary *)receivedMissed]];
    }

    self.missed = [NSMutableArray arrayWithArray:parsedMissed];
    NSObject *receivedCancelled = [dict objectForKey:kStatusCancelled];
    NSMutableArray *parsedCancelled = [NSMutableArray array];
    if ([receivedCancelled isKindOfClass:[NSMutableArray class]]) {
        for (NSDictionary *item in (NSMutableArray *)receivedCancelled) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedCancelled addObject:[Cancelled modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedCancelled isKindOfClass:[NSDictionary class]]) {
       [parsedCancelled addObject:[Cancelled modelObjectWithDictionary:(NSDictionary *)receivedCancelled]];
    }

    self.cancelled = [NSMutableArray arrayWithArray:parsedCancelled];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForMissed = [NSMutableArray array];
    for (NSObject *subArrayObject in self.missed) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForMissed addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForMissed addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSMutableArray arrayWithArray:tempArrayForMissed] forKey:kStatusMissed];
    NSMutableArray *tempArrayForCancelled = [NSMutableArray array];
    for (NSObject *subArrayObject in self.cancelled) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForCancelled addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForCancelled addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSMutableArray arrayWithArray:tempArrayForCancelled] forKey:kStatusCancelled];

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

    self.missed = [aDecoder decodeObjectForKey:kStatusMissed];
    self.cancelled = [aDecoder decodeObjectForKey:kStatusCancelled];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_missed forKey:kStatusMissed];
    [aCoder encodeObject:_cancelled forKey:kStatusCancelled];
}

- (id)copyWithZone:(NSZone *)zone
{
    Status *copy = [[Status alloc] init];
    
    if (copy) {

        copy.missed = [self.missed copyWithZone:zone];
        copy.cancelled = [self.cancelled copyWithZone:zone];
    }
    
    return copy;
}


@end
