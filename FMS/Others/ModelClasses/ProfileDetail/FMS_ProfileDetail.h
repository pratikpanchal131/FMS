//
//  FMS_ProfileDetail.h
//
//  Created by indianic  on 18/08/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface FMS_ProfileDetail : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *internalBaseClassIdentifier;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *emailId;
@property (nonatomic, strong) NSString *noOfDriver;
@property (nonatomic, strong) NSString *contractorName;
@property (nonatomic, strong) NSString *avatar;
@property (nonatomic, strong) NSString *address;
@property (nonatomic, strong) NSString *mobileNo;
@property (nonatomic, strong) NSString *dateOfBirth;
@property (nonatomic, strong) NSString *blurImg;
@property (nonatomic, strong) NSString *gender;
@property (nonatomic, strong) NSString *emergencyContactNumber;


@property (nonatomic, strong) NSString *businessName;
@property (nonatomic, strong) NSString *haulerID;
@property (nonatomic, strong) NSString *generalExpirationDate;
@property (nonatomic, strong) NSString *autoLiabilityExDate;
@property (nonatomic, strong) NSString *cargoInsuranceExDate;
@property (nonatomic, strong) NSString *primaryPhoneNo;
@property (nonatomic, strong) NSString *alternatePhoneNo;
@property (nonatomic, strong) NSString *primaryTrailerType;
@property (nonatomic, strong) NSString *alternateTrailerType;
@property (nonatomic, strong) NSString *pakingAddress;
@property (nonatomic, strong) NSString *insurancePolicyName;
@property (nonatomic, strong) NSString *insurancePolicyNumber;
@property (nonatomic, strong) NSString *pakkingAddress;



//    txtBusinessName;
//    txtHaulerID;
//    txtGeneralExpirationDate
//    txtAutoLiabilityExDate;
//    txtCargoInsuranceExDate;
//    txtPrimaryPhoneNo;
//    txtAlternatePhoneNo;
//    txtPrimaryTrailerType;
//    txtAlternateTrailerType;
//    txtPakingAddress;






+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
