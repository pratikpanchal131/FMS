//
//  FMS_MyDriversVC.m
//  FMS
//
//  Created by indianic on 10/08/15.
//  Copyright (c) 2015 indianic. All rights reserved.
//

#import "FMS_MyDriversVC.h"
#import  "FMS_MyDriversCell.h"
#import "FMS-Swift.h"

@interface FMS_MyDriversVC ()

@end

#pragma mark View lifecycle

@implementation FMS_MyDriversVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationBarWithTitle:@"My Drivers" withBack:FALSE];

    // Do any additional setup after loading the view.
    mutArrDrivers = [[NSMutableArray alloc] init];
    intPageNumber = 1;
  
    [[FMS_Utility sharedFMSUtility] addPullToRefreshOnTableView:self.tblMyDriver WithCompleton:^{
        
        intPageNumber=1;
        [self callWebservice];
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    intPageNumber=1;
    [self callWebservice];
    [self refreshBadge];
}
#pragma mark Events

- (IBAction)btnViewProfileClick:(UIButton *)sender
{
    UIStoryboard *aStoryBoardObj = [UIStoryboard storyboardWithName:FMS_StoryboardSecondary bundle:nil];
    FMS_ProfileVC *aFMS_ProfileVCObj =  [aStoryBoardObj instantiateViewControllerWithIdentifier:@"FMS_ProfileVC"];
    aFMS_ProfileVCObj.isViewDriverProfile = YES;
    aFMS_ProfileVCObj.strDriverId = [NSString stringWithFormat:@"%ld",(long)sender.tag];
    [self.navigationController pushViewController:aFMS_ProfileVCObj animated:YES];
}

- (IBAction)btnViewReportCardClick:(UIButton *)sender
{
    UIStoryboard *aStoryBoardObj = [UIStoryboard storyboardWithName:FMS_StoryboardThird bundle:nil];
    FMS_ReportCardVC *aFMS_ReportCardVCObj =  [aStoryBoardObj instantiateViewControllerWithIdentifier:@"FMS_ReportCardVC"];
    aFMS_ReportCardVCObj.strDriverId = [NSString stringWithFormat:@"%ld",(long)sender.tag];
    [self.navigationController pushViewController:aFMS_ReportCardVCObj animated:YES];
}

#pragma mark OtherMethods

-(void)callWebservice
{
    NSDictionary *aDictObj = [[NSDictionary alloc] initWithObjectsAndKeys:[UserDefaults objectForKey:FMS_LoginUserType],@"role",[UserDefaults objectForKey:FMS_LoginUserToken],@"token",[NSString stringWithFormat:@"%d",intPageNumber],@"page", nil];
    
    Webservice *WebserviceObj = [[Webservice alloc] init];
    [WebserviceObj callWebserviceWithURL:[NSString stringWithFormat:@"%@/contractors/get_driver",FMS_WSURL] withSilentCall:FALSE  withParams:aDictObj forViewController:self withCompletionBlock:^(NSDictionary *responseData)
     {
         if([responseData[@"status"] intValue]==1)
         {
             if(intPageNumber==1)
             {
                 [mutArrDrivers removeAllObjects];
                 
                 if(!responseData[@"data"] || [responseData[@"data"] count]==0)
                     lblNoData.hidden = FALSE;
                 else
                 {
                     lblNoData.hidden = TRUE;
                     
                   //  [[AppDelegate objSharedAppDel].filterBaseObj.data setDriver:responseData[@"data"]];
                                          
                 }
             }
             intMaxPageNumber = [responseData[@"total_page"] intValue];
             
             for(NSDictionary*aDictObj in responseData[@"data"])
             {
                 FMS_GetDrivers *aFMS_GetDriversObj = [[FMS_GetDrivers alloc] initWithDictionary:aDictObj];
                 [mutArrDrivers addObject:aFMS_GetDriversObj];
             }
             [self.tblMyDriver reloadData];
         }
         else
         {
             [FMS_Utility showAlert:responseData[@"message"]];
         }
     }
    withFailureBlock:^(NSError *error)
     {
         
     }];
}

#pragma mark -----------------------
#pragma mark TableVew Datasource Methods

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return mutArrDrivers.count;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIStoryboard *aStoryBoardObj = [UIStoryboard storyboardWithName:FMS_StoryboardSecondary bundle:nil];
    FMS_DriverProfileVC *FMS_DriverProfileVCObj = (FMS_DriverProfileVC*)[aStoryBoardObj instantiateViewControllerWithIdentifier:@"FMS_DriverProfileVC"];
    FMS_DriverProfileVCObj.intUsageType = 1;
    FMS_GetDrivers *aFMS_GetDriversObj = mutArrDrivers [indexPath.row];
    FMS_DriverProfileVCObj.strDriverID = aFMS_GetDriversObj.driverId;

    
    [self.navigationController pushViewController:FMS_DriverProfileVCObj animated:TRUE];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FMS_MyDriversCell *aCell = [tableView dequeueReusableCellWithIdentifier:@"FMS_MyDriverCell"];
    FMS_GetDrivers *aFMS_GetDriversObj = mutArrDrivers [indexPath.row];
    [aCell.imgViewProfilePic  setImageWithURL:[NSURL URLWithString:aFMS_GetDriversObj.driverImage] placeholderImage:[UIImage imageNamed:@"img_ProfileDefault"]];
    [aCell.lblUserName setText:aFMS_GetDriversObj.driverName];
    [aCell.lblUserRank setText:aFMS_GetDriversObj.rank];
    aCell.btnViewProfile.tag = [aFMS_GetDriversObj.driverId intValue];
    aCell.btnViewReportCard.tag = [aFMS_GetDriversObj.driverId intValue];
    
    if(intMaxPageNumber!=intPageNumber && indexPath.row==[mutArrDrivers count]-1)
    {
        intPageNumber++;
        [self callWebservice];
    }
    
    return aCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 82;
}


@end
