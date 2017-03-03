//
//  FMS_LoginlessVC.h
//  FMS
//
//  Created by indianic on 07/08/15.
//  Copyright (c) 2015 indianic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FMS_LoginlessVC : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    NSString *strCurrentType;
    NSMutableArray *mutArrData;
    int intMaxPageNumber;
    int intPageNumber;
    
    int intSelectedIndex;
    
    IBOutlet UIView *vwAlert;
    __weak IBOutlet UILabel *lblNoData;
    __weak IBOutlet UITextView *txtVWAlert;
    __weak IBOutlet UITableView *tblVWLoads;
}
- (IBAction)btnOkClicked:(UIButton *)sender;

@end
