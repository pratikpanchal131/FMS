//
//  Status.h
//
//  Created by Manish Mundra on 14/08/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Status : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSMutableArray *missed;
@property (nonatomic, strong) NSMutableArray *cancelled;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
