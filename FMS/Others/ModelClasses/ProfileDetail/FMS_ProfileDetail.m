//
//  FMS_ProfileDetail.m
//
//  Created by indianic  on 18/08/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FMS_ProfileDetail.h"


NSString *const kFMS_ProfileDetailId = @"id";
NSString *const kFMS_ProfileDetailName = @"name";
NSString *const kFMS_ProfileDetailEmailId = @"email_id";
NSString *const kFMS_ProfileDetailNoOfDriver = @"no_of_driver";
NSString *const kFMS_ProfileDetailContractorName = @"contractor_name";
NSString *const kFMS_ProfileDetailAvatar = @"avatar";
NSString *const kFMS_ProfileDetailAddress = @"address";
NSString *const kFMS_ProfileDetailMobileNo = @"mobile_no";
NSString *const kFMS_ProfileDetailDateOfBirth = @"date_of_birth";
NSString *const kFMS_ProfileDetailBlurImg = @"blur_img";
NSString *const kFMS_ProfileDetailGender = @"gender";
NSString *const kFMS_ProfileDetailEmergencyContactNumber = @"emergency_contact_number";




NSString *const kFMS_ProfileDetailBusinessName  = @"buisness_name";
NSString *const kFMS_ProfileDetailHaulerID      = @"hauler_id";
NSString *const kFMS_ProfileDetailGeneralExpirationDate = @"genral_exp_date";
NSString *const kFMS_ProfileDetailAutoLiabilityExDate = @"auto_exp_date";
NSString *const kFMS_ProfileDetailCargoInsuranceExDate = @"cargo_exp_date";
NSString *const kFMS_ProfileDetailPrimaryPhoneNo = @"primary_no";
NSString *const kFMS_ProfileDetailAlternatePhoneNo = @"alternate_no";
NSString *const kFMS_ProfileDetailPrimaryTrailerType = @"primary_trailer_type";
NSString *const kFMS_ProfileDetailAlternateTrailerType = @"alternate_trailer_type";
NSString *const kFMS_ProfileDetailPakingAddress = @"parking_address";
NSString *const kFMS_ProfileDetailInsurancePolicyName = @"policy_name";
NSString *const kFMS_ProfileDetailInsurancePolicyNumber = @"policy_no";



//txtFInsurancePolicyName.text,@"ins_policyname",
//txtFInsurancePolicyNo.text,@"ins_policyno",
//
//BusinessName;
//HaulerID;
//GeneralExpirationDate
//AutoLiabilityExDate;
//CargoInsuranceExDate;
//PrimaryPhoneNo;
//AlternatePhoneNo;
//PrimaryTrailerType;
//AlternateTrailerType;
//PakingAddress;
//InsurancePolicyName;
//InsurancePolicyNumber
//PakkingAddress;

@interface FMS_ProfileDetail ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation FMS_ProfileDetail

@synthesize internalBaseClassIdentifier = _internalBaseClassIdentifier;
@synthesize name = _name;
@synthesize emailId = _emailId;
@synthesize noOfDriver = _noOfDriver;
@synthesize contractorName = _contractorName;
@synthesize avatar = _avatar;
@synthesize address = _address;
@synthesize mobileNo = _mobileNo;
@synthesize dateOfBirth = _dateOfBirth;
@synthesize blurImg = _blurImg;
@synthesize gender = _gender;
@synthesize emergencyContactNumber = _emergencyContactNumber;

@synthesize businessName            = _businessName;
@synthesize haulerID                = _haulerID;
@synthesize generalExpirationDate   = _generalExpirationDate;
@synthesize autoLiabilityExDate     = _autoLiabilityExDate;
@synthesize cargoInsuranceExDate    = _cargoInsuranceExDate;
@synthesize primaryPhoneNo          = _primaryPhoneNo;
@synthesize alternatePhoneNo        = _alternatePhoneNo;
@synthesize primaryTrailerType      = _primaryTrailerType;
@synthesize alternateTrailerType    = _alternateTrailerType ;
@synthesize pakingAddress           = _pakingAddress;
@synthesize insurancePolicyName     = _insurancePolicyName ;
@synthesize insurancePolicyNumber   = _insurancePolicyNumber;
@synthesize pakkingAddress          = _pakkingAddress ;





