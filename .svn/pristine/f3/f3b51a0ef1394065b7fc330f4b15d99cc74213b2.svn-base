//
//  FMS_GetNotification.h
//
//  Created by indianic  on 20/08/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface FMS_GetNotification : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *objectId;
@property (nonatomic, strong) NSString *date;
@property (nonatomic, strong) NSString *notifyText;
@property (nonatomic, strong) NSString *objectType;
@property (nonatomic, strong) NSString *notifyId;
@property (nonatomic, strong) NSString *notificationType;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
