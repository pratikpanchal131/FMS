//
//  FMS_MyDriversVC.h
//  FMS
//
//  Created by indianic on 10/08/15.
//  Copyright (c) 2015 indianic. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FMS_GetDrivers.h"

@interface FMS_MyDriversVC : UIViewController
{
    NSMutableArray *mutArrDrivers;
    int intMaxPageNumber;
    int intPageNumber;
    __weak IBOutlet UILabel *lblNoData;
}

@property (strong, nonatomic) IBOutlet UITableView *tblMyDriver;
@end
