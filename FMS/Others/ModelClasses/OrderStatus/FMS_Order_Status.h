//
//  FMS_Order_Status.h
//
//  Created by Manish Mundra on 17/08/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface FMS_Order_Status : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *driverId;
@property (nonatomic, strong) NSString *orderStatus;
@property (nonatomic, strong) NSString *orderId;
@property (nonatomic, strong) NSString *toLocation;
@property (nonatomic, strong) NSString *fromLocation;
@property (nonatomic, strong) NSString *date;
@property (nonatomic, strong) NSString *driverName;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
