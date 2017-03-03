//
//  FMS_ReportCardVC.h
//  FMS
//
//  Created by indianic on 10/08/15.
//  Copyright (c) 2015 indianic. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBCircularProgressBarView.h"
#import "FMS_MyReportCard.h"

@interface FMS_ReportCardVC : UIViewController
{
    __weak IBOutlet UIView *viewRank;
    __weak IBOutlet UIView *viewEarning;
    __weak IBOutlet UIView *viewLoad;
    __weak IBOutlet UILabel *lblNoData;
    
    NSMutableDictionary *dictFilterData;
    NSMutableArray *mutArrayReport;
    __weak IBOutlet UILabel *lblHauledRank;
    __weak IBOutlet UILabel *lblDeliveryRank;
    __weak IBOutlet UILabel *lblMileRank;
    __weak IBOutlet UILabel *lblMolesClocked;
    __weak IBOutlet UILabel *lblTotalEarning;
    __weak IBOutlet UILabel *lblLoadCommited;
    __weak IBOutlet UILabel *lblLoadDelivered;
    __weak IBOutlet UILabel *lblName;
}
@property(strong,nonatomic)NSString *strDriverId;
@property (strong, nonatomic) IBOutlet MBCircularProgressBarView *progressBar;
@property (strong, nonatomic) IBOutlet UIImageView *imgProfile;
@property (strong, nonatomic) IBOutlet UIView *viewProfile;
@property (strong, nonatomic) IBOutlet UIImageView *imgThumb;

- (IBAction)btnFilterClick:(UIButton *)sender;
@end
