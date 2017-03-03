//
//  FMS_ReportCardVC.m
//  FMS
//
//  Created by indianic on 10/08/15.
//  Copyright (c) 2015 indianic. All rights reserved.
//

#import "FMS_ReportCardVC.h"

@interface FMS_ReportCardVC ()

@end

@implementation FMS_ReportCardVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    dictFilterData = [[NSMutableDictionary alloc]init];
    mutArrayReport = [[NSMutableArray alloc]init];
    
    if([FMS_Utility isLoginFromDriver])
     [self setNavigationBarWithTitle:@"My Report Card" withBack:FALSE];
    else
    [self setNavigationBarWithTitle:@"Driver's Report Card" withBack:true];

    [self callWSforReportCard];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
     [self.navigationController.navigationBar setTranslucent:YES];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self refreshBadge];
    [self.navigationController.navigationBar setTranslucent:NO];
    self.imgThumb.layer.cornerRadius = self.imgThumb.frame.size.width/2;
    self.imgThumb.layer.masksToBounds = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)btnFilterClick:(UIButton *)sender {
    
    FMS_Filter *fms_obj = [[FMS_Utility sharedFMSUtility] addViewControllerforFilter:self withStatus:10 withFilledDictionary:dictFilterData]; // For Month
    
    [fms_obj setDoneFilterBlock:^(NSMutableDictionary *response) {
        [dictFilterData removeAllObjects];
        [dictFilterData addEntriesFromDictionary:response];
        [self callWSforReportCard];
        NSLog(@"%@", response);
    }];
}

-(void)callWSforReportCard{

    NSMutableDictionary *aMutDictObj = [[NSMutableDictionary alloc] initWithObjectsAndKeys:[UserDefaults objectForKey:FMS_LoginUserType],@"role",[UserDefaults objectForKey:FMS_LoginUserToken],@"token", nil];
    if ([FMS_Utility isLoginFromDriver])
    {
        [aMutDictObj setObject:[UserDefaults objectForKey:FMS_LoginUserId] forKey:@"driver_id"];
    }
    else
    {
       [aMutDictObj setObject:self.strDriverId forKey:@"driver_id"];
    }
    if([dictFilterData allKeys].count > 0)
    {
       [aMutDictObj setObject:dictFilterData[@"MonthFrom"] forKey:@"month_year"];
    }

    Webservice *WebserviceObj = [[Webservice alloc] init];
    [WebserviceObj callWebserviceWithURL:[NSString stringWithFormat:@"%@/users/my_report_card",FMS_WSURL] withSilentCall:FALSE  withParams:aMutDictObj forViewController:self withCompletionBlock:^(NSDictionary *responseData)
     {
         if([responseData[@"status"] intValue]==1)
         {
             [mutArrayReport  removeAllObjects];
             if(!responseData[@"data"] || [responseData[@"data"] count]==0)
             {
                 lblNoData.hidden = FALSE;
                 viewRank.hidden = TRUE;
                 viewEarning.hidden = TRUE;
                 viewLoad.hidden = TRUE;
             }
             else
             {
                 lblNoData.hidden = TRUE;
                 viewRank.hidden = false;
                 viewEarning.hidden = false;
                 viewLoad.hidden = false;
             }
             for(NSDictionary *aDictObj in responseData[@"data"])
             {
                 FMS_MyReportCard *objFMS_MyReportCard = [[FMS_MyReportCard alloc] initWithDictionary:aDictObj];
                 [mutArrayReport addObject:objFMS_MyReportCard];
             }
             [self updateReport];
         }
         else
         {
             [FMS_Utility showAlert:responseData[@"message"]];
         }
     }withFailureBlock:^(NSError *error)
     {
         
     }];
    
}

-(void)updateReport
{
    if (mutArrayReport.count > 0)
    {
        FMS_MyReportCard *objFMS_MyReportCard = mutArrayReport[0];
        [self.imgProfile setImageWithURL:[NSURL URLWithString:objFMS_MyReportCard.blurImg]];
        [self.imgThumb setImageWithURL:[NSURL URLWithString:objFMS_MyReportCard.avatar] placeholderImage:[UIImage imageNamed:@"img_ProfileDefault"]];
        [lblName setText:objFMS_MyReportCard.name];
        [lblHauledRank setText:objFMS_MyReportCard.hauledRank];
        [lblDeliveryRank setText:objFMS_MyReportCard.deliveryRank];
        [lblMileRank setText:objFMS_MyReportCard.milesRank];
        [lblMolesClocked setText:objFMS_MyReportCard.milesClocked];
        [lblTotalEarning setText:objFMS_MyReportCard.totalEarning];
        [lblLoadCommited setText:objFMS_MyReportCard.loadCommited];
        [lblLoadDelivered setText:objFMS_MyReportCard.loadDelivered];
        self.progressBar.percent = [objFMS_MyReportCard.commitment  intValue];
    }
    else
    {
        [lblHauledRank setText:@""];
        [lblDeliveryRank setText:@""];
        [lblMileRank setText:@""];
        [lblMolesClocked setText:@""];
        [lblTotalEarning setText:@""];
        [lblLoadCommited setText:@""];
        [lblLoadDelivered setText:@""];
        self.progressBar.percent = 0;
    }
}

@end
