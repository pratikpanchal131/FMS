//
//  FMS_DashBoardVC.m
//  FMS
//
//  Created by indianic on 06/08/15.
//  Copyright (c) 2015 indianic. All rights reserved.
//

#import "FMS_DashBoardVC.h"
#import "FMS_LoadDetailVC.h"
#import "FMS_DashBoardCell.h"

@interface FMS_DashBoardVC ()

@end

@implementation FMS_DashBoardVC

#pragma mark View lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    

    if([FMS_Utility sharedFMSUtility].isFromNotification)
        [self performSelector:@selector(pushToDetail) withObject:nil afterDelay:0.5];
    
    mutArrData = [[NSMutableArray alloc] init];
    intPageNumber=1;
    
    [self setNavigationBarWithTitle:@"Dashboard" withBack:FALSE];
    
   
    
    
    if([[FMS_Utility sharedFMSUtility] checkForAcceptLoadPermission])
    {
        
        // If accept_load permission is there for driver or logged in user is contractor then show recent option.

        
        UIButton *aBtnRef = (UIButton*)[vwAcceptLoadTrue viewWithTag:101];
        vwAcceptLoadTrue.hidden = FALSE;
        vwAcceptLoadFalse.hidden = TRUE;
        [self btnOptionsSelected:aBtnRef];
    }
    else
    {
        UIButton *aBtnRef = (UIButton*)[vwAcceptLoadFalse viewWithTag:102];
        vwAcceptLoadTrue.hidden = TRUE;
        vwAcceptLoadFalse.hidden = FALSE;
        [self btnOptionsSelected:aBtnRef];

    }
    
    
    
    [[FMS_Utility sharedFMSUtility] addPullToRefreshOnTableView:self.tblVWLoads WithCompleton:^{
        
        intPageNumber=1;
        [self callWebservice];
        
    }];
    
    
    
    
    
    
   [self registerDeviceTokenOnServer];

    
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
    
    // Call WS for Filter Data
    [FMS_Utility loads_filtersData:nil withCompletionBlock:^(NSDictionary *responseData)
     {
         
     } withFailureBlock:^(NSError *error) {
         
     }];
    
    if(boolLoadedOnce)
    {
         [self.tblVWLoads setContentOffset:CGPointZero animated:YES];
        intPageNumber=1;
     [self callWebservice];
    }
    else
        boolLoadedOnce = TRUE;
}
#pragma mark Orientation
#pragma mark Events
#pragma mark ViewTouch
#pragma mark OtherMethods
-(void)pushToDetail
{
    NSString *aStrObjectId = [FMS_Utility sharedFMSUtility].dictNotification[@"aps"][@"object_id"];
    
    if(aStrObjectId.length>0)
    {
        FMS_LoadDetailVC *FMS_LoadDetailVCObj;
        
        UIStoryboard *aStoryBoardObj = [UIStoryboard storyboardWithName:FMS_StoryboardMain bundle:nil];
        FMS_LoadDetailVCObj = [aStoryBoardObj instantiateViewControllerWithIdentifier:@"FMS_LoadDetailVC"];
        
        if([[FMS_Utility sharedFMSUtility].dictNotification[@"aps"][@"object_type"] isEqualToString:@"load"])
        {
            FMS_LoadDetailVCObj.isLoadDetail = YES;
        }
        else
        {
            FMS_LoadDetailVCObj.isLoadDetail = NO;
        }
        
        FMS_LoadDetailVCObj.showRightButtons = FALSE;
        
        if(aStrObjectId.length>0)
        {
            FMS_LoadDetailVCObj.strLoadId = [FMS_Utility sharedFMSUtility].dictNotification[@"aps"][@"object_id"];
            [self.navigationController pushViewController:FMS_LoadDetailVCObj animated:TRUE];
        }
    }
}
-(void)registerDeviceTokenOnServer
{
    NSString *aStrDeviceToken = [UserDefaults objectForKey:FMS_deviceToken];
    
    if(aStrDeviceToken && aStrDeviceToken.length>0 && ![FMS_Utility sharedFMSUtility].boolTokenUpdated)
    {
        Webservice* _WebserviceObj = [[Webservice alloc] init];
        
        NSDictionary *DictObj = @{@"token":[UserDefaults objectForKey:FMS_LoginUserToken],
                                  @"role":[UserDefaults objectForKey:FMS_LoginUserType],@"device_os":@"ios",@"device_id":[UserDefaults objectForKey:FMS_deviceToken]};
        
        NSString *aStrUrl = [NSString stringWithFormat:@"%@/users/update_device_token",FMS_WSURL];
        
        [_WebserviceObj callWebserviceWithURL:aStrUrl withSilentCall:TRUE withParams:DictObj forViewController:nil withCompletionBlock:^(NSDictionary *responseData)
         {
             
             if([responseData[@"status"] intValue]==1)
             {
                 [FMS_Utility sharedFMSUtility].boolTokenUpdated = TRUE;

             }
             
         } withFailureBlock:^(NSError *error)
         {
             
         }];
    }
}
-(void)callWebservice
{
    
    NSDictionary *aDictObj = [[NSDictionary alloc] initWithObjectsAndKeys:[UserDefaults objectForKey:FMS_LoginUserToken],@"token",[UserDefaults objectForKey:FMS_LoginUserType],@"role",strCurrentType,@"type",[NSString stringWithFormat:@"%d",intPageNumber],@"page", nil];
    
    
    Webservice *WebserviceObj = [[Webservice alloc] init];
    [WebserviceObj callWebserviceWithURL:[NSString stringWithFormat:@"%@/loads/get_loads",FMS_WSURL] withSilentCall:FALSE  withParams:aDictObj forViewController:self withCompletionBlock:^(NSDictionary *responseData)
     {
         
         
         if([responseData[@"status"] intValue]==1)
         {
             
             if(intPageNumber==1)
             {
                 [mutArrData removeAllObjects];
                 
                 if(!responseData[@"data"] || [responseData[@"data"] count]==0)
                 {
                     lblNoData.hidden = FALSE;
                     lblTotalEarning.hidden = TRUE;
                 }
                 else
                 {
                     lblNoData.hidden = TRUE;
                     lblTotalEarning.hidden = false;
                 }
             }

             if([strCurrentType isEqualToString:@"today"])
             {
                 [_tblVWLoads setFrame:CGRectMake(_tblVWLoads.frame.origin.x, _tblVWLoads.frame.origin.y, _tblVWLoads.frame.size.width, lblTotalEarning.frame.origin.y-_tblVWLoads.frame.origin.y)];
                 NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
                 formatter.dateFormat = @"EE MMM dd ";
                 lblTotalEarning.text = [NSString stringWithFormat:@"%@",[formatter stringFromDate:[NSDate date]]];
                 
                 
                 
                 
             }
             else
             {
                 lblTotalEarning.hidden = true;
                 [_tblVWLoads setFrame:CGRectMake(_tblVWLoads.frame.origin.x, _tblVWLoads.frame.origin.y, _tblVWLoads.frame.size.width, lblTotalEarning.frame.origin.y+lblTotalEarning.frame.size.height-_tblVWLoads.frame.origin.y)];
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
    
    
    FMS_LoadDetailVCObj.isLoadDetail = [strCurrentType isEqualToString:@"recent"];
    FMS_LoadDetailVCObj.showRightButtons = TRUE;
    FMS_get_loads *aFMS_get_loadsObj =mutArrData[intCurrentIndex];
    FMS_LoadDetailVCObj.strLoadId =[strCurrentType isEqualToString:@"recent"]? aFMS_get_loadsObj.loadId : aFMS_get_loadsObj.orderId;
    
}

- (IBAction)btnOptionsSelected:(UIButton *)sender
{
    if(btnPrevSelected!=sender && btnPrevSelected)
    {
        btnPrevSelected.selected = FALSE;
        [btnPrevSelected.titleLabel setFont:[UIFont fontWithName:@"Roboto-Light" size:12.0]];
    }
    
    [sender.titleLabel setFont:[UIFont fontWithName:@"Roboto-Medium" size:12.0]];
    sender.selected = TRUE;
    btnPrevSelected = sender;
    
    if(sender.tag==101)
    {
        strCurrentType=@"recent";
        
        lblNoData.text = @"No loads available.";
    }
    else if(sender.tag==102)
    {
        strCurrentType=@"today";
        lblNoData.text = @"No orders available.";
    }
    else
    {
        strCurrentType=@"pickup";
        lblNoData.text = @"No orders available.";
    }

    intPageNumber=1;
    [self callWebservice];
    
    
    if([[FMS_Utility sharedFMSUtility] checkForAcceptLoadPermission])
    {
        [UIView animateWithDuration:0.2 animations:^{
            
            vwSelectionDisplay.frame=CGRectMake(sender.frame.origin.x,vwSelectionDisplay.frame.origin.y,sender.frame.size.width, vwSelectionDisplay.frame.size.height);
        }];
    }
    else
    {
        [UIView animateWithDuration:0.2 animations:^{
            
            vwSelectedOption.frame=CGRectMake(sender.frame.origin.x,vwSelectedOption.frame.origin.y,sender.frame.size.width, vwSelectedOption.frame.size.height);
        }];
    }
    
    
}
#pragma mark - UITableview Delegates and Datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [mutArrData count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"FMS_DashBoardCell";
    FMS_DashBoardCell *aCell =(FMS_DashBoardCell*) [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    aCell.backgroundColor = [UIColor clearColor];

    FMS_get_loads *aFMS_get_loadsObj = mutArrData[indexPath.row];
    
    if([FMS_Utility isLoginFromDriver])
    {
        aCell.imgVWDollar.hidden = FALSE;
        aCell.imgVWTruck.hidden = TRUE;
        
        if([strCurrentType isEqualToString:@"recent"])
        {
            if([[FMS_Utility sharedFMSUtility] checkForViewRatePermission])
            {
                aCell.lblAmount.text =[NSString stringWithFormat:@"%@/%@",aFMS_get_loadsObj.price,aFMS_get_loadsObj.unit];
            }
            else
            {
                aCell.lblAmount.text = @"-";
            }
        }
        else if([strCurrentType isEqualToString:@"today"])
        {
            if([[FMS_Utility sharedFMSUtility] checkForViewRatePermission])
            {
                aCell.lblAmount.text =[NSString stringWithFormat:@"%@",aFMS_get_loadsObj.price];
            }
            else
            {
                aCell.lblAmount.text = @"-";
            }
            
            if([aFMS_get_loadsObj.orderModified boolValue])
            {
                aCell.backgroundColor = [UIColor colorWithRed:74.0/255.0 green:73.0/255.0 blue:73.0/255.0 alpha:1.0];
            }
            
        }
        else
        {
            if([[FMS_Utility sharedFMSUtility] checkForViewRatePermission])
            {
                aCell.lblAmount.text =[NSString stringWithFormat:@"%@",aFMS_get_loadsObj.price];
            }
            else
            {
                aCell.lblAmount.text = @"-";
            }
        }
        
        
        [aCell.lblAmount setFrame:CGRectMake(aCell.imgVWDollar.frame.origin.x + aCell.imgVWDollar.frame.size.width+5,aCell.lblAmount.frame.origin.y,aCell.lblAmount.frame.size.width, aCell.lblAmount.frame.size.height)];
    }
    else
    {
        if(aFMS_get_loadsObj.driverName.length>0)
        {
            aCell.imgVWDollar.hidden = TRUE;
            aCell.imgVWTruck.hidden = FALSE;
            
            
            aCell.lblAmount.text =aFMS_get_loadsObj.driverName;
            
            [aCell.lblAmount setFrame:CGRectMake(aCell.imgVWTruck.frame.origin.x + aCell.imgVWTruck.frame.size.width+4,aCell.lblAmount.frame.origin.y,aCell.lblAmount.frame.size.width, aCell.lblAmount.frame.size.height)];
            
        }
        else
        {
            aCell.imgVWDollar.hidden = TRUE;
            aCell.imgVWTruck.hidden = TRUE;
            aCell.lblAmount.text = @"";
        }
    }
    
    aCell.lblComodity.text = aFMS_get_loadsObj.commodity;
    aCell.lblDate.text =aFMS_get_loadsObj.date;
    
    if([strCurrentType isEqualToString:@"pickup"])
    {
        aCell.lblDestLoc.text =aFMS_get_loadsObj.toLocation;
        aCell.lblSourceLoc.text =aFMS_get_loadsObj.fromLocation;
        
        if([aFMS_get_loadsObj.status.lowercaseString isEqualToString:@"Arrived to deliver".lowercaseString])
        {
            aCell.backgroundColor = [UIColor colorWithRed:23.0/255.0 green:25.0/255.0 blue:26.0/255.0 alpha:1.0];
        }
    }
    else
    {
        aCell.lblDestLoc.text =aFMS_get_loadsObj.toLocation;
        aCell.lblSourceLoc.text =aFMS_get_loadsObj.fromLocation;
    }
    
    
    aCell.lblLoads.text =[NSString stringWithFormat:@"%@", aFMS_get_loadsObj.loadCount];
    aCell.lblLoadTitle.text =[aCell.lblLoads.text intValue]>1 ? @"load(s)" : @"load";
    
    
    
    
    if([strCurrentType isEqualToString:@"today"])
    {
        if([aFMS_get_loadsObj.status.lowercaseString isEqualToString:@"arrived"])
        {
            aCell.backgroundColor = [UIColor colorWithRed:23.0/255.0 green:25.0/255.0 blue:26.0/255.0 alpha:1.0];
        }
    }

    
    
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
    intCurrentIndex =(int) indexPath.row;
    [self performSegueWithIdentifier:@"pushLoadDetailVC" sender:self];

}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


@end
