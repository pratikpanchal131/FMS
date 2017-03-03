//
//  FMS_MissedVC.h
//  FMS
//
//  Created by indianic on 06/08/15.
//  Copyright (c) 2015 indianic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FMS_MissedVC : UIViewController
{
    NSMutableDictionary *mutDictFilter;
    NSMutableArray *mutArrData;
    int intMaxPageNumber;
    int intPageNumber;
    __weak IBOutlet UILabel *lblNoData;
    __weak IBOutlet UITextField *txtFldDateFrom;
    __weak IBOutlet UITextField *txtFldDateTo;
}
@property (weak, nonatomic) IBOutlet UITableView *tblVWLoads;
- (IBAction)btnFilterClick:(UIButton *)sender;
@end
