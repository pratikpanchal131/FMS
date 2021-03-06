//
//  FMS_DeliveredHistoryVC.h
//  FMS
//
//  Created by indianic on 09/09/15.
//  Copyright (c) 2015 indianic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FMS_DeliveredHistoryVC : UIViewController
{
    NSMutableArray *mutArrData;
    __weak IBOutlet UILabel *lblNoData;
    __weak IBOutlet UITableView *tblVWLoads;
    
    __weak IBOutlet UIView *viewPaymentReject;
    NSMutableDictionary *dictDeliveredHistory;
    
}


@property (nonatomic,strong) NSString *strOrderID;
@property(nonatomic,readwrite)BOOL showRightButtons;
- (IBAction)btnPaymentReject:(id)sender;

@end
