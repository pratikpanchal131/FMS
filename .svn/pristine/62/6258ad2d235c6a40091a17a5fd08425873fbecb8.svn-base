//
//  FMS_AssignedVC.h
//  FMS
//
//  Created by indianic on 06/08/15.
//  Copyright (c) 2015 indianic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FMS_AssignedVC : UIViewController
{
    NSMutableDictionary *mutDictFilter;
    NSString *strCurrentType;
    NSMutableArray *mutArrData;
    int intMaxPageNumber;
    int intPageNumber;
    int intSelectedIndex;
    
    __weak IBOutlet UILabel *lblNoData;
    __weak IBOutlet UITextField *txtFldDateFrom;
    __weak IBOutlet UITextField *txtFldDateTo;
}
@property (weak, nonatomic) IBOutlet UITableView *tblVWLoads;
- (IBAction)btnFilterClick:(UIButton *)sender;
@end
