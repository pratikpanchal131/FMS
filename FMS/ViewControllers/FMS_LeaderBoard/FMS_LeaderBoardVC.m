//
//  FMS_LeaderBoard.m
//  FMS
//
//  Created by indianic on 10/08/15.
//  Copyright (c) 2015 indianic. All rights reserved.
//

#import "FMS_LeaderBoardVC.h"
#import "FMS_LeaderBoardCell.h"
@interface FMS_LeaderBoardVC ()

@end

@implementation FMS_LeaderBoardVC

#pragma mark View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    mutLeaderBoard = [[NSMutableArray alloc] init];
    txtFSelectedCreteria.text = @"Miles";
    // Do any additional setup after loading the view.
    [self setNavigationBarWithTitle:@"Leader Board" withBack:false];
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

- (IBAction)btnFilterClick:(UIButton *)sender{
    
    FMS_Filter *fms_obj = [[FMS_Utility sharedFMSUtility] addViewControllerforFilter:self withStatus:10 withFilledDictionary:dictMutFillData]; // For Single month
    
    [fms_obj setDoneFilterBlock:^(NSMutableDictionary *response)
     {
         dictMutFillData = [NSMutableDictionary dictionary];
         dictMutFillData = response;
         [self callWebservice];
         NSLog(@"%@", response);
     }];
}

- (IBAction)btnSelectRankingCreteria:(UIButton *)sender {
    
    

    NSArray *aArrCriteria = [NSArray arrayWithObjects:@"Miles",@"Load Commitment",@"Delivered Load", nil];
    
    [[FMS_Utility sharedFMSUtility] addPicker:self onTextField:txtFSelectedCreteria pickerType:@"Simple" withKey:@"Other" withCompletionBlock:^(id picker, int buttonIndex, int firstindex, int secondindex)
     {
         [txtFSelectedCreteria resignFirstResponder];
         if (buttonIndex == 1)
         {
             txtFSelectedCreteria.text = aArrCriteria[firstindex];
             [self callWebservice];

         }
         
     } withPickerArray:aArrCriteria withPickerSecondArray:nil count:1 withTitle:nil];
    
    [txtFSelectedCreteria becomeFirstResponder];

  
}

#pragma mark OtherMethods
-(void)callWebservice
{
    
    NSMutableDictionary *aMutDictObj = [[NSMutableDictionary alloc] initWithObjectsAndKeys:[UserDefaults objectForKey:FMS_LoginUserType],@"role",[UserDefaults objectForKey:FMS_LoginUserToken],@"token",txtFSelectedCreteria.text, @"rank_criteria",nil];
    
    if([FMS_Utility isLoginFromDriver])
    {
        [aMutDictObj setObject:@"12" forKey:@"driver_id"];
    }
    
    if([dictMutFillData allKeys].count>0)
    {
        [aMutDictObj setObject:dictMutFillData[@"MonthFrom"] forKey:@"month_year"];
    }
    
    
    
    Webservice *WebserviceObj = [[Webservice alloc] init];
    [WebserviceObj callWebserviceWithURL:[NSString stringWithFormat:@"%@/loads/leader_board",FMS_WSURL] withSilentCall:FALSE  withParams:aMutDictObj forViewController:self withCompletionBlock:^(NSDictionary *responseData)
     {
         if([responseData[@"status"] intValue]==1)
         {
             [mutLeaderBoard removeAllObjects];
             
             if([responseData[@"data"] count]>0)
             {
                 [mutLeaderBoard addObjectsFromArray:responseData[@"data"]];

                 lblNoInfo.hidden = TRUE;
             }
             else
             {
                 lblNoInfo.hidden = FALSE;

             }
             
             
             [tblViewLeaderBoard reloadData];
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
    

    
    
    
    
    return [mutLeaderBoard count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"FMS_LeaderBoardCell";
    FMS_LeaderBoardCell *aCell = (FMS_LeaderBoardCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    NSDictionary *aDictCell = mutLeaderBoard[indexPath.row];
    
    
   
    
    if([txtFSelectedCreteria.text isEqualToString:@"Miles"])
    {
        aCell.lblMiles.text = aDictCell[@"commitments"];
        aCell.lblMilesTitle.text = @"Miles";
    }
    else if([txtFSelectedCreteria.text isEqualToString:@"Load Commitment"])
    {
        aCell.lblMiles.text = aDictCell[@"loads_commited"];
        aCell.lblMilesTitle.text = @"Load Commitment";
    }
    else
    {
        aCell.lblMiles.text = aDictCell[@"missed_loads"];
        aCell.lblMilesTitle.text = @"Delivered Load";
    }
    
    
    
   // aCell.lblCommitmentLoads.text = aDictCell[@"loads_commited"];
   // aCell.lblMiles.text = aDictCell[@"commitments"];
    //aCell.lblDelivered.text = aDictCell[@"missed_loads"];

    
    
    /*
    [aCell.lblMilesTitle setFont:[UIFont fontWithName:@"Roboto-Regular" size:aCell.lblMilesTitle.font.pointSize]];
    [aCell.lblCommitmentTitle setFont:[UIFont fontWithName:@"Roboto-Regular" size:aCell.lblCommitmentTitle.font.pointSize]];
    [aCell.lblDeliveredTitle setFont:[UIFont fontWithName:@"Roboto-Regular" size:aCell.lblDeliveredTitle.font.pointSize]];
    [aCell.lblMiles setFont:[UIFont fontWithName:@"Roboto-Regular" size:aCell.lblMiles.font.pointSize]];
    [aCell.lblCommitmentLoads setFont:[UIFont fontWithName:@"Roboto-Regular" size:aCell.lblCommitmentLoads.font.pointSize]];
    [aCell.lblDelivered setFont:[UIFont fontWithName:@"Roboto-Regular" size:aCell.lblDelivered.font.pointSize]];
    
    

    if([txtFSelectedCreteria.text isEqualToString:@"Miles"])
    {
        [aCell.lblMilesTitle setFont:[UIFont fontWithName:@"Roboto-Bold" size:aCell.lblMilesTitle.font.pointSize]];
        [aCell.lblMiles setFont:[UIFont fontWithName:@"Roboto-Bold" size:aCell.lblMiles.font.pointSize]];
    }
    else if([txtFSelectedCreteria.text isEqualToString:@"Load Commitment"])
    {
        [aCell.lblCommitmentTitle setFont:[UIFont fontWithName:@"Roboto-Bold" size:aCell.lblCommitmentTitle.font.pointSize]];
        [aCell.lblCommitmentLoads setFont:[UIFont fontWithName:@"Roboto-Bold" size:aCell.lblCommitmentLoads.font.pointSize]];
    }
    else
    {
        [aCell.lblDeliveredTitle setFont:[UIFont fontWithName:@"Roboto-Bold" size:aCell.lblDeliveredTitle.font.pointSize]];
        [aCell.lblDelivered setFont:[UIFont fontWithName:@"Roboto-Bold" size:aCell.lblDelivered.font.pointSize]];
    }
    
    
    
    
    aCell.lblCommitmentLoads.text = aDictCell[@"loads_commited"];
    aCell.lblMiles.text = aDictCell[@"commitments"];
    aCell.lblDelivered.text = aDictCell[@"missed_loads"];
     
     */
    
    aCell.lblName.text = aDictCell[@"driver_name"];
    aCell.lblRank.text = aDictCell[@"rank"];
    
    
    [aCell.imgVWThumb setImageWithURL:[NSURL URLWithString:aDictCell[@"driver_avatar"]] placeholderImage:[UIImage imageNamed:@"img_ProfileDefault"]];
    
    
    [aCell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return aCell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}


@end