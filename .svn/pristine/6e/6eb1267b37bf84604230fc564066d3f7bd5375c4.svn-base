//
//  FMS_AssignedVC.m
//  FMS
//
//  Created by indianic on 06/08/15.
//  Copyright (c) 2015 indianic. All rights reserved.
//

#import "FMS_AssignedVC.h"
#import "FMS_LoadDetailVC.h"
#import "FMS_AssignedCell.h"
@interface FMS_AssignedVC ()

@end

@implementation FMS_AssignedVC


#pragma mark View lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setNavigationBarWithTitle:@"Assigned Loads" withBack:FALSE];
    
    mutDictFilter = [[NSMutableDictionary alloc] init];
    mutArrData = [[NSMutableArray alloc] init];
    
    [[FMS_Utility sharedFMSUtility] addPullToRefreshOnTableView:self.tblVWLoads WithCompleton:^{
        
        intPageNumber=1;
        [self callWebservice];
        
    }];
    

    
    
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self refreshBadge];
    
    [self.tblVWLoads setContentOffset:CGPointZero animated:YES];
    intPageNumber=1;
    [self callWebservice];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Orientation
#pragma mark Events
#pragma mark ViewTouch
#pragma mark OtherMethods
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
   
    
    
    NSDictionary *aDictObj = [[NSDictionary alloc] initWithObjectsAndKeys:[UserDefaults objectForKey:FMS_LoginUserToken],@"token",[UserDefaults objectForKey:FMS_LoginUserType],@"role",@"assigned",@"type",[NSString stringWithFormat:@"%d",intPageNumber],@"page", aStrFilter,@"filter", nil];
    
    
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
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    FMS_LoadDetailVC *FMS_LoadDetailVCObj = (FMS_LoadDetailVC*)[segue destinationViewController];
    FMS_LoadDetailVCObj.isLoadDetail = FALSE;
    FMS_LoadDetailVCObj.showRightButtons = TRUE;
    FMS_get_loads *aFMS_get_loadsObj = mutArrData[intSelectedIndex];
    FMS_LoadDetailVCObj.strLoadId = aFMS_get_loadsObj.orderId;
}
#pragma mark - UITableview Delegates and Datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [mutArrData count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"FMS_AssignedCell";
    
    FMS_AssignedCell *aCell =(FMS_AssignedCell*) [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    aCell.backgroundColor = [UIColor clearColor];
    
    FMS_get_loads *aFMS_get_loadsObj = mutArrData[indexPath.row];
    if([FMS_Utility isLoginFromDriver])
    {
        aCell.imgVWTruck.hidden = TRUE;
        aCell.imgVWCommodity.hidden = false;
        aCell.lblDriverName.text = aFMS_get_loadsObj.commodity;
        
        aCell.lblDestLoc.text =aFMS_get_loadsObj.toLocation;
        aCell.lblSourceLoc.text =aFMS_get_loadsObj.fromLocation;
        
        if([aFMS_get_loadsObj.orderModified boolValue])
        {
            aCell.backgroundColor = [UIColor colorWithRed:74.0/255.0 green:73.0/255.0 blue:73.0/255.0 alpha:1.0];
        }
    }
    else
    {
        aCell.imgVWTruck.hidden = FALSE;
        aCell.imgVWCommodity.hidden = true;
        aCell.lblDriverName.text =aFMS_get_loadsObj.driverName;
        
        aCell.lblDestLoc.text =aFMS_get_loadsObj.toLocation;
        aCell.lblSourceLoc.text =aFMS_get_loadsObj.fromLocation;
        
        [aCell.lblDriverName setFrame:CGRectMake(aCell.imgVWTruck.frame.origin.x + aCell.imgVWTruck.frame.size.width+4,aCell.lblDriverName.frame.origin.y,aCell.lblDriverName.frame.size.width, aCell.lblDriverName.frame.size.height)];
    }
    
    
    if([aFMS_get_loadsObj.status.lowercaseString isEqualToString:@"arrived"])
    {
        aCell.backgroundColor = [UIColor colorWithRed:23.0/255.0 green:25.0/255.0 blue:26.0/255.0 alpha:1.0];
    }
    
    
  

    
    aCell.lblDate.text =aFMS_get_loadsObj.date;
    
    if(intMaxPageNumber!=intPageNumber && indexPath.row==[mutArrData count]-1)
    {
        intPageNumber++;
        [self callWebservice];
    }

    
    
    [aCell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return aCell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
     intSelectedIndex=(int)indexPath.row;
    [self performSegueWithIdentifier:@"pushLoadDetailVC" sender:self];

}

@end
