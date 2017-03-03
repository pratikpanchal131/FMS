//
//  FMS_MyReportCard.h
//
//  Created by indianic  on 21/08/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface FMS_MyReportCard : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *avatar;
@property (nonatomic, strong) NSString *hauledRank;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *deliveryRank;
@property (nonatomic, strong) NSString *commitment;
@property (nonatomic, strong) NSString *loadDelivered;
@property (nonatomic, strong) NSString *blurImg;
@property (nonatomic, strong) NSString *milesRank;
@property (nonatomic, strong) NSString *totalEarning;
@property (nonatomic, strong) NSString *milesClocked;
@property (nonatomic, strong) NSString *loadCommited;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
