//
//  FMS_MissedVC.m
//  FMS
//
//  Created by indianic on 06/08/15.
//  Copyright (c) 2015 indianic. All rights reserved.
//

#import "FMS_MissedVC.h"
#import "FMS_MissedCell.h"
@interface FMS_MissedVC ()

@end

@implementation FMS_MissedVC

#pragma mark View lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationBarWithTitle:@"Missed Loads" withBack:FALSE];
    
    mutDictFilter = [[NSMutableDictionary alloc] init];
    mutArrData = [[NSMutableArray alloc] init];
    
    [[FMS_Utility sharedFMSUtility] addPullToRefreshOnTableView:self.tblVWLoads WithCompleton:^{
        
        intPageNumber=1;
        [self callWebservice];
        
    }];
    

    
    
    //FMS_MissedCell
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self refreshBadge];
    
    
    [self.tblVWLoads setContentOffset:CGPointZero animated:YES];
    intPageNumber=1;
    [self callWebservice];
}
#pragma mark Orientation
#pragma mark Events
#pragma mark ViewTouch
#pragma mark OtherMethods
-(void)callWebservice
{
    
    NSString * aStrFilter;
    if([mutDictFilter allKeys].count > 0)
    {
        NSData * jsonData = [NSJSONSerialization  dataWithJSONObject:mutDictFilter options:0 error:nil];
        aStrFilter = [[NSString alloc] initWithData:jsonData   encoding:NSUTF8StringEncoding];
        
    }
    else
        aStrFilter = @"";
    
    
    NSDictionary *aDictObj = [[NSDictionary alloc] initWithObjectsAndKeys:[UserDefaults objectForKey:FMS_LoginUserToken],@"token",[UserDefaults objectForKey:FMS_LoginUserType],@"role",@"missed",@"type",[NSString stringWithFormat:@"%d",intPageNumber],@"page",aStrFilter,@"filter", nil];
    
    
    Webservice *WebserviceObj = [[Webservice alloc] init];
    [WebserviceObj callWebserviceWithURL:[NSString stringWithFormat:@"%@/loads/get_loads",FMS_WSURL] withSilentCall:FALSE  withParams:aDictObj forViewController:self withCompletionBlock:^(NSDictionary *responseData)
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
                 FMS_get_loads *aFMS_get_loadsOb = [[FMS_get_loads alloc] initWithDictionary:aDictObj];
                 
                 
                 [mutArrData addObject:aFMS_get_loadsOb];
                 
             }
             
             if(responseData[@"unread_message"])
             {
                 [FMS_Utility sharedFMSUtility].strUnreadCount = responseData[@"unread_message"];
                 [self refreshBadge];
             }
             
             [self.tblVWLoads reloadData];
             
             [[FMS_Utility sharedFMSUtility] updateUserPermission:responseData];
             
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
- (IBAction)btnFilterClick:(UIButton *)sender {
    
    FMS_Filter *fms_obj = [[FMS_Utility sharedFMSUtility] addViewControllerforFilter:self withStatus:3 withFilledDictionary:mutDictFilter];
    
    [fms_obj setDoneFilterBlock:^(NSMutableDictionary *response)
     {
         intPageNumber=1;
         [mutDictFilter removeAllObjects];
         [mutDictFilter addEntriesFromDictionary:response];
         [self callWebservice];
         
     }];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark - UITableview Delegates and Datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [mutArrData count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"FMS_MissedCell";
    FMS_MissedCell *aCell = (FMS_MissedCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    FMS_get_loads *aFMS_get_loadsObj = mutArrData[indexPath.row];
    
    aCell.lblDate.text =aFMS_get_loadsObj.date;
    aCell.lblDestLoc.text =aFMS_get_loadsObj.toLocation;
    aCell.lblSourceLoc.text =aFMS_get_loadsObj.fromLocation;
    aCell.lblReason.text=aFMS_get_loadsObj.missedReason;
    
    if([FMS_Utility isLoginFromDriver])
    {
        aCell.imgVWTruck.hidden = TRUE;
        aCell.lblDriverName.hidden = TRUE;
    }
    else
    {
        aCell.imgVWTruck.hidden = false;
        aCell.lblDriverName.hidden = false;
        aCell.lblDriverName.text = aFMS_get_loadsObj.driverName;
    }

    if(intMaxPageNumber!=intPageNumber && indexPath.row==[mutArrData count]-1)
    {
        intPageNumber++;
        [self callWebservice];
    }
    [aCell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return aCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([FMS_Utility isLoginFromDriver])
    {
        return 74;
    }
    else
    {
        return 94;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}


@end
