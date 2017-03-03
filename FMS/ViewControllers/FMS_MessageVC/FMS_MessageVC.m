//
//  FMS_MessageVC.m
//  FMS
//
//  Created by indianic on 06/08/15.
//  Copyright (c) 2015 indianic. All rights reserved.
//

#import "FMS_MessageVC.h"
#import "FMS_MessageCell.h"

@interface FMS_MessageVC ()

@end

@implementation FMS_MessageVC

#pragma mark View lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationBarWithTitle:@"Messsages" withBack:TRUE];
    mutArrData = [[NSMutableArray alloc] init];
    intPageNumber = 1;
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
    [WebserviceObj callWebserviceWithURL:[NSString stringWithFormat:@"%@/users/get_thread_list",FMS_WSURL] withSilentCall:FALSE  withParams:aDictObj forViewController:self withCompletionBlock:^(NSDictionary *responseData)
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
                 FMS_GetThreadList *aFMS_GetThreadListObj = [[FMS_GetThreadList alloc] initWithDictionary:aDictObj];
                 [mutArrData addObject:aFMS_GetThreadListObj];
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

#pragma mark - UITableview Delegates and Datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return mutArrData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"FMS_MessageListCell";
    FMS_MessageCell *aCell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    [aCell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    FMS_GetThreadList *aFMS_GetThreadListObj = mutArrData[indexPath.row];
    [aCell.lblName setText:aFMS_GetThreadListObj.employeeName];
    [aCell.lblMessage setText:aFMS_GetThreadListObj.message];
    [aCell.lblDate setText:aFMS_GetThreadListObj.date];

    if (aFMS_GetThreadListObj.fromMe == 0)
    {
        [aCell.btnReply setTitle:@"Reply" forState:UIControlStateNormal];
        [aCell.btnReply setTitleColor:FMS_GreenColor forState:UIControlStateNormal];
        [aCell.lblMessage setTextColor:FMS_GreenColor];
    }
    else
    {
        [aCell.btnReply setTitle:@"Replied" forState:UIControlStateNormal];
        [aCell.btnReply setTitleColor:[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.5] forState:UIControlStateNormal];
        [aCell.lblMessage setTextColor:[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.5]];
    }
    
    if([aFMS_GetThreadListObj.is_read boolValue])
    {
       aCell.backgroundColor = [UIColor clearColor];
    }
    else
    {
      // aCell.backgroundColor = [UIColor colorWithRed:74.0/255.0 green:73.0/255.0 blue:73.0/255.0 alpha:1.0];
        aCell.backgroundColor = [UIColor colorWithRed:23.0/255.0 green:25.0/255.0 blue:26.0/255.0 alpha:1.0];

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
    return 85;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    FMS_GetThreadList *aFMS_GetThreadListObj = mutArrData[indexPath.row];
    if(![aFMS_GetThreadListObj.is_read boolValue])
    {
      NSString  *strCount = [FMS_Utility sharedFMSUtility].strUnreadCount;
      [FMS_Utility sharedFMSUtility].strUnreadCount = [NSString stringWithFormat:@"%d",[strCount intValue]-1];
      [self refreshBadge];
    }
     [self performSegueWithIdentifier:@"pushMessageDetail" sender:indexPath];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"pushMessageDetail"])
    {
        NSIndexPath *index = (NSIndexPath*)sender;
        FMS_MessageDetailVC *objMessageDetail = segue.destinationViewController;
        objMessageDetail.fMS_GetThreadListObj = mutArrData[index.row];
    }
}

@end
