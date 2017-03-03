//
//  FMS_GetNotification.m
//
//  Created by indianic  on 20/08/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FMS_GetNotification.h"


NSString *const kFMS_GetNotificationObjectId = @"object_id";
NSString *const kFMS_GetNotificationDate = @"date";
NSString *const kFMS_GetNotificationNotifyText = @"notify_text";
NSString *const kFMS_GetNotificationObjectType = @"object_type";
NSString *const kFMS_GetNotificationNotifyId = @"notify_id";
NSString *const kFMS_GetNotificationNotificationType = @"notification_type";

@interface FMS_GetNotification ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation FMS_GetNotification

@synthesize objectId = _objectId;
@synthesize date = _date;
@synthesize notifyText = _notifyText;
@synthesize objectType = _objectType;
@synthesize notifyId = _notifyId;
@synthesize notificationType= _notificationType;

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
            self.objectId = [self objectOrNilForKey:kFMS_GetNotificationObjectId fromDictionary:dict];
            self.date = [self objectOrNilForKey:kFMS_GetNotificationDate fromDictionary:dict];
            self.notifyText = [self objectOrNilForKey:kFMS_GetNotificationNotifyText fromDictionary:dict];
            self.objectType = [self objectOrNilForKey:kFMS_GetNotificationObjectType fromDictionary:dict];
            self.notifyId = [self objectOrNilForKey:kFMS_GetNotificationNotifyId fromDictionary:dict];
            self.notificationType = [self objectOrNilForKey:kFMS_GetNotificationNotificationType fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.objectId forKey:kFMS_GetNotificationObjectId];
    [mutableDict setValue:self.date forKey:kFMS_GetNotificationDate];
    [mutableDict setValue:self.notifyText forKey:kFMS_GetNotificationNotifyText];
    [mutableDict setValue:self.objectType forKey:kFMS_GetNotificationObjectType];
    [mutableDict setValue:self.notifyId forKey:kFMS_GetNotificationNotifyId];
    [mutableDict setValue:self.notificationType forKey:kFMS_GetNotificationNotificationType];

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

    self.objectId = [aDecoder decodeObjectForKey:kFMS_GetNotificationObjectId];
    self.date = [aDecoder decodeObjectForKey:kFMS_GetNotificationDate];
    self.notifyText = [aDecoder decodeObjectForKey:kFMS_GetNotificationNotifyText];
    self.objectType = [aDecoder decodeObjectForKey:kFMS_GetNotificationObjectType];
    self.notifyId = [aDecoder decodeObjectForKey:kFMS_GetNotificationNotifyId];
    self.notificationType = [aDecoder decodeObjectForKey:kFMS_GetNotificationNotificationType];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_objectId forKey:kFMS_GetNotificationObjectId];
    [aCoder encodeObject:_date forKey:kFMS_GetNotificationDate];
    [aCoder encodeObject:_notifyText forKey:kFMS_GetNotificationNotifyText];
    [aCoder encodeObject:_objectType forKey:kFMS_GetNotificationObjectType];
    [aCoder encodeObject:_notifyId forKey:kFMS_GetNotificationNotifyId];
    [aCoder encodeObject:_notificationType forKey:kFMS_GetNotificationNotificationType];
}

- (id)copyWithZone:(NSZone *)zone
{
    FMS_GetNotification *copy = [[FMS_GetNotification alloc] init];
    
    if (copy) {

        copy.objectId = [self.objectId copyWithZone:zone];
        copy.date = [self.date copyWithZone:zone];
        copy.notifyText = [self.notifyText copyWithZone:zone];
        copy.objectType = [self.objectType copyWithZone:zone];
        copy.notifyId = [self.notifyId copyWithZone:zone];
        copy.notificationType = [self.notificationType copyWithZone:zone];
    }
    
    return copy;
}


@end
