//
//  FMS_DriversLoadVC.h
//  FMS
//
//  Created by indianic on 10/08/15.
//  Copyright (c) 2015 indianic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FMS_DriversLoadVC : UIViewController
{
    NSMutableDictionary *dictFilterData;
    NSMutableArray *mutArrData;
    
    int  intPageNumber;
    int intMaxPageNumber;
    
    __weak IBOutlet UILabel *lblNoData;
}
@property (strong, nonatomic) IBOutlet UITableView *tblDriverLoad;

- (IBAction)btnFilterClick:(UIButton *)sender;
@end
