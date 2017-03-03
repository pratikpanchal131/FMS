//
//  StatusReason.h
//
//  Created by Manish Mundra on 12/08/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface StatusReason : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *reasonId;
@property (nonatomic, strong) NSString *reasonName;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
