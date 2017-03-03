//
//  FMS_LoginlessVC.m
//  FMS
//
//  Created by indianic on 07/08/15.
//  Copyright (c) 2015 indianic. All rights reserved.
//

#import "FMS_LoginlessVC.h"
#import "FMS_DashBoardCell.h"
#import "FMS_AvailableCell.h"

@interface FMS_LoginlessVC ()

@end

@implementation FMS_LoginlessVC

#pragma mark View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.navigationController setNavigationBarHidden:FALSE];
    [self setNavigationBarWithTitle:@"Loads" withBack:TRUE];
    
    txtVWAlert.dataDetectorTypes = UIDataDetectorTypeLink;
    
    mutArrData = [[NSMutableArray alloc] init];
    intPageNumber=1;
    [[FMS_Utility sharedFMSUtility] addPullToRefreshOnTableView:tblVWLoads WithCompleton:^{
        
        intPageNumber=1;
        [self callWebservice];
        
    }];
    [self callWebservice];
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
    NSDictionary *aDictObj = [[NSDictionary alloc] initWithObjectsAndKeys:[NSString stringWithFormat:@"%d",intPageNumber],@"page", nil];
    
    Webservice *WebserviceObj = [[Webservice alloc] init];
    [WebserviceObj callWebserviceWithURL:[NSString stringWithFormat:@"%@/loads/get_loads_without_login",FMS_WSURL] withSilentCall:FALSE  withParams:aDictObj forViewController:self withCompletionBlock:^(NSDictionary *responseData)
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
    
    static NSString *CellIdentifier = @"FMS_AvailableCell";
    FMS_AvailableCell *aCell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    [aCell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    FMS_get_loads *aFMS_get_loadsObj = mutArrData[indexPath.row];
    aCell.lblDate.text =aFMS_get_loadsObj.date;
    aCell.lblSourceLoc.text =aFMS_get_loadsObj.fromCity;
    aCell.lblDestLoc.text =aFMS_get_loadsObj.toCity;
    aCell.lblLoads.text =aFMS_get_loadsObj.loadCount;
    aCell.lblCommodity.text=aFMS_get_loadsObj.commodity;
    aCell.lblAmount.text = [NSString stringWithFormat:@"%@/%@",aFMS_get_loadsObj.price,aFMS_get_loadsObj.unit];
    
    
    if(intMaxPageNumber!=intPageNumber && indexPath.row==[mutArrData count]-1)
    {
        intPageNumber++;
        [self callWebservice];
    }
    return aCell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [self.view addSubview:vwAlert];
    [vwAlert setFrame:CGRectMake(0,0,self.view.frame.size.width,self.view.frame.size.height)];
    
//    [[FMS_Utility sharedFMSUtility]showAlertWithTarget:self WithMessage:@"Kindly login to access all features." withCancelButton:@"OK" WithCompletionBlock:^(int index) {
//        
//    } withOtherButtons:nil];
}
- (IBAction)btnOkClicked:(UIButton *)sender
{
    [vwAlert removeFromSuperview];
}
@end