//businessName;
//haulerID;
//generalExpirationDate
//autoLiabilityExDate;
//cargoInsuranceExDate;
//primaryPhoneNo;
//alternatePhoneNo;
//primaryTrailerType;
//alternateTrailerType;
//pakingAddress;
//insurancePolicyName;
//insurancePolicyNumber
//pakkingAddress;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.internalBaseClassIdentifier = [self objectOrNilForKey:kFMS_ProfileDetailId fromDictionary:dict];
            self.name = [self objectOrNilForKey:kFMS_ProfileDetailName fromDictionary:dict];
            self.emailId = [self objectOrNilForKey:kFMS_ProfileDetailEmailId fromDictionary:dict];
            self.noOfDriver = [self objectOrNilForKey:kFMS_ProfileDetailNoOfDriver fromDictionary:dict];
            self.contractorName = [self objectOrNilForKey:kFMS_ProfileDetailContractorName fromDictionary:dict];
            self.avatar = [self objectOrNilForKey:kFMS_ProfileDetailAvatar fromDictionary:dict];
            self.address = [self objectOrNilForKey:kFMS_ProfileDetailAddress fromDictionary:dict];
            self.mobileNo = [self objectOrNilForKey:kFMS_ProfileDetailMobileNo fromDictionary:dict];
            self.dateOfBirth = [self objectOrNilForKey:kFMS_ProfileDetailDateOfBirth fromDictionary:dict];
            self.blurImg = [self objectOrNilForKey:kFMS_ProfileDetailBlurImg fromDictionary:dict];
            self.gender = [self objectOrNilForKey:kFMS_ProfileDetailGender fromDictionary:dict];
            self.emergencyContactNumber = [self objectOrNilForKey:kFMS_ProfileDetailEmergencyContactNumber fromDictionary:dict];
        
        
        self.businessName = [self objectOrNilForKey:kFMS_ProfileDetailBusinessName fromDictionary:dict];
        self.haulerID = [self objectOrNilForKey:kFMS_ProfileDetailHaulerID fromDictionary:dict];
        self.generalExpirationDate = [self objectOrNilForKey:kFMS_ProfileDetailGeneralExpirationDate fromDictionary:dict];
        self.autoLiabilityExDate = [self objectOrNilForKey:kFMS_ProfileDetailAutoLiabilityExDate fromDictionary:dict];
        self.cargoInsuranceExDate = [self objectOrNilForKey:kFMS_ProfileDetailCargoInsuranceExDate fromDictionary:dict];
        self.primaryPhoneNo = [self objectOrNilForKey:kFMS_ProfileDetailPrimaryPhoneNo fromDictionary:dict];
        self.alternatePhoneNo = [self objectOrNilForKey:kFMS_ProfileDetailAlternatePhoneNo fromDictionary:dict];
        self.primaryTrailerType = [self objectOrNilForKey:kFMS_ProfileDetailPrimaryTrailerType fromDictionary:dict];
        self.alternateTrailerType = [self objectOrNilForKey:kFMS_ProfileDetailAlternateTrailerType fromDictionary:dict];
        self.pakingAddress = [self objectOrNilForKey:kFMS_ProfileDetailPakingAddress fromDictionary:dict];
        self.insurancePolicyName = [self objectOrNilForKey:kFMS_ProfileDetailInsurancePolicyName fromDictionary:dict];
        self.insurancePolicyNumber = [self objectOrNilForKey:kFMS_ProfileDetailInsurancePolicyNumber fromDictionary:dict];
        

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.internalBaseClassIdentifier forKey:kFMS_ProfileDetailId];
    [mutableDict setValue:self.name forKey:kFMS_ProfileDetailName];
    [mutableDict setValue:self.emailId forKey:kFMS_ProfileDetailEmailId];
    [mutableDict setValue:self.noOfDriver forKey:kFMS_ProfileDetailNoOfDriver];
    [mutableDict setValue:self.contractorName forKey:kFMS_ProfileDetailContractorName];
    [mutableDict setValue:self.avatar forKey:kFMS_ProfileDetailAvatar];
    [mutableDict setValue:self.address forKey:kFMS_ProfileDetailAddress];
    [mutableDict setValue:self.mobileNo forKey:kFMS_ProfileDetailMobileNo];
    [mutableDict setValue:self.dateOfBirth forKey:kFMS_ProfileDetailDateOfBirth];
    [mutableDict setValue:self.blurImg forKey:kFMS_ProfileDetailBlurImg];
    [mutableDict setValue:self.gender forKey:kFMS_ProfileDetailGender];
    [mutableDict setValue:self.emergencyContactNumber forKey:kFMS_ProfileDetailEmergencyContactNumber];
    
    
    [mutableDict setValue:self.businessName forKey:kFMS_ProfileDetailBusinessName];
    [mutableDict setValue:self.haulerID forKey:kFMS_ProfileDetailHaulerID];
    [mutableDict setValue:self.generalExpirationDate forKey:kFMS_ProfileDetailGeneralExpirationDate];
    [mutableDict setValue:self.autoLiabilityExDate forKey:kFMS_ProfileDetailAutoLiabilityExDate];
    [mutableDict setValue:self.cargoInsuranceExDate forKey:kFMS_ProfileDetailCargoInsuranceExDate];
    [mutableDict setValue:self.primaryPhoneNo forKey:kFMS_ProfileDetailPrimaryPhoneNo];
    [mutableDict setValue:self.alternatePhoneNo forKey:kFMS_ProfileDetailAlternatePhoneNo];
    [mutableDict setValue:self.primaryTrailerType forKey:kFMS_ProfileDetailPrimaryTrailerType];
    [mutableDict setValue:self.alternateTrailerType forKey:kFMS_ProfileDetailAlternateTrailerType];
    [mutableDict setValue:self.pakingAddress forKey:kFMS_ProfileDetailPakingAddress];
    [mutableDict setValue:self.insurancePolicyName forKey:kFMS_ProfileDetailInsurancePolicyName];
    [mutableDict setValue:self.insurancePolicyNumber forKey:kFMS_ProfileDetailInsurancePolicyNumber];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.internalBaseClassIdentifier = [aDecoder decodeObjectForKey:kFMS_ProfileDetailId];
    self.name = [aDecoder decodeObjectForKey:kFMS_ProfileDetailName];
    self.emailId = [aDecoder decodeObjectForKey:kFMS_ProfileDetailEmailId];
    self.noOfDriver = [aDecoder decodeObjectForKey:kFMS_ProfileDetailNoOfDriver];
    self.contractorName = [aDecoder decodeObjectForKey:kFMS_ProfileDetailContractorName];
    self.avatar = [aDecoder decodeObjectForKey:kFMS_ProfileDetailAvatar];
    self.address = [aDecoder decodeObjectForKey:kFMS_ProfileDetailAddress];
    self.mobileNo = [aDecoder decodeObjectForKey:kFMS_ProfileDetailMobileNo];
    self.dateOfBirth = [aDecoder decodeObjectForKey:kFMS_ProfileDetailDateOfBirth];
    self.blurImg = [aDecoder decodeObjectForKey:kFMS_ProfileDetailBlurImg];
    self.gender = [aDecoder decodeObjectForKey:kFMS_ProfileDetailGender];
    self.emergencyContactNumber = [aDecoder decodeObjectForKey:kFMS_ProfileDetailEmergencyContactNumber];
    
    
    
    self.businessName = [aDecoder decodeObjectForKey:kFMS_ProfileDetailBusinessName];
    self.haulerID = [aDecoder decodeObjectForKey:kFMS_ProfileDetailHaulerID ];
    self.generalExpirationDate = [aDecoder decodeObjectForKey:kFMS_ProfileDetailGeneralExpirationDate];
    self.autoLiabilityExDate = [aDecoder decodeObjectForKey:kFMS_ProfileDetailAutoLiabilityExDate];
    self.cargoInsuranceExDate = [aDecoder decodeObjectForKey:kFMS_ProfileDetailCargoInsuranceExDate];
    self.primaryPhoneNo = [aDecoder decodeObjectForKey:kFMS_ProfileDetailPrimaryPhoneNo];
    self.alternatePhoneNo = [aDecoder decodeObjectForKey:kFMS_ProfileDetailAlternatePhoneNo];
    self.primaryTrailerType = [aDecoder decodeObjectForKey:kFMS_ProfileDetailPrimaryTrailerType];
    self.alternateTrailerType = [aDecoder decodeObjectForKey:kFMS_ProfileDetailAlternateTrailerType];
    self.pakingAddress = [aDecoder decodeObjectForKey:kFMS_ProfileDetailPakingAddress ];
    self.insurancePolicyName = [aDecoder decodeObjectForKey:kFMS_ProfileDetailInsurancePolicyName ];
    self.insurancePolicyNumber = [aDecoder decodeObjectForKey:kFMS_ProfileDetailInsurancePolicyNumber ];
    
    
  
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_internalBaseClassIdentifier forKey:kFMS_ProfileDetailId];
    [aCoder encodeObject:_name forKey:kFMS_ProfileDetailName];
    [aCoder encodeObject:_emailId forKey:kFMS_ProfileDetailEmailId];
    [aCoder encodeObject:_noOfDriver forKey:kFMS_ProfileDetailNoOfDriver];
    [aCoder encodeObject:_contractorName forKey:kFMS_ProfileDetailContractorName];
    [aCoder encodeObject:_avatar forKey:kFMS_ProfileDetailAvatar];
    [aCoder encodeObject:_address forKey:kFMS_ProfileDetailAddress];
    [aCoder encodeObject:_mobileNo forKey:kFMS_ProfileDetailMobileNo];
    [aCoder encodeObject:_dateOfBirth forKey:kFMS_ProfileDetailDateOfBirth];
    [aCoder encodeObject:_blurImg forKey:kFMS_ProfileDetailBlurImg];
    [aCoder encodeObject:_gender forKey:kFMS_ProfileDetailGender];
    [aCoder encodeObject:_emergencyContactNumber forKey:kFMS_ProfileDetailEmergencyContactNumber];

    
    [aCoder encodeObject:_businessName forKey:kFMS_ProfileDetailBusinessName];
    [aCoder encodeObject:_haulerID forKey:kFMS_ProfileDetailHaulerID];
    
    [aCoder encodeObject:_generalExpirationDate forKey:kFMS_ProfileDetailGeneralExpirationDate];
    [aCoder encodeObject:_autoLiabilityExDate forKey:kFMS_ProfileDetailAutoLiabilityExDate];
    [aCoder encodeObject:_cargoInsuranceExDate forKey:kFMS_ProfileDetailCargoInsuranceExDate];
    
    [aCoder encodeObject:_primaryPhoneNo forKey:kFMS_ProfileDetailPrimaryPhoneNo];
    [aCoder encodeObject:_alternatePhoneNo forKey:kFMS_ProfileDetailAlternatePhoneNo];
    [aCoder encodeObject:_primaryTrailerType forKey:kFMS_ProfileDetailPrimaryTrailerType];
    [aCoder encodeObject:_alternateTrailerType forKey:kFMS_ProfileDetailAlternateTrailerType];
    [aCoder encodeObject:_pakingAddress forKey:kFMS_ProfileDetailPakingAddress];
    
    [aCoder encodeObject:_insurancePolicyName forKey:kFMS_ProfileDetailInsurancePolicyName];
    [aCoder encodeObject:_insurancePolicyNumber forKey:kFMS_ProfileDetailInsurancePolicyNumber];
    

    
}

