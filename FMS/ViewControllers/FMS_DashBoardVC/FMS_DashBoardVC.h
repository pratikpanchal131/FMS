//
//  FMS_DashBoardVC.h
//  FMS
//
//  Created by indianic on 06/08/15.
//  Copyright (c) 2015 indianic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FMS_DashBoardVC : UIViewController
{

    BOOL boolLoadedOnce;
    int intCurrentIndex;
    NSString *strCurrentType;
    NSMutableArray *mutArrData;
    int intMaxPageNumber;
    int intPageNumber;
    
    __weak IBOutlet UIView *vwAcceptLoadFalse;
    __weak IBOutlet UIView *vwAcceptLoadTrue;
    __weak IBOutlet UILabel *lblNoData;
        __weak IBOutlet UILabel *lblTotalEarning;
    UIButton *btnPrevSelected;
    __weak IBOutlet UIView *vwSelectedOption;
    __weak IBOutlet UIView *vwSelectionDisplay;
}
@property (weak, nonatomic) IBOutlet UITableView *tblVWLoads;
- (IBAction)btnOptionsSelected:(UIButton *)sender;

@end
