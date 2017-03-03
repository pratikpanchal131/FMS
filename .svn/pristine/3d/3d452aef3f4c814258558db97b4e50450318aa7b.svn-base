//
//  FMS_ProfileVC.h
//  FMS
//
//  Created by indianic on 07/08/15.
//  Copyright (c) 2015 indianic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FMS_ProfileVC : UIViewController<UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UITextFieldDelegate>
{
    __weak IBOutlet UIImageView *imgViewCover;
    __weak IBOutlet CustomImageView *imgViewProfile;
    __weak IBOutlet UIScrollView *objScrollview;
    __weak IBOutlet UIButton *btnUpdateProfile;
    __weak IBOutlet UIButton *btnEditProfileImage;
    
    __weak IBOutlet UITextField *txtFDrivers;
    __weak IBOutlet UITextField *txtFName;
    __weak IBOutlet UITextField *txtFContractorName;
    __weak IBOutlet UITextField *txtFEmailId;
    __weak IBOutlet UITextField *txtFMobileNo;
    __weak IBOutlet UITextField *txtFEmergencyNo;
    __weak IBOutlet UITextField *txtFBirthDate;
    __weak IBOutlet UITextField *txtFAddress;
    __weak IBOutlet DLRadioButton *btnMale;
    __weak IBOutlet DLRadioButton *btnFemale;
    
    __weak IBOutlet UIView *viewName;
    __weak IBOutlet UIView *viewContractorName;
    __weak IBOutlet UIView *viewEmailId;
    __weak IBOutlet UIView *viewMobileNo;
    __weak IBOutlet UIView *viewEmergencyNo;
    __weak IBOutlet UIView *viewDrivers;
    __weak IBOutlet UIView *viewBirthDate;
    __weak IBOutlet UIView *viewGender;
    __weak IBOutlet UIView *viewAddress;
    
    
    
    //New Outlet
    __weak IBOutlet UIButton *btnAlternateTrailerType;
    
    __weak IBOutlet UIButton *btnPrimaryTrailerType;
    //---------------------------------------
    
    //New Outlet
    __weak IBOutlet UITextField *txtBusinessName;
    __weak IBOutlet UITextField *txtHaulerID;
    __weak IBOutlet UITextField *txtGeneralExpirationDate;
    __weak IBOutlet UITextField *txtAutoLiabilityExDate;
    __weak IBOutlet UITextField *txtCargoInsuranceExDate;
    __weak IBOutlet UITextField *txtPrimaryPhoneNo;
    __weak IBOutlet UITextField *txtAlternatePhoneNo;
    
    __weak IBOutlet UITextField *txtPrimaryTrailerType;
    __weak IBOutlet UITextField *txtAlternateTrailerType;
    
    __weak IBOutlet UITextField *txtPakingAddress;
    
    __weak IBOutlet UITextField *txtFInsurancePolicyName;
    __weak IBOutlet UITextField *txtFInsurancePolicyNo;
    __weak IBOutlet UITextField *txtFInsurancePolicyExpDate;
    //---------------------------------------
    
    // New Changes
    
    __weak IBOutlet UIView *viewBusinessName;
    __weak IBOutlet UIView *ViewHaulerID;
    __weak IBOutlet UIView *viewGeneralExpirationDate;
    __weak IBOutlet UIView *viewAutoLiabilityExDate;
    __weak IBOutlet UIView *viewCargoInsuranceExDate;
    __weak IBOutlet UIView *viewPrimaryPhoneNo;
    __weak IBOutlet UIView *viewAlternatePhoneNo;
    __weak IBOutlet UIView *viewSelectPrimaryTrailerType;
    __weak IBOutlet UIView *viewAlternateTrailerType;
    __weak IBOutlet UIView *viewPakingAddress;
    __weak IBOutlet UIView *viewNotification;
    //---------------------------------------
    
    
    
    BOOL isProfilePicChange,isUpdateProfile;
    FMS_ProfileDetail *objFFMS_ProfileDetail;
}
@property(nonatomic,assign)BOOL isViewDriverProfile;
@property(strong,nonatomic)NSString *strDriverId;

- (IBAction)btnEditProfileImage:(UIButton *)sender;
- (IBAction)btnUpdateProfile:(UIButton *)sender;
- (IBAction)btnSelectGender:(DLRadioButton *)sender;

@end
