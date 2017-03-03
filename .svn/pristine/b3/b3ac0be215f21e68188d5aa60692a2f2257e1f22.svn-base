//
//  FMS_GetAlerts.h
//
//  Created by indianic  on 18/08/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface FMS_GetAlerts : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *locationId;
@property (nonatomic, strong) NSString *alertId;
@property (nonatomic, strong) NSString *miles;
@property (nonatomic, strong) NSString *isActive;
@property (nonatomic, strong) NSString *location;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
