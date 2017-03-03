//
//  FMS_AlertsVC.m
//  FMS
//
//  Created by indianic on 11/08/15.
//  Copyright (c) 2015 indianic. All rights reserved.
//

#import "FMS_AlertsVC.h"
#import "FMS_GetAlerts.h"
#import "FMS_AlertsCell.h"

@interface FMS_AlertsVC ()

@end

@implementation FMS_AlertsVC

#pragma mark View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setNavigationBarWithTitle:@"Alerts" withBack:false];
    
    mutArrData = [[NSMutableArray alloc] init];
    intPageNumber=1;
    [[FMS_Utility sharedFMSUtility] addPullToRefreshOnTableView:tblViewAlerts WithCompleton:^{
        
        intPageNumber=1;
        [self callWebservice];
        
    }];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self refreshBadge];
    [self callWebservice];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark Events

#pragma mark OtherMethods

-(void)callWebservice
{
    NSDictionary *aDictObj = [[NSDictionary alloc] initWithObjectsAndKeys:[UserDefaults objectForKey:FMS_LoginUserType],@"role",[UserDefaults objectForKey:FMS_LoginUserToken],@"token",[NSString stringWithFormat:@"%d",intPageNumber],@"page", nil];
    
    Webservice *WebserviceObj = [[Webservice alloc] init];
    [WebserviceObj callWebserviceWithURL:[NSString stringWithFormat:@"%@/users/get_alerts",FMS_WSURL] withSilentCall:FALSE  withParams:aDictObj forViewController:self withCompletionBlock:^(NSDictionary *responseData)
     {
         if([responseData[@"status"] intValue]==1)
         {
             if(intPageNumber==1)
             {
                 [mutArrData removeAllObjects];
                 
                 if(!responseData[@"data"] || [responseData[@"data"] count]==0)
                     lblNoData.hidden = FALSE;
                 else
                     lblNoData.hidden = TRUE;
             }
             intMaxPageNumber = [responseData[@"total_page"] intValue];
             
             for(NSDictionary*aDictObj in responseData[@"data"])
             {
                 FMS_GetAlerts *aFMS_GetAlertsOb = [[FMS_GetAlerts alloc] initWithDictionary:aDictObj];
                 [mutArrData addObject:aFMS_GetAlertsOb];
             }
             [tblViewAlerts reloadData];
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

-(void)activateAlertWithId:(NSString*)strAlertId activate:(NSString*)aStrVal
{
    NSDictionary *aDictObj = [[NSDictionary alloc] initWithObjectsAndKeys:[UserDefaults objectForKey:FMS_LoginUserType],@"role",[UserDefaults objectForKey:FMS_LoginUserToken],@"token",strAlertId,@"alert_id",aStrVal,@"activate", nil];
    
    Webservice *WebserviceObj = [[Webservice alloc] init];
    [WebserviceObj callWebserviceWithURL:[NSString stringWithFormat:@"%@/users/activate_alert",FMS_WSURL] withSilentCall:FALSE  withParams:aDictObj forViewController:self withCompletionBlock:^(NSDictionary *responseData)
     {
         if([responseData[@"status"] intValue]==1)
         {
             intPageNumber = 1;
             [self callWebservice];
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


#pragma mark - UITableview Delegates and Datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return mutArrData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"FMS_AlertsCell";
    FMS_AlertsCell *aCell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    [aCell setSelectionStyle:UITableViewCellSelectionStyleNone];
     FMS_GetAlerts *aFMS_GetAlertsOb = mutArrData[indexPath.row];
    aCell.lblDistance.text = aFMS_GetAlertsOb.miles;
    aCell.lblLocation.text = aFMS_GetAlertsOb.location;
    aCell.lblActive.hidden = YES;

    if ([aFMS_GetAlertsOb.isActive boolValue])
    {
        aCell.lblActive.hidden = NO;
    }
    else
    {
        aCell.lblActive.hidden = YES;
    }
    
    if(intMaxPageNumber!=intPageNumber && indexPath.row==[mutArrData count]-1)
    {
        intPageNumber++;
        [self callWebservice];
    }
    return aCell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 76;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    FMS_GetAlerts *aFMS_GetAlertsOb = mutArrData[indexPath.row];

    if([aFMS_GetAlertsOb.isActive boolValue])
    {
        [[FMS_Utility sharedFMSUtility]showAlertWithTarget:self WithMessage:@"Do you want to deactive this Alert?" withCancelButton:@"Cancel" WithCompletionBlock:^(int index) {
            
            if (index == 1)
            {
                [self activateAlertWithId:aFMS_GetAlertsOb.alertId activate:@"0"];
            }
        } withOtherButtons:@[@"Ok"]];
    }
    else
    {
        [[FMS_Utility sharedFMSUtility]showAlertWithTarget:self WithMessage:@"Do you want to active this Alert?" withCancelButton:@"Cancel" WithCompletionBlock:^(int index) {
            
            if (index == 1)
            {
                [self activateAlertWithId:aFMS_GetAlertsOb.alertId activate:@"1"];
            }
        } withOtherButtons:@[@"Ok"]];
    }
    
    
}

@end
