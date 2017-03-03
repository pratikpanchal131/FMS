//
//  FMS_Filter.h
//  FMS
//
//  Created by indianic on 11/08/15.
//  Copyright (c) 2015 indianic. All rights reserved.
//

#import <UIKit/UIKit.h>

/*
 ViewWhole = 1,
 ViewMonth = 2,
 ViewDate = 3,
 ViewCommodity = 4,
 ViewDriver = 5,
 Date_Loc_Comm = 9,
 Month_Location_Comm_Dri = 13,
 Month_Driver = 6
 Loc_Date = 7,
 Date_Driver = 8
 Single_Month = 10

 */
typedef enum {
    ViewWhole = 1,
    ViewMonth = 2,
    ViewDate = 3,
    ViewCommodity = 4,
    ViewDriver = 5,
    Date_Loc_Comm = 9,
    Month_Location_Comm_Dri = 13,
    Month_Driver = 6,
    Loc_Date = 7,
    Date_Driver = 8,
    Single_Month = 10
}ViewStatus;

@interface FMS_Filter : UIViewController
{
    IBOutlet UILabel *lblTitle;
    
    IBOutlet UIView *viewAll;
    IBOutlet UIView *viewDriver;
    IBOutlet UIView *viewDate;
    IBOutlet UIView *viewCommodity;
    IBOutlet UIView *viewLocation;
    
    IBOutlet UIView *viewBlank;
    IBOutlet UITextField *txtLocationFrom;
    IBOutlet UITextField *txtLocationTO;
    
    IBOutlet UITextField *txtDateFrom;
    IBOutlet UITextField *txtDateTO;
    
    IBOutlet UITextField *txtCommodity;
    
    IBOutlet UITextField *txtDriver;
    
    IBOutlet UIButton *btnSeperator;
    
    IBOutlet UILabel *lblDateMonthText;
    
    
}
@property (nonatomic, assign) ViewStatus viewObj;
@property (nonatomic, strong) NSMutableDictionary *dictTextFieldData;

@property(nonatomic, copy) void (^doneFilterBlock)(NSMutableDictionary *);

- (IBAction)tapGestureClick:(UITapGestureRecognizer *)sender;
- (IBAction)btnDoneClick:(UIButton *)sender;
- (IBAction)btnLocationFromTOClick:(UIButton *)sender;
- (IBAction)btnFromTODateClick:(UIButton *)sender;
- (IBAction)btnCommodityClick:(UIButton *)sender;
- (IBAction)btnDriversClick:(UIButton *)sender;
-(void)compareLocationwithBlock:(void(^)(void))block;
@end
