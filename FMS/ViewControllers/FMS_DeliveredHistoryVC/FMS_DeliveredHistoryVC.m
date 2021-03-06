//
//  FMS_DeliveredVC.m
//  FMS
//
//  Created by indianic on 06/08/15.
//  Copyright (c) 2015 indianic. All rights reserved.
//

#import "FMS_DeliveredHistoryVC.h"

#import "FMS_DeliveredHistoryCell.h"
#import "FMS_PaymentReject.h"
@interface FMS_DeliveredHistoryVC ()

@end

@implementation FMS_DeliveredHistoryVC
{
    
}

#pragma mark View lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    [self setNavigationBarWithTitle:@"Delivered Order History" withBack:TRUE];
    
    mutArrData = [[NSMutableArray alloc] init];
    
    
    // Do any additional setup after loading the view.
}

-(void)viewWillDisappear:(BOOL)animated
{
    if (self.navigationController==[AppDelegate objSharedAppDel].navCntrl)
    {
        [[AppDelegate objSharedAppDel].navCntrl setNavigationBarHidden:YES];
        
    }
    [super viewWillDisappear:animated];
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self refreshBadge];
    
    [self callWebservice];

    
    if (self.navigationController==[AppDelegate objSharedAppDel].navCntrl)
    {
        [[AppDelegate objSharedAppDel].navCntrl setNavigationBarHidden:NO];
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark Orientation
#pragma mark Events
#pragma mark ViewTouch
#pragma mark OtherMethods

-(void)callWebservice
{
    
    
    NSDictionary *aDictObj = [[NSDictionary alloc] initWithObjectsAndKeys:[UserDefaults objectForKey:FMS_LoginUserToken],@"token",[UserDefaults objectForKey:FMS_LoginUserType],@"role",self.strOrderID, @"order_id", nil];
    
    
    Webservice *WebserviceObj = [[Webservice alloc] init];
    [WebserviceObj callWebserviceWithURL:[NSString stringWithFormat:@"%@/loads/delivered_order_history",FMS_WSURL] withSilentCall:FALSE  withParams:aDictObj forViewController:self withCompletionBlock:^(NSDictionary *responseData)
     {
         
         
         if([responseData[@"status"] intValue]==1)
         {
             dictDeliveredHistory = [[NSMutableDictionary alloc] init];
           
             dictDeliveredHistory = responseData.mutableCopy;
             
             [mutArrData removeAllObjects];
             
             
             if(!responseData[@"data"] || [responseData[@"data"] count]==0)
             {
                 lblNoData.hidden = FALSE;
             }
             else
             {
                 lblNoData.hidden = TRUE;
                 [mutArrData addObjectsFromArray:responseData[@"data"]];
                 
                 if([[FMS_Utility sharedFMSUtility] checkForViewRatePermission])
                 {
                     if([responseData[@"waiting_charges"] intValue]>0)
                     {
                         [mutArrData addObject:@{@"custom_status":@"Waiting Charges",@"custom_status_val":responseData[@"waiting_charges"]}];
                     }
                     
                     if([responseData[@"freight"] intValue]>0)
                     {
                         [mutArrData addObject:@{@"custom_status":@"Freight",@"custom_status_val":responseData[@"freight"]}];
                         
                     }
                     
                     if([responseData[@"earning"] intValue]>0)
                     {
                         [mutArrData addObject:@{@"custom_status":@"Earnings",@"custom_status_val":responseData[@"earning"]}];
                         
                     }

                 }
                 
             }
             
             
             
             
             
             [tblVWLoads reloadData];
             
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
    return [mutArrData count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"FMS_DeliveredHistoryCell";
    FMS_DeliveredHistoryCell *aCell = (FMS_DeliveredHistoryCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    NSDictionary *aDictData = mutArrData[indexPath.row];
    
    if(aDictData[@"status"])
    {
        aCell.imgVWDollar.hidden = TRUE;
        aCell.imgVWTimeIndicator.hidden = FALSE;
        aCell.lblStatus.text = aDictData[@"status"];
        aCell.lblDate.text = aDictData[@"status_date_time"];
    }
    else
    {
        aCell.lblStatus.text = aDictData[@"custom_status"];
        aCell.lblDate.text = aDictData[@"custom_status_val"];
        aCell.imgVWDollar.hidden = FALSE;
        aCell.imgVWTimeIndicator.hidden = TRUE;
    }
    
    
    
    
    [aCell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return aCell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

- (IBAction)btnPaymentReject:(id)sender {
    
    UIStoryboard *aStoryBoardObj = [UIStoryboard storyboardWithName:FMS_StoryboardMain bundle:nil];
    
    FMS_PaymentReject *objPaymentReject= [aStoryBoardObj instantiateViewControllerWithIdentifier:@"FMS_PaymentReject"];
    objPaymentReject.dictData = dictDeliveredHistory;
    [self.navigationController pushViewController:objPaymentReject animated:false];
    
}
@end
