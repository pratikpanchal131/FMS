//
//  FMS_LoadDetailVC.m
//  FMS
//
//  Created by indianic on 06/08/15.
//  Copyright (c) 2015 indianic. All rights reserved.
//

#import "FMS_LoadDetailVC.h"
#import "FMS_DeliveredLoadsVC.h"
@interface FMS_LoadDetailVC ()

@end

@implementation FMS_LoadDetailVC
@synthesize isLoadDetail,strLoadId,showRightButtons;

#pragma mark View lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    arrDriver = [AppDelegate objSharedAppDel].filterBaseObj.data.driver;
    if(arrDriver.count==0)
    {
        txtfld_DriverName.placeholder = @"No drivers available";
    }
    
    if([FMS_Utility sharedFMSUtility].isFromNotification)
    {
        [FMS_Utility sharedFMSUtility].isFromNotification = FALSE;
    }
    
    [self callDetailWS];
    
    if(isLoadDetail)
    {
        lblLoadsTitle.text = @"load(s)";
        [self setNavigationBarWithTitle:@"Load Detail" withBack:TRUE];
    }
    else
    {
        lblLoadsTitle.text = @"load";
        [self setNavigationBarWithTitle:@"Order Details" withBack:TRUE];
    }
    
    [txtFldQuantity setTintColor:FMS_WhiteColor];
    [txtFldReason setTintColor:FMS_WhiteColor];
    [txtFldStatus setTintColor:FMS_WhiteColor];
    
    
    // Do any additional setup after loading the view.
}
-(void)viewWillDisappear:(BOOL)animated
{
    if (self.navigationController==[AppDelegate objSharedAppDel].navCntrl)
    {
        [[AppDelegate objSharedAppDel].navCntrl setNavigationBarHidden:YES];
        
    }
    [super viewWillDisappear:animated];
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self refreshBadge];
    
    if (self.navigationController==[AppDelegate objSharedAppDel].navCntrl)
    {
        [[AppDelegate objSharedAppDel].navCntrl setNavigationBarHidden:NO];
        
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Orientation
#pragma mark Events

- (IBAction)btnSelectStatusClicked:(UIButton *)sender
{
    NSArray *aArrStatus;
    if([FMS_LoadDetailObj.orderStatus isEqualToString:@"Assigned"])
    {
        aArrStatus = [NSArray arrayWithObjects:@"Arrived to pick up",@"Miss", nil];
    }
    else if([FMS_LoadDetailObj.orderStatus isEqualToString:@"Arrived"])
    {
        aArrStatus = [NSArray arrayWithObjects:@"Pick up",@"Miss", nil];
    }
    else if([FMS_LoadDetailObj.orderStatus isEqualToString:@"Picked up"])
    {
        aArrStatus = [NSArray arrayWithObjects:@"Arrived to deliver",@"Miss", nil];
    }
    else if([FMS_LoadDetailObj.orderStatus isEqualToString:@"Arrived to deliver"])
    {
        aArrStatus = [NSArray arrayWithObjects:@"Delivered",@"Miss", nil];
    }
    else{}
    
    
    [txtFldStatus setTintColor:[UIColor clearColor]];
    
    
    [[FMS_Utility sharedFMSUtility] addPicker:self onTextField:txtFldStatus pickerType:@"Simple" withKey:@"Other" withCompletionBlock:^(id picker, int buttonIndex, int firstindex, int secondindex)
     {
         [txtFldStatus resignFirstResponder];
         
         if (buttonIndex == 1)
         {
             NSString *aStrSelectedStatus = aArrStatus[firstindex];
             
             txtFldStatus.text = aStrSelectedStatus;
             
             btnAccept.hidden = FALSE;
             vwSelectReason.hidden = TRUE;
             txtFldReason.hidden = TRUE;
             
             if([aStrSelectedStatus isEqualToString:@"Arrived to pick up"] || [aStrSelectedStatus isEqualToString:@"Pick up"] || [aStrSelectedStatus isEqualToString:@"Delivered"] || [aStrSelectedStatus isEqualToString:@"Arrived to deliver"])
             {
                 if([aStrSelectedStatus isEqualToString:@"Pick up"])
                     strSelectedStatus = @"Picked up";
                 else if([aStrSelectedStatus isEqualToString:@"Delivered"])
                     strSelectedStatus = @"Delivered";
                 else if([aStrSelectedStatus isEqualToString:@"Arrived to pick up"])
                     strSelectedStatus = @"Arrived";
                 else if([aStrSelectedStatus isEqualToString:@"Arrived to deliver"])
                     strSelectedStatus = @"Arrived to deliver";
                 else{}
            
                 [self setAcceptRect:CGRectMake(btnAccept.frame.origin.x, vwOrderStatus.frame.origin.y+vwOrderStatus.frame.size.height+22,btnAccept.frame.size.width,btnAccept.frame.size.height)];
             }
             else if([aArrStatus[firstindex] isEqualToString:@"Cancel"] || [aArrStatus[firstindex] isEqualToString:@"Miss"])
             {
                 
                 if([aArrStatus[firstindex] isEqualToString:@"Cancel"])
                     strSelectedStatus = @"Cancelled";
                 else if([aArrStatus[firstindex] isEqualToString:@"Miss"])
                     strSelectedStatus = @"Missed";
                 else{}
                 
                 vwSelectReason.hidden = FALSE;
                 
                 [self setAcceptRect:CGRectMake(btnAccept.frame.origin.x, vwSelectReason.frame.origin.y+vwSelectReason.frame.size.height+12,btnAccept.frame.size.width,btnAccept.frame.size.height)];
             }
             else{}
         }
         
     } withPickerArray:aArrStatus withPickerSecondArray:nil count:1 withTitle:nil];
    
    [txtFldStatus becomeFirstResponder];
    
    
}
- (IBAction)btnSelectDriverClicked:(UIButton *)sender
{
    if(![txtfld_DriverName.placeholder isEqualToString:@"No drivers available"])
    {
        [[FMS_Utility sharedFMSUtility] addPicker:self onTextField:txtfld_DriverName pickerType:@"Simple" withKey:@"driver_name" withCompletionBlock:^(id picker, int buttonIndex, int firstindex, int secondindex) {
            [txtfld_DriverName resignFirstResponder];
            if (buttonIndex == 1)
            {
                Driver *driverObj = arrDriver[firstindex];
                
                strDriverID= [NSString stringWithFormat:@"%@",driverObj.driverId];
                txtfld_DriverName.text = [NSString stringWithFormat:@"%@",driverObj.driverName];
            }
            
        } withPickerArray:arrDriver withPickerSecondArray:nil count:1 withTitle:nil];
        
        [txtfld_DriverName becomeFirstResponder];
    }
}
- (IBAction)btnSelectReasonClicked:(UIButton *)sender
{
    NSArray *aArrStatus;
    
    
    Status *statusObj = [AppDelegate objSharedAppDel].filterBaseObj.data.status;
    if([strSelectedStatus isEqualToString:@"Cancelled"])
    {
        aArrStatus = [NSArray arrayWithArray:statusObj.cancelled];
    }
    else if([strSelectedStatus isEqualToString:@"Missed"])
    {
        aArrStatus = [NSArray arrayWithArray:statusObj.missed];
    }
    else{}
    
    [txtFldStatus setTintColor:[UIColor clearColor]];
    
    
    [[FMS_Utility sharedFMSUtility] addPicker:self onTextField:txtFldReasonSelected pickerType:@"Simple" withKey:[NSString stringWithFormat:@"Reason_%@", strSelectedStatus] withCompletionBlock:^(id picker, int buttonIndex, int firstindex, int secondindex)
     {
         [txtFldReasonSelected resignFirstResponder];
         if (buttonIndex == 1)
         {
             
             if([strSelectedStatus isEqualToString:@"Cancelled"])
             {
                 Cancelled *cancelledObj = aArrStatus[firstindex];
                 strSelectedReason =cancelledObj.reason;
                 strSelectedReasonID=cancelledObj.reasonId;
                 
             }
             else if([strSelectedStatus isEqualToString:@"Missed"])
             {
                 Missed *missedObj = aArrStatus[firstindex];
                 strSelectedReason =missedObj.reason;
                 strSelectedReasonID=missedObj.reasonId;
             }
             
             
             txtFldReasonSelected.text = strSelectedReason;
             
             if(firstindex==[aArrStatus count]-1)
             {
                 // For other status
                 txtFldReason.hidden = FALSE;
                 
                 [self setAcceptRect:CGRectMake(btnAccept.frame.origin.x, txtFldReason.frame.origin.y+txtFldReason.frame.size.height+12,btnAccept.frame.size.width,btnAccept.frame.size.height)];
             }
             else
             {
                 // For other then "other" status
                 txtFldReason.hidden = TRUE;
                 
                 [self setAcceptRect:CGRectMake(btnAccept.frame.origin.x, vwSelectReason.frame.origin.y+vwSelectReason.frame.size.height+12,btnAccept.frame.size.width,btnAccept.frame.size.height)];
                 
             }
             
         }
         
     } withPickerArray:aArrStatus withPickerSecondArray:nil count:1 withTitle:nil];
    
    [txtFldReasonSelected becomeFirstResponder];
    
    
    
}
-(void)processOrderToAccept
{
    NSString *aStrUrl;
    NSMutableDictionary *aDictParams;
    
    // For Orders updation
    aStrUrl = [NSString stringWithFormat:@"%@/%@",FMS_WSURL,@"loads/update_order_details"];
    
    if([strSelectedStatus isEqualToString:@"Delivered"])
    {
        // Navigate to delivered screen
        
        UIStoryboard *aStoryBoardObj = [UIStoryboard storyboardWithName:FMS_StoryboardSecondary bundle:nil];
        FMS_DeliveredLoadsVC * FMS_DeliveredLoadsVCObj = [aStoryBoardObj instantiateViewControllerWithIdentifier:@"FMS_DeliveredLoadsVC"];
        FMS_DeliveredLoadsVCObj.FMS_LoadDetailObj = FMS_LoadDetailObj;
        FMS_DeliveredLoadsVCObj.showRightButtons = self.showRightButtons;
        FMS_DeliveredLoadsVCObj.strOrderID = strLoadId;
        FMS_DeliveredLoadsVCObj.isForPickup = FALSE;
        [self.navigationController pushViewController:FMS_DeliveredLoadsVCObj animated:TRUE];
        
        return;
    }
    else if([strSelectedStatus isEqualToString:@"Arrived"] || [strSelectedStatus isEqualToString:@"Arrived to deliver"])
    {
        aDictParams = [[NSMutableDictionary alloc] initWithObjectsAndKeys:[UserDefaults objectForKey:FMS_LoginUserToken],@"token",[UserDefaults objectForKey:FMS_LoginUserType],@"role",strLoadId,@"order_id",strSelectedStatus,@"order_status",[UserDefaults objectForKey:FMS_Latitude],@"latitude",[UserDefaults objectForKey:FMS_Longitude],@"longitude", nil];
    }
    else if([strSelectedStatus isEqualToString:@"Picked up"])
    {
        if([FMS_LoadDetailObj.pickupImgRequired boolValue])
        {
            UIStoryboard *aStoryBoardObj = [UIStoryboard storyboardWithName:FMS_StoryboardSecondary bundle:nil];
            FMS_DeliveredLoadsVC * FMS_DeliveredLoadsVCObj = [aStoryBoardObj instantiateViewControllerWithIdentifier:@"FMS_DeliveredLoadsVC"];
            FMS_DeliveredLoadsVCObj.FMS_LoadDetailObj = FMS_LoadDetailObj;
            FMS_DeliveredLoadsVCObj.showRightButtons = self.showRightButtons;
            FMS_DeliveredLoadsVCObj.strOrderID = strLoadId;
            FMS_DeliveredLoadsVCObj.isForPickup = TRUE;
            [self.navigationController pushViewController:FMS_DeliveredLoadsVCObj animated:TRUE];
            return;

        }
        else
        {
             aDictParams = [[NSMutableDictionary alloc] initWithObjectsAndKeys:[UserDefaults objectForKey:FMS_LoginUserToken],@"token",[UserDefaults objectForKey:FMS_LoginUserType],@"role",strLoadId,@"order_id",strSelectedStatus,@"order_status",[UserDefaults objectForKey:FMS_Latitude],@"latitude",[UserDefaults objectForKey:FMS_Longitude],@"longitude", nil];
        }

    }
    else
    {
        
        if([strSelectedReason stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].length==0)
        {
            [FMS_Utility showAlert:@"Please select reason."];
            return;
            
        }
        else
        {
            if([strSelectedReason isEqualToString:@"Other"])
            {
                if([txtFldReason.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].length==0)
                {
                    [FMS_Utility showAlert:@"Please enter your reason."];
                    return;
                }
                else
                {
                    aDictParams = [[NSMutableDictionary alloc] initWithObjectsAndKeys:[UserDefaults objectForKey:FMS_LoginUserToken],@"token",[UserDefaults objectForKey:FMS_LoginUserType],@"role",strLoadId,@"order_id",strSelectedStatus,@"order_status",txtFldReason.text,@"other_reason", nil];
                }
            }
            else
            {
                aDictParams = [[NSMutableDictionary alloc] initWithObjectsAndKeys:[UserDefaults objectForKey:FMS_LoginUserToken],@"token",[UserDefaults objectForKey:FMS_LoginUserType],@"role",strLoadId,@"order_id",strSelectedStatus,@"order_status",strSelectedReasonID,@"reason_id", nil];
            }
        }
        
    }
    
    
    
    Webservice *WebserviceObj = [[Webservice alloc] init];
    [WebserviceObj callWebserviceToUploadImageWithURL:aStrUrl withSilentCall:FALSE withParams:aDictParams forViewController:self withCompletionBlock:^(NSDictionary *responseData)
     {
         
         if([responseData[@"status"] intValue]==1)
         {
             [[FMS_Utility sharedFMSUtility] showAlertWithTarget:self WithMessage:responseData[@"message"] withCancelButton:@"Ok" WithCompletionBlock:^(int index)
              {
                  [self.navigationController popViewControllerAnimated:TRUE];
                  
              } withOtherButtons:nil];
         }
         else
         {
             [FMS_Utility showAlert:responseData[@"message"]];
         }
         
     } withFailureBlock:^(NSError *error) {
         
     }];
    
}
-(void)processLoadToAccept
{

    // For load accept
    
    NSString *aStrQty = txtFldQuantity.text;
    
    if([[aStrQty stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length]==0)
    {
        [FMS_Utility showAlert:@"Enter quantity to accept the order."];
        return;
    }
    else
    {
        if([txtFldQuantity.text intValue]<=0)
        {
            [FMS_Utility showAlert:@"Minimum quantity required to accept order is 1."];
            
            return;
        }
        else if([txtFldQuantity.text intValue]>[FMS_LoadDetailObj.availableLoads intValue])
        {
            [FMS_Utility showAlert:[NSString stringWithFormat:@"Sorry ! you can accept maximum %@ loads.",FMS_LoadDetailObj.availableLoads]];
            
            return;
        }
    }
    
    if(![FMS_Utility isLoginFromDriver])
    {
      if(!txtfld_DriverName.text.length>0)
      {
          [FMS_Utility showAlert:@"Please select driver to whom this load will be assigned."];
          
          return;
      }
        
    }
    
    
    
    [[FMS_Utility sharedFMSUtility] showAlertWithTarget:self WithMessage:@"Are you sure you want to accept?" withCancelButton:@"Yes" WithCompletionBlock:^(int index)
     {
         
         if(index==0)
         {
             NSMutableDictionary*aDictParams;
             if([FMS_Utility isLoginFromDriver])
             {
                 aDictParams = [[NSMutableDictionary alloc] initWithObjectsAndKeys:[UserDefaults objectForKey:FMS_LoginUserToken],@"token",[UserDefaults objectForKey:FMS_LoginUserType],@"role",strLoadId,@"load_id",txtFldQuantity.text,@"load_qty", nil];
             }
             else
             {
                 aDictParams = [[NSMutableDictionary alloc] initWithObjectsAndKeys:[UserDefaults objectForKey:FMS_LoginUserToken],@"token",[UserDefaults objectForKey:FMS_LoginUserType],@"role",strLoadId,@"load_id",txtFldQuantity.text,@"load_qty",strDriverID,@"driver_id", nil];
             }
             
             
             
             NSString*aStrUrl = [NSString stringWithFormat:@"%@/%@",FMS_WSURL,@"loads/accept_load"];
             
             
             Webservice *WebserviceObj = [[Webservice alloc] init];
             [WebserviceObj callWebserviceWithURL:aStrUrl withSilentCall:FALSE  withParams:aDictParams forViewController:self withCompletionBlock:^(NSDictionary *responseData)
              {
                  
                  if([responseData[@"status"] intValue]==1)
                  {
                      [[FMS_Utility sharedFMSUtility] showAlertWithTarget:self WithMessage:responseData[@"message"] withCancelButton:@"Ok" WithCompletionBlock:^(int index)
                       {
                           [self.navigationController popViewControllerAnimated:TRUE];
                           
                       } withOtherButtons:nil];
                      
                  }
                  else
                  {
                      [[FMS_Utility sharedFMSUtility] showAlertWithTarget:self WithMessage:responseData[@"message"] withCancelButton:@"Ok" WithCompletionBlock:^(int index)
                       {
                           if([FMS_Utility isLoginFromDriver])
                           [self.navigationController popViewControllerAnimated:TRUE];
                           
                       } withOtherButtons:nil];
                  }
                  
                  
              }
                                 withFailureBlock:^(NSError *error)
              {
                  
              }];
             
         }
         
         
     } withOtherButtons:@[@"No"]];

}
- (IBAction)btnAcceptClicked:(UIButton *)sender
{
    [txtFldQuantity resignFirstResponder];
    [txtFldReason resignFirstResponder];
    [txtFldReasonSelected resignFirstResponder];
    [txtFldStatus resignFirstResponder];
    
    if(isLoadDetail)
    {
        [self processLoadToAccept];
    }
    else
    {
        // If status selected is arrived then checkf for location services before accepting order.
        if([strSelectedStatus isEqualToString:@"Arrived"] || [strSelectedStatus isEqualToString:@"Picked up"])
        {
            BOOL locationAllowed = [CLLocationManager locationServicesEnabled];
            if (!locationAllowed)
            {
                [FMS_Utility showAlert:@"Plase turn on Location service from settings."];
                return;
            }
            else
            {
                if([CLLocationManager authorizationStatus]==kCLAuthorizationStatusDenied)
                {
                    [FMS_Utility showAlert:@"Plase turn on Location service for MB Loads from settings."];
                    return;
                }
            }
        }
        
        [self processOrderToAccept];
        
    }
}
#pragma mark ViewTouch
#pragma mark OtherMethods
-(void)callWSForArrived
{
    NSString*aStrUrl = [NSString stringWithFormat:@"%@/%@",FMS_WSURL,@"loads/verify_arrival"];
    
    NSMutableDictionary* aDictParams = [[NSMutableDictionary alloc] initWithObjectsAndKeys:[UserDefaults objectForKey:FMS_LoginUserToken],@"token",[UserDefaults objectForKey:FMS_LoginUserType],@"role",strLoadId,@"order_id",[UserDefaults objectForKey:FMS_Latitude],@"latitude",[UserDefaults objectForKey:FMS_Longitude],@"longitude", nil];
    
    Webservice *WebserviceObj = [[Webservice alloc] init];
    
    [WebserviceObj callWebserviceToUploadImageWithURL:aStrUrl withSilentCall:FALSE withParams:aDictParams forViewController:self withCompletionBlock:^(NSDictionary *responseData)
     {
         
         if([responseData[@"status"] intValue]==1)
         {
             [[FMS_Utility sharedFMSUtility] showAlertWithTarget:self WithMessage:responseData[@"message"] withCancelButton:@"Ok" WithCompletionBlock:^(int index)
              {
                  
                  if([responseData[@"data"][0] count]>0)
                  {
                      FMS_LoadDetailObj = [[FMS_LoadDetail alloc] initWithDictionary:responseData[@"data"][0]];
                      [self setLayout];
                  }
                  

              } withOtherButtons:nil];
         }
         else
         {
             [FMS_Utility showAlert:responseData[@"message"]];
         }
         
     } withFailureBlock:^(NSError *error) {
         
     }];

}
-(void)setLayout
{
    btnAccept.hidden = TRUE;
    
    //    [UIView animateWithDuration:0.2 animations:^{
    
    
    if([FMS_LoadDetailObj.noNeedOlNumber boolValue] || isLoadDetail)
    {
        vwOLNumber.hidden = YES;
        vwAllInfo.frame = CGRectMake(vwAllInfo.frame.origin.x,vwOLNumber.frame.origin.y,vwAllInfo.frame.size.width,vwAllInfo.frame.size.height+vwOLNumber.frame.size.height);
    }
    else
    {
        vwOLNumber.hidden = NO;
    }
    
    
    if([FMS_LoadDetailObj.orderStatus isEqualToString:@"Assigned"] || [FMS_LoadDetailObj.orderStatus isEqualToString:@"Picked up"] || [FMS_LoadDetailObj.orderStatus isEqualToString:@"Arrived"])
    {
        lblFromCity.text = FMS_LoadDetailObj.fromLocation;
        lblToCity.text = FMS_LoadDetailObj.toLocation;
    }
    else
    {
        lblFromCity.text = FMS_LoadDetailObj.fromCity;
        lblToCity.text = FMS_LoadDetailObj.toCity;
    }

    
    
    // Set city label with dynamic height
    float aFloatFromCity =  [self getHeightForControl:lblFromCity forString:lblFromCity.text];
    float aFloatToCity =  [self getHeightForControl:lblToCity forString:lblToCity.text];
    
    //float aFloatSingleRow =  [self getHeightForControl:lblFromCity forString:@"SAMPLE,"];
    float aFloatSingleRow =  30.0;

    float aFloatTempCityHeight = aFloatFromCity>aFloatToCity ? aFloatFromCity : aFloatToCity;
    aFloatTempCityHeight = aFloatTempCityHeight<aFloatSingleRow ? aFloatSingleRow:aFloatTempCityHeight;
    
    lblFromCity.frame = CGRectMake(lblFromCity.frame.origin.x,lblFromCity.frame.origin.y,lblFromCity.frame.size.width,aFloatTempCityHeight);
    lblToCity.frame = CGRectMake(lblToCity.frame.origin.x,lblToCity.frame.origin.y,lblToCity.frame.size.width,aFloatTempCityHeight);
    
    
    //Set DirectionArrow

    float aFloatSpace = lblToCity.frame.origin.x - (lblFromCity.frame.origin.x+lblFromCity.frame.size.width);
    imgVWArrow.center = CGPointMake((lblFromCity.frame.origin.x+lblFromCity.frame.size.width)+aFloatSpace/2,15+lblFromCity.frame.origin.y);
    
    
    //Set address lables with dynamic height
    
    float aFloatYPos = lblFromCity.frame.origin.y+aFloatTempCityHeight+10;
    
    
    float aFloatFromAdd =  [self getHeightForControl:lblFromAddress forString:FMS_LoadDetailObj.fromAddress];
    float aFloatToAdd =  [self getHeightForControl:lblToAddress forString:FMS_LoadDetailObj.toAddress];
    
    lblFromAddress.frame = CGRectMake(lblFromAddress.frame.origin.x,aFloatYPos,lblFromAddress.frame.size.width,aFloatFromAdd);
    lblToAddress.frame = CGRectMake(lblToAddress.frame.origin.x,aFloatYPos,lblToAddress.frame.size.width,aFloatToAdd);
    
    
    
    float aFloatTempAddHeight = aFloatFromAdd>aFloatToAdd ? aFloatFromAdd : aFloatToAdd;
    
    vwLocation.frame = CGRectMake(vwLocation.frame.origin.x,vwLocation.frame.origin.y,vwLocation.frame.size.width,lblToAddress.frame.origin.y+aFloatTempAddHeight+10);
    
    
    
    
    
    // Set container view frame based on dynamic height of upper lables
    vwContainer.frame = CGRectMake(vwContainer.frame.origin.x,vwLocation.frame.origin.y+vwLocation.frame.size.height,vwContainer.frame.size.width,vwContainer.frame.size.height);
    
    
    // Set all info view's frame based on all views
    vwAllInfo.frame = CGRectMake(vwAllInfo.frame.origin.x,vwAllInfo.frame.origin.y,vwAllInfo.frame.size.width,vwContainer.frame.size.height+vwContainer.frame.origin.y);
    
    
    // Set contentsize accordingly
    scrVWContent.contentSize = CGSizeMake(self.view.frame.size.width,vwAllInfo.frame.origin.y+vwAllInfo.frame.size.height+50);
    
    
    
    // Set accept button frame
    if(isLoadDetail)
    {
        //For load detail
        
        txtFldQuantity.hidden = NO;
        btnAccept.hidden = FALSE;
        
        
        if(![FMS_Utility isLoginFromDriver])
        {
            // For contracor show option to select driver.
            vwSelectDriver.hidden = NO;
            btnAccept.frame = CGRectMake(btnAccept.frame.origin.x, vwSelectDriver.frame.origin.y+vwSelectDriver.frame.size.height+12,btnAccept.frame.size.width,btnAccept.frame.size.height);
        }
        else
        {
            vwSelectDriver.hidden = YES;
            btnAccept.frame = CGRectMake(btnAccept.frame.origin.x, txtFldQuantity.frame.origin.y+txtFldQuantity.frame.size.height+30,btnAccept.frame.size.width,btnAccept.frame.size.height);
        }
       
        
        [btnAccept setTitle:@"Accept" forState:UIControlStateNormal];
        
    }
    else
    {
        
        txtFldQuantity.hidden = YES;
        
        [btnAccept setTitle:@"Save" forState:UIControlStateNormal];
        
        if(![FMS_LoadDetailObj.orderStatus isEqualToString:@"Delivered"] && ![FMS_LoadDetailObj.orderStatus isEqualToString:@"Missed"])
        {
            vwOrderStatus.hidden  =  NO;
        }
        
    }
    
    //Set data in lables
    
    lblFromAddress.text = FMS_LoadDetailObj.fromAddress;
    lblToAddress.text = FMS_LoadDetailObj.toAddress;
    
    if([[FMS_Utility sharedFMSUtility] checkForViewRatePermission])
    {
        lblRate.text=FMS_LoadDetailObj.rate;
    }
    else
    {
        lblRate.text=@"   -";
    }
    
    
    lblTimeWindow.text=FMS_LoadDetailObj.timeWindow;
    lblUnits.text=FMS_LoadDetailObj.units;
    lblPostedTime.text=FMS_LoadDetailObj.postedTime;
    lblPickupDate.text=FMS_LoadDetailObj.pickupDateNTime;
    lblOLNum.text=FMS_LoadDetailObj.olNumber;
    lblLoads.text= isLoadDetail? FMS_LoadDetailObj.availableLoads : @"1";
    lblMiles.text=FMS_LoadDetailObj.miles;

//    lblCommodity.text=FMS_LoadDetailObj.commodity;
    
    txtFldQuantity.placeholder = [NSString stringWithFormat:@"%@ (Max %@)",txtFldQuantity.placeholder,FMS_LoadDetailObj.availableLoads];
}
-(void)callDetailWS
{
    //aIntval is 0 then load detail or order detail
    //token,role, load_id
    
    NSString *aStrParamName;
    aStrParamName= isLoadDetail? @"load_id":@"order_id";
    
    
    NSDictionary *aDictObj = [[NSDictionary alloc] initWithObjectsAndKeys:[UserDefaults objectForKey:FMS_LoginUserToken],@"token",[UserDefaults objectForKey:FMS_LoginUserType],@"role",strLoadId,aStrParamName, nil];
    
    
    Webservice *WebserviceObj = [[Webservice alloc] init];
    [WebserviceObj callWebserviceWithURL:[NSString stringWithFormat:@"%@/loads/%@",FMS_WSURL,isLoadDetail? @"load_details":@"order_details"] withSilentCall:FALSE  withParams:aDictObj forViewController:self withCompletionBlock:^(NSDictionary *responseData)
     {
         
         
         if([responseData[@"status"] intValue]==1)
         {
             [[FMS_Utility sharedFMSUtility] updateUserPermission:responseData];
             
             if([responseData[@"data"][0] count]>0)
             {
                 FMS_LoadDetailObj = [[FMS_LoadDetail alloc] initWithDictionary:responseData[@"data"][0]];
                 [self setLayout];
             }
             else
             {
                 [[FMS_Utility sharedFMSUtility] showAlertWithTarget:self WithMessage:responseData[@"message"] withCancelButton:@"Ok" WithCompletionBlock:^(int index)
                  {
                      [self.navigationController popViewControllerAnimated:TRUE];
                      
                  } withOtherButtons:nil];
             }
             
         }
         else
         {
             [[FMS_Utility sharedFMSUtility] showAlertWithTarget:self WithMessage:responseData[@"message"] withCancelButton:@"Ok" WithCompletionBlock:^(int index)
              {
                  [self.navigationController popViewControllerAnimated:TRUE];
                  
              } withOtherButtons:nil];
         }
         
         
     }
     withFailureBlock:^(NSError *error)
     {
         
     }];
    
    
}
-(float)getHeightForControl:(UILabel*)lblRef forString:(NSString*)aStr
{
    CGRect textRect = [aStr boundingRectWithSize:CGSizeMake(lblRef.frame.size.width, 100.0)
                                         options:NSStringDrawingUsesLineFragmentOrigin
                                      attributes:@{NSFontAttributeName:lblRef.font}
                                         context:nil];
    
    
    NSLog(@"getHeightForControl==%@,%f",aStr,textRect.size.height);
    
    return textRect.size.height;
}
/*
 
 CGRect textRect = [self boundingRectWithSize:CGSizeMake(width, MAXFLOAT)
 options:NSStringDrawingUsesLineFragmentOrigin
 attributes:@{NSFontAttributeName:font}
 context:nil];
 textRect.size.height = textRect.size.height+(textRect.size.height/4);
 */
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */


-(void)setAcceptRect:(CGRect)aRectVal
{
    [UIView animateWithDuration:0.2 animations:^{
        
        btnAccept.frame = aRectVal;
        
    } completion:^(BOOL finished) {
        
    }];
}
@end
