//
//  FMS_RankVC.m
//  FMS
//
//  Created by indianic on 10/08/15.
//  Copyright (c) 2015 indianic. All rights reserved.
//

#import "FMS_RankVC.h"
#import "FMS_RankCell.h"


@interface FMS_RankVC ()

@end

@implementation FMS_RankVC

#pragma mark View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    mutRankData=[[NSMutableArray alloc] init];
    [self setNavigationBarWithTitle:@"My Rank" withBack:FALSE];
    [self callWebservice];
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
}
#pragma mark Events

- (IBAction)btnFromToMonth:(UIButton *)sender {

    FMS_Filter *fms_obj = [[FMS_Utility sharedFMSUtility] addViewControllerforFilter:self withStatus:10 withFilledDictionary:dictMutFillData]; // For Single month
    
    [fms_obj setDoneFilterBlock:^(NSMutableDictionary *response) {
        dictMutFillData = [NSMutableDictionary dictionary];
        dictMutFillData = response;
        [self callWebservice];
        NSLog(@"%@", response);
    }];
}

#pragma mark OtherMethods
-(void)callWebservice
{
     NSMutableDictionary *aMutDictObj = [[NSMutableDictionary alloc] initWithObjectsAndKeys:[UserDefaults objectForKey:FMS_LoginUserType],@"role",[UserDefaults objectForKey:FMS_LoginUserToken],@"token", nil];
    
    if([FMS_Utility isLoginFromDriver])
    {
        [aMutDictObj setObject:@"12" forKey:@"driver_id"];
    }
    
    if([dictMutFillData allKeys].count>0)
    {
        [aMutDictObj setObject:dictMutFillData[@"MonthFrom"] forKey:@"month_year"];
    }
    
    //token,role,month_year,rank_criteria
   
    
    Webservice *WebserviceObj = [[Webservice alloc] init];
    [WebserviceObj callWebserviceWithURL:[NSString stringWithFormat:@"%@/users/my_rank",FMS_WSURL] withSilentCall:FALSE  withParams:aMutDictObj forViewController:self withCompletionBlock:^(NSDictionary *responseData)
     {
         if([responseData[@"status"] intValue]==1)
         {
             [mutRankData removeAllObjects];
             
             if([responseData[@"data"] count]>0)
             {
                 [mutRankData addObjectsFromArray:responseData[@"data"]];
                 lblNoInfo.hidden = TRUE;

             }
             else
             {
                 lblNoInfo.hidden = FALSE;
             }
             [tblVWRank reloadData];
             
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
#pragma mark -----------------------
#pragma mark TableVew Datasource Methods

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [mutRankData count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FMS_RankCell *aCell = [tableView dequeueReusableCellWithIdentifier:@"FMS_RankCell"];
    
    NSDictionary *aDictObj = mutRankData[indexPath.row];
    
    aCell.lblMiles.text = aDictObj[@"load_commited_rank"];
    aCell.lblLoadHauled.text = aDictObj[@"load_hauled_rank"];
    aCell.lblLoadCommited.text = aDictObj[@"miles_rank"];
    aCell.lblDate.text = aDictObj[@"month_year"];
    
    return aCell;
}


#pragma mark -----------------------
#pragma mark Table View Delegate Methods

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}


@end
