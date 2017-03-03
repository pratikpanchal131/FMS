//
//  FMS_AvailableVC.h
//  FMS
//
//  Created by indianic on 06/08/15.
//  Copyright (c) 2015 indianic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FMS_AvailableVC : UIViewController
{
    NSString *strCurrentType;
    NSMutableArray *mutArrData;
    int intMaxPageNumber;
    int intPageNumber;

    int intSelectedIndex;
    
    __weak IBOutlet UILabel *lblNoData;
    __weak IBOutlet UITableView *tblVWLoads;
    
    NSMutableDictionary *mutDictFilter;
    
}
- (IBAction)btnFilterClick:(UIButton *)sender;
@end
