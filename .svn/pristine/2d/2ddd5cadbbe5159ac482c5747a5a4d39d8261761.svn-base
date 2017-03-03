//
//  FMS_LoadDetailVC.h
//  FMS
//
//  Created by indianic on 06/08/15.
//  Copyright (c) 2015 indianic. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomView.h"
@interface FMS_LoadDetailVC : UIViewController
{
    
    FMS_LoadDetail *FMS_LoadDetailObj;

    NSString *strSelectedStatus;
    NSString *strSelectedReason;
    NSString *strSelectedReasonID;
    NSString *strDriverID;
    NSArray *arrDriver;
    
    
    __weak IBOutlet UILabel *lblLoadsTitle;
    __weak IBOutlet UITextField *txtFldStatus;
    __weak IBOutlet UILabel *lblRate;
    __weak IBOutlet UILabel *lblTimeWindow;
    __weak IBOutlet UILabel *lblUnits;
    __weak IBOutlet UILabel *lblPostedTime;
    __weak IBOutlet UILabel *lblPickupDate;
    __weak IBOutlet UILabel *lblOLNum;
    __weak IBOutlet UILabel *lblLoads;
    __weak IBOutlet UILabel *lblMiles;
    __weak IBOutlet UILabel *lblCommodity;
    __weak IBOutlet UIView *vwAllInfo;
    __weak IBOutlet UIView *vwOLNumber;
    __weak IBOutlet UITextField *txtFldReason;
    __weak IBOutlet TPKeyboardAvoidingScrollView *scrVWContent;
    __weak IBOutlet UIView *vwSelectReason;
    __weak IBOutlet UIView *vwOrderStatus;
    __weak IBOutlet UIButton *btnAccept;
    __weak IBOutlet UITextField *txtFldQuantity;
    __weak IBOutlet UIView *vwContainer;
    __weak IBOutlet UIView *vwLocation;
    __weak IBOutlet CustomView *vwSelectDriver;
    __weak IBOutlet UILabel *lblFromCity;
    __weak IBOutlet UILabel *lblToCity;
    __weak IBOutlet UILabel *lblFromAddress;
    __weak IBOutlet UILabel *lblToAddress;
    __weak IBOutlet UIImageView *imgVWArrow;
    __weak IBOutlet CustomTextField *txtFldReasonSelected;
    
    __weak IBOutlet CustomTextField *txtfld_DriverName;
    
}
- (IBAction)btnSelectDriverClicked:(UIButton *)sender;
- (IBAction)btnSelectReasonClicked:(UIButton *)sender;

- (IBAction)btnSelectStatusClicked:(UIButton *)sender;
//isLoadDetail = true when navigation is done from available load.
@property(nonatomic,readwrite)BOOL showRightButtons;
@property(nonatomic,readwrite)BOOL isLoadDetail;
@property(nonatomic,retain) NSString *strLoadId;
- (IBAction)btnAcceptClicked:(UIButton *)sender;

@end
