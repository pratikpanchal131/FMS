//
//  Data.h
//
//  Created by Manish Mundra on 14/08/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Status;

@interface Data : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) Status *status;
@property (nonatomic, strong) NSArray *commodity;
@property (nonatomic, strong) NSArray *location;
@property (nonatomic, strong) NSArray *driver;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
