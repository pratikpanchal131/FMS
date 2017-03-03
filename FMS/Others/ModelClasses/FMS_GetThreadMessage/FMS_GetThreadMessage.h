//
//  FMS_GetThreadMessage.h
//
//  Created by indianic  on 20/08/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface FMS_GetThreadMessage : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *msgId;
@property (nonatomic, strong) NSString *employeeId;
@property (nonatomic, assign) double fromMe;
@property (nonatomic, strong) NSString *date;
@property (nonatomic, strong) NSString *message;
@property (nonatomic, strong) NSString *threadId;
@property (nonatomic, strong) NSString *toNm;
@property (nonatomic, strong) NSString *employeeName;
@property (nonatomic, strong) NSString *fromNm;
@property (nonatomic, strong) NSString *is_read;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
