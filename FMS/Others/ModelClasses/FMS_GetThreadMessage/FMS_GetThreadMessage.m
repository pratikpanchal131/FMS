//
//  FMS_GetThreadMessage.m
//
//  Created by indianic  on 20/08/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FMS_GetThreadMessage.h"


NSString *const kFMS_GetThreadMessageMsgId = @"msg_id";
NSString *const kFMS_GetThreadMessageEmployeeId = @"employee_id";
NSString *const kFMS_GetThreadMessageFromMe = @"from_me";
NSString *const kFMS_GetThreadMessageDate = @"date";
NSString *const kFMS_GetThreadMessageMessage = @"message";
NSString *const kFMS_GetThreadMessageThreadId = @"thread_id";
NSString *const kFMS_GetThreadMessageToNm = @"to_nm";
NSString *const kFMS_GetThreadMessageEmployeeName = @"employee_name";
NSString *const kFMS_GetThreadMessageFromNm = @"from_nm";
NSString *const kFMS_GetThreadMessageIsRead = @"is_read";


@interface FMS_GetThreadMessage ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation FMS_GetThreadMessage

@synthesize msgId = _msgId;
@synthesize employeeId = _employeeId;
@synthesize fromMe = _fromMe;
@synthesize date = _date;
@synthesize message = _message;
@synthesize threadId = _threadId;
@synthesize toNm = _toNm;
@synthesize employeeName = _employeeName;
@synthesize fromNm = _fromNm;
@synthesize is_read = _is_read;


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
            self.msgId = [self objectOrNilForKey:kFMS_GetThreadMessageMsgId fromDictionary:dict];
            self.employeeId = [self objectOrNilForKey:kFMS_GetThreadMessageEmployeeId fromDictionary:dict];
            self.fromMe = [[self objectOrNilForKey:kFMS_GetThreadMessageFromMe fromDictionary:dict] doubleValue];
            self.date = [self objectOrNilForKey:kFMS_GetThreadMessageDate fromDictionary:dict];
            self.message = [self objectOrNilForKey:kFMS_GetThreadMessageMessage fromDictionary:dict];
            self.threadId = [self objectOrNilForKey:kFMS_GetThreadMessageThreadId fromDictionary:dict];
            self.toNm = [self objectOrNilForKey:kFMS_GetThreadMessageToNm fromDictionary:dict];
            self.employeeName = [self objectOrNilForKey:kFMS_GetThreadMessageEmployeeName fromDictionary:dict];
            self.fromNm = [self objectOrNilForKey:kFMS_GetThreadMessageFromNm fromDictionary:dict];
            self.is_read = [self objectOrNilForKey:kFMS_GetThreadMessageIsRead fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.msgId forKey:kFMS_GetThreadMessageMsgId];
    [mutableDict setValue:self.employeeId forKey:kFMS_GetThreadMessageEmployeeId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.fromMe] forKey:kFMS_GetThreadMessageFromMe];
    [mutableDict setValue:self.date forKey:kFMS_GetThreadMessageDate];
    [mutableDict setValue:self.message forKey:kFMS_GetThreadMessageMessage];
    [mutableDict setValue:self.threadId forKey:kFMS_GetThreadMessageThreadId];
    [mutableDict setValue:self.toNm forKey:kFMS_GetThreadMessageToNm];
    [mutableDict setValue:self.employeeName forKey:kFMS_GetThreadMessageEmployeeName];
    [mutableDict setValue:self.fromNm forKey:kFMS_GetThreadMessageFromNm];
    [mutableDict setValue:self.is_read forKey:kFMS_GetThreadMessageIsRead];

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

    self.msgId = [aDecoder decodeObjectForKey:kFMS_GetThreadMessageMsgId];
    self.employeeId = [aDecoder decodeObjectForKey:kFMS_GetThreadMessageEmployeeId];
    self.fromMe = [aDecoder decodeDoubleForKey:kFMS_GetThreadMessageFromMe];
    self.date = [aDecoder decodeObjectForKey:kFMS_GetThreadMessageDate];
    self.message = [aDecoder decodeObjectForKey:kFMS_GetThreadMessageMessage];
    self.threadId = [aDecoder decodeObjectForKey:kFMS_GetThreadMessageThreadId];
    self.toNm = [aDecoder decodeObjectForKey:kFMS_GetThreadMessageToNm];
    self.employeeName = [aDecoder decodeObjectForKey:kFMS_GetThreadMessageEmployeeName];
    self.fromNm = [aDecoder decodeObjectForKey:kFMS_GetThreadMessageFromNm];
    self.is_read= [aDecoder decodeObjectForKey:kFMS_GetThreadMessageIsRead];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_msgId forKey:kFMS_GetThreadMessageMsgId];
    [aCoder encodeObject:_employeeId forKey:kFMS_GetThreadMessageEmployeeId];
    [aCoder encodeDouble:_fromMe forKey:kFMS_GetThreadMessageFromMe];
    [aCoder encodeObject:_date forKey:kFMS_GetThreadMessageDate];
    [aCoder encodeObject:_message forKey:kFMS_GetThreadMessageMessage];
    [aCoder encodeObject:_threadId forKey:kFMS_GetThreadMessageThreadId];
    [aCoder encodeObject:_toNm forKey:kFMS_GetThreadMessageToNm];
    [aCoder encodeObject:_employeeName forKey:kFMS_GetThreadMessageEmployeeName];
    [aCoder encodeObject:_fromNm forKey:kFMS_GetThreadMessageFromNm];
    [aCoder encodeObject:_is_read forKey:kFMS_GetThreadMessageIsRead];
}

- (id)copyWithZone:(NSZone *)zone
{
    FMS_GetThreadMessage *copy = [[FMS_GetThreadMessage alloc] init];
    
    if (copy) {

        copy.msgId = [self.msgId copyWithZone:zone];
        copy.employeeId = [self.employeeId copyWithZone:zone];
        copy.fromMe = self.fromMe;
        copy.date = [self.date copyWithZone:zone];
        copy.message = [self.message copyWithZone:zone];
        copy.threadId = [self.threadId copyWithZone:zone];
        copy.toNm = [self.toNm copyWithZone:zone];
        copy.employeeName = [self.employeeName copyWithZone:zone];
        copy.fromNm = [self.fromNm copyWithZone:zone];
        copy.is_read = [self.is_read copyWithZone:zone];
    }
    
    return copy;
}


@end
