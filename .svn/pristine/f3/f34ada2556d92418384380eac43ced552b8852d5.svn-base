//
//  FMS_DriversLoadVC.m
//  FMS
//
//  Created by indianic on 10/08/15.
//  Copyright (c) 2015 indianic. All rights reserved.
//

#import "FMS_DriversLoadVC.h"
#import "FMS_OrderStatusCell.h"

@interface FMS_DriversLoadVC ()

@end

@implementation FMS_DriversLoadVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationBarWithTitle:@"Driver Loads" withBack:FALSE];
    // Do any additional setup after loading the view.
    
    dictFilterData = [[NSMutableDictionary alloc] init];
    mutArrData = [[NSMutableArray alloc] init];
    intPageNumber=1;
    [self callWebserviceForOrderStatus];
    
    [[FMS_Utility sharedFMSUtility] addPullToRefreshOnTableView:self.tblDriverLoad WithCompleton:^{
        
        intPageNumber=1;
        [self callWebserviceForOrderStatus];
        
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



#pragma mark -----------------------
#pragma mark TableVew Datasource Methods

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return mutArrData.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FMS_OrderStatusCell *aCell = (FMS_OrderStatusCell *)[tableView dequeueReusableCellWithIdentifier:@"FMS_DriveLoadCell"];
    [self configureCell:aCell withDictionary:mutArrData[indexPath.row] withIndexPath:indexPath];
    return aCell;
}

-(void)configureCell:(FMS_OrderStatusCell *)cell withDictionary:(FMS_Order_Status *)dict withIndexPath:(NSIndexPath *)indexPath
{
    cell.lblLocationFrom.text = dict.fromLocation;
    cell.lblLocationTo.text = dict.toLocation;
    cell.lblDate.text = dict.date;
    cell.lblStatuis.text = dict.orderStatus;
    
    UIImageView *imgViewTruck = (UIImageView *)[cell.contentView viewWithTag:200];
    UILabel *lblViewTruckName = (UILabel *)[cell.contentView viewWithTag:201];
    UILabel *lblViewAccepted = (UILabel *)[cell.contentView viewWithTag:202];
    
    if ([FMS_Utility isLoginFromDriver]) {
        // Driver
        [imgViewTruck setHidden:YES];
        
        [lblViewTruckName setHidden:YES];
        
        [lblViewAccepted setTextAlignment:(NSTextAlignmentLeft)];
    }else{
        
        [lblViewTruckName setText:dict.driverName];
        
    }
    
    if(intMaxPageNumber!=intPageNumber && indexPath.row==[mutArrData count]-1)
    {
        intPageNumber++;
        [self callWebserviceForOrderStatus];
    }
}

- (IBAction)btnFilterClick:(UIButton *)sender {
    
    FMS_Filter *fms_obj = [[FMS_Utility sharedFMSUtility] addViewControllerforFilter:self withStatus:8 withFilledDictionary:dictFilterData];
    [fms_obj setDoneFilterBlock:^(NSMutableDictionary *response) {
        NSLog(@"%@", response);
        [dictFilterData removeAllObjects];
        [dictFilterData addEntriesFromDictionary:response];
        
        [self callWebserviceForOrderStatus];
    }];
}


#pragma mark ----------------------
#pragma mark WSCal

-(void)callWebserviceForOrderStatus
{
    NSString * aStrFilter;
    if([dictFilterData allKeys].count > 0)
    {
        NSData * jsonData = [NSJSONSerialization  dataWithJSONObject:dictFilterData options:0 error:nil];
        aStrFilter = [[NSString alloc] initWithData:jsonData   encoding:NSUTF8StringEncoding];
    }
    else
        aStrFilter = @"";
    
    NSDictionary *aDictObj = @{ @"token" : [UserDefaults objectForKey:FMS_LoginUserToken],
                                @"role" : [UserDefaults objectForKey:FMS_LoginUserType],
                                @"filter" : aStrFilter,
                                @"page" : [NSString stringWithFormat:@"%d",intPageNumber]};
    
    Webservice *WebserviceObj = [[Webservice alloc] init];
    [WebserviceObj callWebserviceWithURL:[NSString stringWithFormat:@"%@/contractors/driver_load",FMS_WSURL] withSilentCall:FALSE  withParams:aDictObj forViewController:self withCompletionBlock:^(NSDictionary *responseData)
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
                 FMS_Order_Status *aFMS_Order_StatusOb = [[FMS_Order_Status alloc] initWithDictionary:aDictObj];
                 
                 [mutArrData addObject:aFMS_Order_StatusOb];
                 
             }
             [self.tblDriverLoad reloadData];
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

@end
