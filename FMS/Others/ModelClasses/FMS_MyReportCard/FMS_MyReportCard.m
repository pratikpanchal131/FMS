//
//  FMS_MyReportCard.m
//
//  Created by indianic  on 21/08/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FMS_MyReportCard.h"


NSString *const kFMS_MyReportCardAvatar = @"avatar";
NSString *const kFMS_MyReportCardHauledRank = @"hauled_rank";
NSString *const kFMS_MyReportCardName = @"name";
NSString *const kFMS_MyReportCardDeliveryRank = @"delivery_rank";
NSString *const kFMS_MyReportCardCommitment = @"commitment";
NSString *const kFMS_MyReportCardLoadDelivered = @"load_delivered";
NSString *const kFMS_MyReportCardBlurImg = @"blur_img";
NSString *const kFMS_MyReportCardMilesRank = @"miles_rank";
NSString *const kFMS_MyReportCardTotalEarning = @"total_earning";
NSString *const kFMS_MyReportCardMilesClocked = @"miles_clocked";
NSString *const kFMS_MyReportCardLoadCommited = @"load_commited";


@interface FMS_MyReportCard ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation FMS_MyReportCard

@synthesize avatar = _avatar;
@synthesize hauledRank = _hauledRank;
@synthesize name = _name;
@synthesize deliveryRank = _deliveryRank;
@synthesize commitment = _commitment;
@synthesize loadDelivered = _loadDelivered;
@synthesize blurImg = _blurImg;
@synthesize milesRank = _milesRank;
@synthesize totalEarning = _totalEarning;
@synthesize milesClocked = _milesClocked;
@synthesize loadCommited = _loadCommited;


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
            self.avatar = [self objectOrNilForKey:kFMS_MyReportCardAvatar fromDictionary:dict];
            self.hauledRank = [self objectOrNilForKey:kFMS_MyReportCardHauledRank fromDictionary:dict];
            self.name = [self objectOrNilForKey:kFMS_MyReportCardName fromDictionary:dict];
            self.deliveryRank = [self objectOrNilForKey:kFMS_MyReportCardDeliveryRank fromDictionary:dict];
            self.commitment = [self objectOrNilForKey:kFMS_MyReportCardCommitment fromDictionary:dict];
            self.loadDelivered = [self objectOrNilForKey:kFMS_MyReportCardLoadDelivered fromDictionary:dict];
            self.blurImg = [self objectOrNilForKey:kFMS_MyReportCardBlurImg fromDictionary:dict];
            self.milesRank = [self objectOrNilForKey:kFMS_MyReportCardMilesRank fromDictionary:dict];
            self.totalEarning = [self objectOrNilForKey:kFMS_MyReportCardTotalEarning fromDictionary:dict];
            self.milesClocked = [self objectOrNilForKey:kFMS_MyReportCardMilesClocked fromDictionary:dict];
            self.loadCommited = [self objectOrNilForKey:kFMS_MyReportCardLoadCommited fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.avatar forKey:kFMS_MyReportCardAvatar];
    [mutableDict setValue:self.hauledRank forKey:kFMS_MyReportCardHauledRank];
    [mutableDict setValue:self.name forKey:kFMS_MyReportCardName];
    [mutableDict setValue:self.deliveryRank forKey:kFMS_MyReportCardDeliveryRank];
    [mutableDict setValue:self.commitment forKey:kFMS_MyReportCardCommitment];
    [mutableDict setValue:self.loadDelivered forKey:kFMS_MyReportCardLoadDelivered];
    [mutableDict setValue:self.blurImg forKey:kFMS_MyReportCardBlurImg];
    [mutableDict setValue:self.milesRank forKey:kFMS_MyReportCardMilesRank];
    [mutableDict setValue:self.totalEarning forKey:kFMS_MyReportCardTotalEarning];
    [mutableDict setValue:self.milesClocked forKey:kFMS_MyReportCardMilesClocked];
    [mutableDict setValue:self.loadCommited forKey:kFMS_MyReportCardLoadCommited];

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

    self.avatar = [aDecoder decodeObjectForKey:kFMS_MyReportCardAvatar];
    self.hauledRank = [aDecoder decodeObjectForKey:kFMS_MyReportCardHauledRank];
    self.name = [aDecoder decodeObjectForKey:kFMS_MyReportCardName];
    self.deliveryRank = [aDecoder decodeObjectForKey:kFMS_MyReportCardDeliveryRank];
    self.commitment = [aDecoder decodeObjectForKey:kFMS_MyReportCardCommitment];
    self.loadDelivered = [aDecoder decodeObjectForKey:kFMS_MyReportCardLoadDelivered];
    self.blurImg = [aDecoder decodeObjectForKey:kFMS_MyReportCardBlurImg];
    self.milesRank = [aDecoder decodeObjectForKey:kFMS_MyReportCardMilesRank];
    self.totalEarning = [aDecoder decodeObjectForKey:kFMS_MyReportCardTotalEarning];
    self.milesClocked = [aDecoder decodeObjectForKey:kFMS_MyReportCardMilesClocked];
    self.loadCommited = [aDecoder decodeObjectForKey:kFMS_MyReportCardLoadCommited];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_avatar forKey:kFMS_MyReportCardAvatar];
    [aCoder encodeObject:_hauledRank forKey:kFMS_MyReportCardHauledRank];
    [aCoder encodeObject:_name forKey:kFMS_MyReportCardName];
    [aCoder encodeObject:_deliveryRank forKey:kFMS_MyReportCardDeliveryRank];
    [aCoder encodeObject:_commitment forKey:kFMS_MyReportCardCommitment];
    [aCoder encodeObject:_loadDelivered forKey:kFMS_MyReportCardLoadDelivered];
    [aCoder encodeObject:_blurImg forKey:kFMS_MyReportCardBlurImg];
    [aCoder encodeObject:_milesRank forKey:kFMS_MyReportCardMilesRank];
    [aCoder encodeObject:_totalEarning forKey:kFMS_MyReportCardTotalEarning];
    [aCoder encodeObject:_milesClocked forKey:kFMS_MyReportCardMilesClocked];
    [aCoder encodeObject:_loadCommited forKey:kFMS_MyReportCardLoadCommited];
}

- (id)copyWithZone:(NSZone *)zone
{
    FMS_MyReportCard *copy = [[FMS_MyReportCard alloc] init];
    
    if (copy) {

        copy.avatar = [self.avatar copyWithZone:zone];
        copy.hauledRank = [self.hauledRank copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
        copy.deliveryRank = [self.deliveryRank copyWithZone:zone];
        copy.commitment = [self.commitment copyWithZone:zone];
        copy.loadDelivered = [self.loadDelivered copyWithZone:zone];
        copy.blurImg = [self.blurImg copyWithZone:zone];
        copy.milesRank = [self.milesRank copyWithZone:zone];
        copy.totalEarning = [self.totalEarning copyWithZone:zone];
        copy.milesClocked = [self.milesClocked copyWithZone:zone];
        copy.loadCommited = [self.loadCommited copyWithZone:zone];
    }
    
    return copy;
}


@end
