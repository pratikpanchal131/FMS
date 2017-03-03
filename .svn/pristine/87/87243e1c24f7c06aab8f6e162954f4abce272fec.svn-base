//
//  FMS_RegisterVC.h
//  FMS
//
//  Created by indianic on 12/01/16.
//  Copyright © 2016 indianic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FMS_RegisterVC : UIViewController<UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{
    __weak IBOutlet UIImageView *imgViewCover;
    __weak IBOutlet CustomImageView *imgViewProfile;
    __weak IBOutlet UIScrollView *objScrollview;
    __weak IBOutlet UIButton *btnRegister;
    __weak IBOutlet UIButton *btnEditProfileImage;
    
    __weak IBOutlet UIButton *btnAlternateTrailerType;
    
    __weak IBOutlet UIButton *btnPrimaryTrailerType;
    
    
    __weak IBOutlet UITextField *txtFName;
    __weak IBOutlet UITextField *txtFEmailId;
    __weak IBOutlet UITextField *txtFMobileNo;
    __weak IBOutlet UITextField *txtFInsurancePolicyName;
    __weak IBOutlet UITextField *txtFInsurancePolicyNo;
    __weak IBOutlet CustomTextField *txtFInsurancePolicyExpDate;
    
    //New Outlet
    __weak IBOutlet UIButton *btnNotifyText;
    __weak IBOutlet UIButton *btnNotifyEmail;
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
    //---------------------------------------
    
    __weak IBOutlet UIView *viewName;
    __weak IBOutlet UIView *viewEmailId;
    __weak IBOutlet UIView *viewMobileNo;
    __weak IBOutlet UIView *viewInsurancePolicyName;
    __weak IBOutlet UIView *viewInsurancePolicyNo;
    __weak IBOutlet UIView *viewInsurancePolicyExpDate;
    
    
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
    
    BOOL isProfilePicChange;
    BOOL isEmailNotification,isTextNotification;
    
    FMS_ProfileDetail *objFFMS_ProfileDetail;
}
@property(nonatomic,assign)BOOL isRegisterDriver;

- (IBAction)btnEditProfileImage:(UIButton *)sender;
- (IBAction)btnRegister:(UIButton *)sender;




@end