- (id)copyWithZone:(NSZone *)zone
{
    FMS_ProfileDetail *copy = [[FMS_ProfileDetail alloc] init];
    
    if (copy) {

        copy.internalBaseClassIdentifier = [self.internalBaseClassIdentifier copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
        copy.emailId = [self.emailId copyWithZone:zone];
        copy.noOfDriver = [self.noOfDriver copyWithZone:zone];
        copy.contractorName = [self.contractorName copyWithZone:zone];
        copy.avatar = [self.avatar copyWithZone:zone];
        copy.address = [self.address copyWithZone:zone];
        copy.mobileNo = [self.mobileNo copyWithZone:zone];
        copy.dateOfBirth = [self.dateOfBirth copyWithZone:zone];
        copy.blurImg = [self.blurImg copyWithZone:zone];
        copy.gender = [self.gender copyWithZone:zone];
        copy.emergencyContactNumber = [self.emergencyContactNumber copyWithZone:zone];

        copy.businessName = [self.businessName copyWithZone:zone];
        copy.haulerID = [self.haulerID copyWithZone:zone];
        
        copy.generalExpirationDate = [self.generalExpirationDate copyWithZone:zone];
        copy.cargoInsuranceExDate = [self.cargoInsuranceExDate copyWithZone:zone];
        copy.autoLiabilityExDate = [self.autoLiabilityExDate copyWithZone:zone];
        
        copy.primaryPhoneNo = [self.primaryPhoneNo copyWithZone:zone];
        copy.alternatePhoneNo = [self.alternatePhoneNo copyWithZone:zone];
        copy.primaryTrailerType = [self.primaryTrailerType copyWithZone:zone];
        copy.alternateTrailerType = [self.alternateTrailerType copyWithZone:zone];
        copy.pakingAddress = [self.pakingAddress copyWithZone:zone];
        copy.insurancePolicyName = [self.insurancePolicyName copyWithZone:zone];
        copy.insurancePolicyNumber = [self.insurancePolicyNumber copyWithZone:zone];

    }
    
    return copy;
}


@end
