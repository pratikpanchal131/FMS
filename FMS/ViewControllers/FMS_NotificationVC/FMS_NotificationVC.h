//
//  FMS_NotificationVC.h
//  FMS
//
//  Created by indianic on 06/08/15.
//  Copyright (c) 2015 indianic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FMS_NotificationVC : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *mutArrNotification;
    int intMaxPageNumber;
    int intPageNumber;
    __weak IBOutlet UILabel *lblNoData;
    __weak IBOutlet UITableView *tblViewNotification;
     NSMutableDictionary *dictMutFillData;
}



- (IBAction)btnSelecPastNotification:(UIButton *)sender;
@end
