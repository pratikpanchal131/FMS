//
//  FMS_DeliveredLoadsVC.h
//  FMS
//
//  Created by indianic on 10/08/15.
//  Copyright (c) 2015 indianic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FMS_DeliveredLoadsVC : UIViewController<UITextFieldDelegate>
{
    __weak IBOutlet UITextField *txtFTicketNo;
    __weak IBOutlet CustomTextField *txtFDeliveredQty;
    __weak IBOutlet UIImageView *imgViewTicketNo1;
    __weak IBOutlet UIImageView *imgViewTicketNo2;
    
    __weak IBOutlet UIView *viewTicketImage;
    __weak IBOutlet UIView *viewPickUpImage;
    
    __weak IBOutlet UIView *viewTicketNum;
    __weak IBOutlet UIView *viewDeliverQty;
    __weak IBOutlet UILabel *lblDeliveredQty;
}
@property(nonatomic,readwrite)BOOL isForPickup;
@property(nonatomic,readwrite)BOOL showRightButtons;
@property(nonatomic,strong)NSString * strOrderID;
@property(nonatomic,strong)FMS_LoadDetail * FMS_LoadDetailObj;
- (IBAction)btnSaveClick:(UIButton *)sender;
- (IBAction)btnTakeTicketImage1:(UIButton *)sender;
- (IBAction)btnTakeTicketImage2:(UIButton *)sender;

@end
