//
//  FMS_OrderStatusVC.m
//  FMS
//
//  Created by indianic on 10/08/15.
//  Copyright (c) 2015 indianic. All rights reserved.
//

#import "FMS_OrderStatusVC.h"
#import "FMS_OrderStatusCell.h"
#import "FMS_Order_Status.h"

@interface FMS_OrderStatusVC ()

@end

@implementation FMS_OrderStatusVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationBarWithTitle:@"Order Status" withBack:FALSE];
    
    
    
    dictFilterData = [[NSMutableDictionary alloc] init];
    
    mutArrData = [[NSMutableArray alloc] init];
    
    intPageNumber=1;
    
    
    [[FMS_Utility sharedFMSUtility] addPullToRefreshOnTableView:self.tblOrderStatus WithCompleton:^{
        
        intPageNumber=1;
        [self callWebserviceForOrderStatus];
        
    }];
    
    [self callWebserviceForOrderStatus];
    
    // Do any additional setup after loading the view.
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

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */


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
    FMS_OrderStatusCell *aCell = (FMS_OrderStatusCell *)[tableView dequeueReusableCellWithIdentifier:@"FMS_OrderStatusCell"];
    
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
#pragma mark -----------------------]
#pragma mark Table View Delegate Methods

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (IBAction)btnFilterClick:(UIButton *)sender {
    
    int aIntFromDriver;
    if ([FMS_Utility isLoginFromDriver])
        aIntFromDriver = 7;
    else
        aIntFromDriver = 8;

    
    FMS_Filter *fms_obj = [[FMS_Utility sharedFMSUtility] addViewControllerforFilter:self withStatus:aIntFromDriver withFilledDictionary:dictFilterData];
    
    [fms_obj setDoneFilterBlock:^(NSMutableDictionary *response) {
        NSLog(@"%@", response);
        [dictFilterData removeAllObjects];
        [dictFilterData addEntriesFromDictionary:response];
        intPageNumber = 1;
    
        [self callWebserviceForOrderStatus];
    }];
}


#pragma mark ----------------------
#pragma mark WSCal

-(void)callWebserviceForOrderStatus
{
    // token,role,filter{from_date : "yyyy-mm-dd ", to_date : "yyyy-mm-dd ", driver_id},page
    
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
    [WebserviceObj callWebserviceWithURL:[NSString stringWithFormat:@"%@/loads/order_status",FMS_WSURL] withSilentCall:FALSE  withParams:aDictObj forViewController:self withCompletionBlock:^(NSDictionary *responseData)
     {
         
         // status(0/1) message() code() data:[{ row, [{from_location:" ",to_location:" ", date: "20 Jul. 15 ",order_id:" ", driver_name:" ", driver_id:" ", order_status: " "} ], total_page:" " }]
         
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
             
             [self.tblOrderStatus reloadData];
             
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
