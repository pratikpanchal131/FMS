//
//  FMS_GetThreadList.m
//
//  Created by indianic  on 19/08/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FMS_GetThreadList.h"


NSString *const kFMS_GetThreadListEmployeeId = @"employee_id";
NSString *const kFMS_GetThreadListFromMe = @"from_me";
NSString *const kFMS_GetThreadListDate = @"date";
NSString *const kFMS_GetThreadListMessage = @"message";
NSString *const kFMS_GetThreadListThreadId = @"thread_id";
NSString *const kFMS_GetThreadListToNm = @"to_nm";
NSString *const kFMS_GetThreadListEmployeeName = @"employee_name";
NSString *const kFMS_GetThreadListFromNm = @"from_nm";
NSString *const kFMS_GetThreadListIsRead = @"is_read";


@interface FMS_GetThreadList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation FMS_GetThreadList

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
            self.employeeId = [self objectOrNilForKey:kFMS_GetThreadListEmployeeId fromDictionary:dict];
            self.fromMe = [[self objectOrNilForKey:kFMS_GetThreadListFromMe fromDictionary:dict] doubleValue];
            self.date = [self objectOrNilForKey:kFMS_GetThreadListDate fromDictionary:dict];
            self.message = [self objectOrNilForKey:kFMS_GetThreadListMessage fromDictionary:dict];
            self.threadId = [self objectOrNilForKey:kFMS_GetThreadListThreadId fromDictionary:dict];
            self.toNm = [self objectOrNilForKey:kFMS_GetThreadListToNm fromDictionary:dict];
            self.employeeName = [self objectOrNilForKey:kFMS_GetThreadListEmployeeName fromDictionary:dict];
            self.fromNm = [self objectOrNilForKey:kFMS_GetThreadListFromNm fromDictionary:dict];
            self.is_read = [self objectOrNilForKey:kFMS_GetThreadListIsRead fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.employeeId forKey:kFMS_GetThreadListEmployeeId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.fromMe] forKey:kFMS_GetThreadListFromMe];
    [mutableDict setValue:self.date forKey:kFMS_GetThreadListDate];
    [mutableDict setValue:self.message forKey:kFMS_GetThreadListMessage];
    [mutableDict setValue:self.threadId forKey:kFMS_GetThreadListThreadId];
    [mutableDict setValue:self.toNm forKey:kFMS_GetThreadListToNm];
    [mutableDict setValue:self.employeeName forKey:kFMS_GetThreadListEmployeeName];
    [mutableDict setValue:self.fromNm forKey:kFMS_GetThreadListFromNm];
    [mutableDict setValue:self.is_read forKey:kFMS_GetThreadListIsRead];
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

    self.employeeId = [aDecoder decodeObjectForKey:kFMS_GetThreadListEmployeeId];
    self.fromMe = [aDecoder decodeDoubleForKey:kFMS_GetThreadListFromMe];
    self.date = [aDecoder decodeObjectForKey:kFMS_GetThreadListDate];
    self.message = [aDecoder decodeObjectForKey:kFMS_GetThreadListMessage];
    self.threadId = [aDecoder decodeObjectForKey:kFMS_GetThreadListThreadId];
    self.toNm = [aDecoder decodeObjectForKey:kFMS_GetThreadListToNm];
    self.employeeName = [aDecoder decodeObjectForKey:kFMS_GetThreadListEmployeeName];
    self.fromNm = [aDecoder decodeObjectForKey:kFMS_GetThreadListFromNm];
    self.is_read = [aDecoder decodeObjectForKey:kFMS_GetThreadListIsRead];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_employeeId forKey:kFMS_GetThreadListEmployeeId];
    [aCoder encodeDouble:_fromMe forKey:kFMS_GetThreadListFromMe];
    [aCoder encodeObject:_date forKey:kFMS_GetThreadListDate];
    [aCoder encodeObject:_message forKey:kFMS_GetThreadListMessage];
    [aCoder encodeObject:_threadId forKey:kFMS_GetThreadListThreadId];
    [aCoder encodeObject:_toNm forKey:kFMS_GetThreadListToNm];
    [aCoder encodeObject:_employeeName forKey:kFMS_GetThreadListEmployeeName];
    [aCoder encodeObject:_fromNm forKey:kFMS_GetThreadListFromNm];
    [aCoder encodeObject:_is_read forKey:kFMS_GetThreadListIsRead];
}

- (id)copyWithZone:(NSZone *)zone
{
    FMS_GetThreadList *copy = [[FMS_GetThreadList alloc] init];
    
    if (copy) {

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
