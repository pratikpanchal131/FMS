//
//  FMS_NotificationVC.m
//  FMS
//
//  Created by indianic on 06/08/15.
//  Copyright (c) 2015 indianic. All rights reserved.
//

#import "FMS_NotificationVC.h"
#import "FMS_GetNotification.h"
#import "FMS_NotificationCell.h"
#import "FMS_LoadDetailVC.h"
#import "FMS_DeliveredHistoryVC.h"
@interface FMS_NotificationVC ()

@end

@implementation FMS_NotificationVC

#pragma mark View lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationBarWithTitle:@"Notifications" withBack:TRUE];
    
    mutArrNotification = [[NSMutableArray alloc] init];
    intPageNumber = 1;
    [self callWebservice];
    [[FMS_Utility sharedFMSUtility] addPullToRefreshOnTableView:tblViewNotification WithCompleton:^{
        
        intPageNumber=1;
        [self callWebservice];
        
    }];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self refreshBadge];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Events

#pragma mark OtherMethods

-(void)callWebservice
{
    NSString * aStrFilter;
    if([dictMutFillData allKeys].count > 0)
    {
        NSData * jsonData = [NSJSONSerialization  dataWithJSONObject:dictMutFillData options:0 error:nil];
        aStrFilter = [[NSString alloc] initWithData:jsonData   encoding:NSUTF8StringEncoding];
        
    }
    else
        aStrFilter = @"";
    
    NSDictionary *aDictObj = [[NSDictionary alloc] initWithObjectsAndKeys:[UserDefaults objectForKey:FMS_LoginUserType],@"role",[UserDefaults objectForKey:FMS_LoginUserToken],@"token",[NSString stringWithFormat:@"%d",intPageNumber],@"page",aStrFilter,@"filter", nil];
    
    Webservice *WebserviceObj = [[Webservice alloc] init];
    [WebserviceObj callWebserviceWithURL:[NSString stringWithFormat:@"%@/users/get_notifications",FMS_WSURL] withSilentCall:FALSE  withParams:aDictObj forViewController:self withCompletionBlock:^(NSDictionary *responseData)
     {
         if([responseData[@"status"] intValue]==1)
         {
             if(intPageNumber==1)
             {
                 [mutArrNotification removeAllObjects];
                 
                 if(!responseData[@"data"] || [responseData[@"data"] count]==0)
                     lblNoData.hidden = FALSE;
                 else
                     lblNoData.hidden = TRUE;
             }
             intMaxPageNumber = [responseData[@"total_page"] intValue];
             
             for(NSDictionary*aDictObj in responseData[@"data"])
             {
                 FMS_GetNotification *aFMS_GetNotificationObj = [[FMS_GetNotification alloc] initWithDictionary:aDictObj];
                [mutArrNotification addObject:aFMS_GetNotificationObj];
             }
             [tblViewNotification reloadData];
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


#pragma mark Events

- (IBAction)btnSelecPastNotification:(UIButton *)sender {
    
    FMS_Filter *fms_obj = [[FMS_Utility sharedFMSUtility] addViewControllerforFilter:self withStatus:3 withFilledDictionary:nil];
    
    [fms_obj setDoneFilterBlock:^(NSMutableDictionary *response) {
        
        dictMutFillData = [NSMutableDictionary dictionary];
        dictMutFillData = response;
        [self callWebservice];    }];
}

#pragma mark - UITableview Delegates and Datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return mutArrNotification.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"FMS_NotificationCell";
    FMS_NotificationCell *aCell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    [aCell setSelectionStyle:UITableViewCellSelectionStyleNone];
    FMS_GetNotification *aFMS_GetNotificationObj = mutArrNotification[indexPath.row];
    aCell.lblMessage.text = aFMS_GetNotificationObj.notifyText;
    
    CGFloat height = [self getHeightForControl:aCell.lblMessage forString:aFMS_GetNotificationObj.notifyText];
    [aCell.lblMessage setFrame:CGRectMake(aCell.lblMessage.frame.origin.x, aCell.lblMessage.frame.origin.y, aCell.lblMessage.frame.size.width, height)];
    return aCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UILabel *lblMessage = [[UILabel alloc]initWithFrame:CGRectMake(23, 0, self.view.frame.size.width-40, 12)];
    [lblMessage setFont:[UIFont fontWithName:@"Roboto-Medium" size:12.0]];
    FMS_GetNotification *aFMS_GetNotificationObj = mutArrNotification[indexPath.row];
    CGFloat height = [self getHeightForControl:lblMessage forString:aFMS_GetNotificationObj.notifyText];
    return height +30;
}

-(float)getHeightForControl:(UILabel*)lblRef forString:(NSString*)aStr
{
    CGRect textRect = [aStr boundingRectWithSize:CGSizeMake(self.view.frame.size.width-40, 999.0)
                                         options:NSStringDrawingUsesLineFragmentOrigin
                                      attributes:@{NSFontAttributeName:lblRef.font}
                                         context:nil];
    return textRect.size.height;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    FMS_GetNotification *aFMS_GetNotificationObj = mutArrNotification[indexPath.row];
    //'New Load','Update Load','Assigned','Arrived','Picked up','Delivered','Missed','Other'
    NSString *aStrType = aFMS_GetNotificationObj.notificationType;
    
    NSArray *aArrNavRequiredStatus = [NSArray arrayWithObjects:@"Arrived",@"Picked up",@"Assigned",@"Delivered",@"New Load", nil];
    
    if([aArrNavRequiredStatus containsObject:aStrType])
    {
        if([aStrType isEqualToString:@"Delivered"])
        {
            UIStoryboard *aStoryBoardObj = [UIStoryboard storyboardWithName:FMS_StoryboardMain bundle:nil];
            FMS_DeliveredHistoryVC *FMS_DeliveredHistoryVCObj = [aStoryBoardObj instantiateViewControllerWithIdentifier:@"FMS_DeliveredHistoryVC"];
            FMS_DeliveredHistoryVCObj.strOrderID = aFMS_GetNotificationObj.objectId;
            FMS_DeliveredHistoryVCObj.showRightButtons = FALSE;
            [self.navigationController pushViewController:FMS_DeliveredHistoryVCObj animated:YES];
            
        }
        else
        {
            UIStoryboard *aStoryBoardObj = [UIStoryboard storyboardWithName:FMS_StoryboardMain bundle:nil];
            FMS_LoadDetailVC *FMS_LoadDetailVCObj = [aStoryBoardObj instantiateViewControllerWithIdentifier:@"FMS_LoadDetailVC"];
            
            if([aStrType isEqualToString:@"New Load"])
            {
                FMS_LoadDetailVCObj.isLoadDetail = YES;
            }
            else
            {
                FMS_LoadDetailVCObj.isLoadDetail = NO;
            }
            
            FMS_LoadDetailVCObj.showRightButtons = FALSE;
            
            FMS_LoadDetailVCObj.strLoadId = aFMS_GetNotificationObj.objectId;
            [self.navigationController pushViewController:FMS_LoadDetailVCObj animated:YES];
            
        }

    }
    
    
    
    
   

    
    


//    NSString *aStrObjectId = aFMS_GetNotificationObj.objectId;
//    
//    if([aStrObjectId intValue]!=0)
//    {
//        FMS_GetNotification *aFMS_GetNotificationObj = mutArrNotification[indexPath.row];
//        UIStoryboard *aStoryBoardObj = [UIStoryboard storyboardWithName:FMS_StoryboardMain bundle:nil];
//        FMS_LoadDetailVC *aFMS_LoadDetailVCObj =  [aStoryBoardObj instantiateViewControllerWithIdentifier:@"FMS_LoadDetailVC"];
//        aFMS_LoadDetailVCObj.strLoadId = aFMS_GetNotificationObj.objectId;
//        if ([aFMS_GetNotificationObj.objectType isEqualToString:@"load"])
//            aFMS_LoadDetailVCObj.isLoadDetail = YES;
//        else
//            aFMS_LoadDetailVCObj.isLoadDetail = NO;
//        
//        aFMS_LoadDetailVCObj.showRightButtons = FALSE;
//        [self.navigationController pushViewController:aFMS_LoadDetailVCObj animated:YES];
//
//    }
}

@end
