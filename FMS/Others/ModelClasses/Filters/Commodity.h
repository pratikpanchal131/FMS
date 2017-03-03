//
//  Commodity.h
//
//  Created by Manish Mundra on 14/08/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Commodity : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *commodityId;
@property (nonatomic, strong) NSString *commodityName;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
