//
//  FMS_Utility.h
//  FMS
//
//  Created by indianic on 06/08/15.
//  Copyright (c) 2015 indianic. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "FMS_Filter.h"
#import "MonthPicker.h"
#import <MessageUI/MFMailComposeViewController.h>

@interface FMS_Utility : NSObject<UIPickerViewDelegate,UIPickerViewDataSource,UIAlertViewDelegate,UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,MFMailComposeViewControllerDelegate, MonthPickerDelegate>
{
    
    
    UITableView *tblVWReferenceObj;
    
    UIDatePicker *datePicker;
    UIPickerView *simplePicker;
    MonthPicker *monthYearPicker;
    
    NSArray *firstComponentArray;
    NSArray *secondComponentArray;
    
    int pickerFirstSelectedIndex;
    int pickerSecondSelectedIndex;
    NSString *pickerType;
    int pickerComponentCount;
    
    BOOL isCropImage;
    UIViewController *viewController;
    
    NSString *strKey, *strSelectedValue;
    
    
  
}
@property (nonatomic,strong) NSDictionary * dictPermissions;
@property (nonatomic,strong) NSString * strUnreadCount;
@property (nonatomic,strong) NSDictionary *dictNotification;
@property (nonatomic,readwrite) BOOL isFromNotification;

@property (nonatomic,readwrite) BOOL boolTokenUpdated;
@property(nonatomic,strong) NSDateFormatter* dateFormatterObj;
@property (nonatomic, strong) FMS_Filter *fms_FilterObj;

+(FMS_Utility*)sharedFMSUtility;
+ (BOOL)validateEmail:(NSString *) emailString;
+(BOOL)isEmptyText:(NSString *)aStrText;
+(BOOL)validatePassword:(NSString *)strPassword;
+ (BOOL)validateMobileNumber:(NSString*)number;

+(void) showAlert:(NSString *)msg;
-(void)updateUserPermission:(NSDictionary*)aDictRef;
+(BOOL)isLoginFromDriver;
-(void)showAlertWithTarget:(id)aTarget WithMessage:(NSString *)aStrMessage withCancelButton:(NSString *)aCancelBtn WithCompletionBlock:(void(^)(int index))completionBlock withOtherButtons:(NSArray *)aArray;
-(void)addPicker:(UIViewController*)controller onTextField:(UITextField*)txtField pickerType:(NSString*)type withKey:(NSString *)key withCompletionBlock:(void(^)(id picker ,int buttonIndex,int firstindex,int secondindex))completionBlock withPickerArray:(NSArray *)aArray withPickerSecondArray:(NSArray *)aArraySecond count:(int)componentCount withTitle:(NSString*)strTitle;
-(BOOL)checkForViewRatePermission;
-(BOOL)checkForAcceptLoadPermission;

-(void)setDrawerToUse;
-(void)setDrawerToUseProfile;

-(void)openCamera:(UIViewController*)controller isRoundCrop:(BOOL)isCrop withCompletionBlock:(void(^)(UIImage *img))completionBlock;
-(BOOL)checkNetworkStatus;
-(FMS_Filter *)addViewControllerforFilter:(UIViewController *)viewCntrl withStatus:(int)intStatus withFilledDictionary:(NSMutableDictionary *)dictMutFromCurrCntrl;

-(void)MailWithtext:(NSString*)strBody subject:(NSString*)strSubject recipientsTo:(NSMutableArray*)arrayTo recipientsCC:(NSMutableArray*)arrayCC targetFrom:(id)target WithCompletionBlock:(void(^)(MFMailComposeResult result))completionBlock;
-(void)CompletionMail:(MFMailComposeResult)result target:(id)target;
-(void)addPullToRefreshOnTableView:(UITableView*)aTblVWObj WithCompleton:(void (^)(void))completionBlock;
+(NSString*)formatDateSendTOServer:(NSDate *)date;
+(NSString*)formatMonth:(NSDate *)date;
+(NSString *)formatDateComingFromServer:(NSDate*)date;
+(void)loads_filtersData:(UIViewController *)viewCntrl withCompletionBlock:(void(^)(NSDictionary * responseData))completionBlock withFailureBlock:(void(^)(NSError * error))failureBlock;
+(NSString *)formatStringTODateTOString:(NSString*) strDate;
+(BOOL)checkIfIncomplete:(NSString *)aStrvalue;
+(BOOL)checkIfIncomplete:(NSString *)aStrvalue withMessage:(NSString *)message;
-(void)logOutForNavigationControl;

+(NSMutableAttributedString*)appednDollarToText:(NSString*)strToAppend;
-(void)clearBadge;

+(NSString *)formatStringTODateTOString2:(NSString*) strDate;

@end
