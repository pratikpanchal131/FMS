//
//  FMS_Filter.m
//  FMS
//
//  Created by indianic on 11/08/15.
//  Copyright (c) 2015 indianic. All rights reserved.
//

#import "FMS_Filter.h"
#import "MonthPicker.h"

#pragma clang diagnostic ignored "-Wobjc-protocol-method-implementation"
//@implementation UITextField(UITextFieldCategory)
//
//
//- (CGRect)textRectForBounds:(CGRect)bounds{
//    return CGRectInset( bounds, 10 , 0);
//}
//- (CGRect)editingRectForBounds:(CGRect)bounds{
//    return CGRectInset( bounds, 10 , 0);
//}
////- (CGRect)caretRectForPosition:(UITextPosition *)position
////{
////    return CGRectZero;
////}
//@end

@interface FMS_Filter ()

@end

@implementation FMS_Filter

@synthesize viewObj;
@synthesize doneFilterBlock;
@synthesize dictTextFieldData;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    /*
     ViewWhole = 1,
     ViewMonth = 2,
     ViewDate = 3,
     ViewCommodity = 4,
     ViewDriver = 5,
     Date_Loc_Comm = 9,
     Month_Location_Comm_Dri = 13,
     Month_Driver = 6
     Single_Month = 10
     */
 
    switch (viewObj) {
        case 1:
            // View Whole
        {
            [viewLocation setHidden:NO];
            [viewDate setHidden:NO];
            [viewCommodity setHidden:NO];
            [viewDriver setHidden:NO];
        }
            break;
        case 2:
            // ViewMonth
        {
            [viewDate setHidden:NO];
            lblDateMonthText.text = @"Filter by Month";
            [txtDateFrom setPlaceholder:@"Select Month"];
            [txtDateTO setPlaceholder:@"Select Month"];
            
            [viewDate setFrame:CGRectMake(viewDate.frame.origin.x, lblTitle.frame.size.height, viewDate.frame.size.width, viewDate.frame.size.height)];
            [btnSeperator setFrame:CGRectMake(0, lblTitle.frame.size.height+viewDate.frame.size.height+10, btnSeperator.frame.size.width, btnSeperator.frame.size.height)];
        }
            break;
        case 3:
            // ViewDate
        {
            [viewDate setHidden:NO];
            lblDateMonthText.text = @"Filter by Date";
            [viewDate setFrame:CGRectMake(viewDate.frame.origin.x, lblTitle.frame.size.height, viewDate.frame.size.width, viewDate.frame.size.height)];
            [btnSeperator setFrame:CGRectMake(0, lblTitle.frame.size.height+viewDate.frame.size.height+10, btnSeperator.frame.size.width, btnSeperator.frame.size.height)];
        }
            break;
        case 4:
            //ViewComm
        {
            [viewCommodity setHidden:NO];
            [viewCommodity setFrame:CGRectMake(viewCommodity.frame.origin.x, lblTitle.frame.size.height, viewCommodity.frame.size.width, viewCommodity.frame.size.height)];
            [btnSeperator setFrame:CGRectMake(0, lblTitle.frame.size.height+viewCommodity.frame.size.height+10, btnSeperator.frame.size.width, btnSeperator.frame.size.height)];
        }
            break;
        case 5:
            //ViewDriver
        {
            [viewDriver setHidden:NO];
            [viewDriver setFrame:CGRectMake(viewDriver.frame.origin.x, lblTitle.frame.size.height, viewDriver.frame.size.width, viewDriver.frame.size.height)];
            [btnSeperator setFrame:CGRectMake(0, lblTitle.frame.size.height+viewDriver.frame.size.height+10, btnSeperator.frame.size.width, btnSeperator.frame.size.height)];
        }
            break;
        case 9:
            //Date_Loc_Comm
        {
            [viewLocation setHidden:NO];
            [viewDate setHidden:NO];
            [viewCommodity setHidden:NO];
            
            [viewLocation setFrame:CGRectMake(viewLocation.frame.origin.x, lblTitle.frame.size.height, viewLocation.frame.size.width, viewLocation.frame.size.height)];
            [viewDate setFrame:CGRectMake(viewDate.frame.origin.x, viewLocation.frame.origin.y+viewLocation.frame.size.height, viewDate.frame.size.width, viewDate.frame.size.height)];
            [viewCommodity setFrame:CGRectMake(viewCommodity.frame.origin.x,viewDate.frame.origin.y+viewDate.frame.size.height, viewCommodity.frame.size.width, viewCommodity.frame.size.height)];
            
            [btnSeperator setFrame:CGRectMake(0, viewCommodity.frame.origin.y+viewCommodity.frame.size.height+10, btnSeperator.frame.size.width, btnSeperator.frame.size.height)];
            
        }
            break;
        case 13:
            //Month_Location_Comm_Dri
        {
            
            [viewLocation setHidden:NO];
            [viewDate setHidden:NO];
            [viewCommodity setHidden:NO];
            [viewDriver setHidden:NO];
            
            lblDateMonthText.text = @"Filter by Month";
            [txtDateFrom setPlaceholder:@"Select Month"];
            [txtDateTO setPlaceholder:@"Select Month"];

            
            [viewLocation setFrame:CGRectMake(viewLocation.frame.origin.x, lblTitle.frame.size.height, viewLocation.frame.size.width, viewLocation.frame.size.height)];
            [viewDate setFrame:CGRectMake(viewDate.frame.origin.x, viewLocation.frame.origin.y+viewLocation.frame.size.height, viewDate.frame.size.width, viewDate.frame.size.height)];
            [viewCommodity setFrame:CGRectMake(viewCommodity.frame.origin.x,viewDate.frame.origin.y+viewDate.frame.size.height, viewCommodity.frame.size.width, viewCommodity.frame.size.height)];
            [viewDriver setFrame:CGRectMake(viewDriver.frame.origin.x,viewCommodity.frame.origin.y+viewCommodity.frame.size.height , viewDriver.frame.size.width, viewDriver.frame.size.height)];
            
            [btnSeperator setFrame:CGRectMake(0, viewDriver.frame.origin.y+viewDriver.frame.size.height+10, btnSeperator.frame.size.width, btnSeperator.frame.size.height)];
        }
            break;
        case 6:
            //Month_Driver
        {
            [viewDate setHidden:NO];
            [viewDriver setHidden:NO];
            
            lblDateMonthText.text = @"Filter by Month";
            [txtDateFrom setPlaceholder:@"Select Month"];
            [txtDateTO setPlaceholder:@"Select Month"];

            
            [viewDate setFrame:CGRectMake(viewDate.frame.origin.x, lblTitle.frame.size.height, viewDate.frame.size.width, viewDate.frame.size.height)];
            [viewDriver setFrame:CGRectMake(viewDriver.frame.origin.x,viewDate.frame.origin.y+viewDate.frame.size.height , viewDriver.frame.size.width, viewDriver.frame.size.height)];
            
            [btnSeperator setFrame:CGRectMake(0, viewDriver.frame.origin.y+viewDriver.frame.size.height+10, btnSeperator.frame.size.width, btnSeperator.frame.size.height)];
        }
            break;
        case 7:
            // Location date
        {
            [viewDate setHidden:NO];
            [viewLocation setHidden:NO];
            
            [viewLocation setFrame:CGRectMake(viewLocation.frame.origin.x, lblTitle.frame.size.height, viewLocation.frame.size.width, viewLocation.frame.size.height)];
            [viewDate setFrame:CGRectMake(viewDate.frame.origin.x,viewLocation.frame.origin.y+viewLocation.frame.size.height , viewDate.frame.size.width, viewDate.frame.size.height)];
            
            [btnSeperator setFrame:CGRectMake(0, viewDate.frame.origin.y+viewDate.frame.size.height+10, btnSeperator.frame.size.width, btnSeperator.frame.size.height)];
        }
            break;
        case 8:
            // Date Driver
        {
            [viewDate setHidden:NO];
            [viewDriver setHidden:NO];
            
            [viewDate setFrame:CGRectMake(viewDate.frame.origin.x, lblTitle.frame.size.height, viewDate.frame.size.width, viewDate.frame.size.height)];
            [viewDriver setFrame:CGRectMake(viewDriver.frame.origin.x,viewDate.frame.origin.y+viewDate.frame.size.height , viewDriver.frame.size.width, viewDriver.frame.size.height)];
            
            [btnSeperator setFrame:CGRectMake(0, viewDriver.frame.origin.y+viewDriver.frame.size.height+10, btnSeperator.frame.size.width, btnSeperator.frame.size.height)];
        }
            break;
            case 10:
        {
            [viewDate setHidden:NO];
            lblDateMonthText.text = @"Filter by Month";
            [txtDateFrom setPlaceholder:@"Select Month"];

            /*
            3000 imageview : 10, 30, 300, 35
            3001 Text field : 12, 30, 275, 35
            1000 button : 10, 30 , 302, 35
            1001 arrow : 295, 45, 9, 5
            
            image view 9000
            text 9001
            arrow image   9002
            to label 9003
            buttn 2000
            */
            
            UIImageView *imgView = (UIImageView *)[self.view viewWithTag:3000];
            [imgView setFrame:CGRectMake(10, 30, 300, 35)];
            
            UITextField *txtField = (UITextField *)[self.view viewWithTag:3001];
            [txtField setFrame:CGRectMake(12, 30, 275, 35)];
            
            UIButton *btn = (UIButton *)[self.view viewWithTag:1000];
            [btn setFrame:CGRectMake(10, 30, 302, 35)];
            
            UIImageView *imgViewArrow = (UIImageView *)[self.view viewWithTag:1001];
            [imgViewArrow setFrame:CGRectMake(295, 45, 9, 5)];
            
            UIImageView *imgViewhd = (UIImageView *)[self.view viewWithTag:9000]; [imgViewhd setHidden:YES];
            UITextField *txtFieldhd = (UITextField *)[self.view viewWithTag:9001]; [txtFieldhd setHidden:YES];
            UIButton *btnhd = (UIButton *)[self.view viewWithTag:2000]; [btnhd setHidden:YES];
            UIImageView *imgViewArrowhd = (UIImageView *)[self.view viewWithTag:9002]; [imgViewArrowhd setHidden:YES];
            UILabel *lblTo = (UILabel *) [self.view viewWithTag:9003]; [lblTo setHidden:YES];
            
            
            [viewDate setFrame:CGRectMake(viewDate.frame.origin.x, lblTitle.frame.size.height, viewDate.frame.size.width, viewDate.frame.size.height)];
            [btnSeperator setFrame:CGRectMake(0, lblTitle.frame.size.height+viewDate.frame.size.height+10, btnSeperator.frame.size.width, btnSeperator.frame.size.height)];
        }
            break;
        default:
            break;
    }
    [viewAll setFrame:CGRectMake(0,viewAll.frame.origin.y, viewAll.frame.size.width, btnSeperator.frame.origin.y+btnSeperator.frame.size.height)];
    

}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    if (dictTextFieldData.count == 0)
    {
        dictTextFieldData = [NSMutableDictionary dictionary];
    
    
//    [self switchCaseForAutoFilledData];
        
    }else {
        
        NSArray *aArrLocation = [AppDelegate objSharedAppDel].filterBaseObj.data.location;
        NSArray *aArrCommodity = [AppDelegate objSharedAppDel].filterBaseObj.data.commodity;
        NSArray *aArrDriver = [AppDelegate objSharedAppDel].filterBaseObj.data.driver;
        
        
        NSPredicate *bPredicate = [NSPredicate predicateWithFormat:@"locationId = %@",dictTextFieldData[@"location_id_from"] ];
        NSArray *aArrTemp = [aArrLocation filteredArrayUsingPredicate:bPredicate];
        if(aArrTemp.count > 0)
        {
            Location *locFrm = aArrTemp[0];
            txtLocationFrom.text =  locFrm.locationName;
        }
        
        NSPredicate *bPredicate1 = [NSPredicate predicateWithFormat:@"locationId = %@",dictTextFieldData[@"location_id_to"] ];
        NSArray *aArrTemp1 = [aArrLocation filteredArrayUsingPredicate:bPredicate1];
        if(aArrTemp1.count > 0)
        {
            Location *locTo = aArrTemp1[0];
            txtLocationTO.text =  locTo.locationName;
        }
        
        NSPredicate *bPredicate3 = [NSPredicate predicateWithFormat:@"commodityId = %@",dictTextFieldData[@"commodity_id"] ];
        NSArray *aArrTemp3 = [aArrCommodity filteredArrayUsingPredicate:bPredicate3];
        if(aArrTemp3.count > 0)
        {
            Commodity *comm = aArrTemp3[0];
            txtCommodity.text =  comm.commodityName;
        }
        NSPredicate *bPredicate4 = [NSPredicate predicateWithFormat:@"driverId = %@",dictTextFieldData[@"driver_id"] ];
        NSArray *aArrTemp4 = [aArrDriver filteredArrayUsingPredicate:bPredicate4];
        if(aArrTemp4.count > 0)
        {
            Driver *driver = aArrTemp4[0];
            txtDriver.text =  driver.driverId;
        }
   
        if (dictTextFieldData[@"date_from"] || dictTextFieldData[@"date_to"]) {
            // 13 Aug, 15
            // 2015-08-14
            
            txtDateFrom.text = [FMS_Utility formatStringTODateTOString:dictTextFieldData[@"date_from"]];
            txtDateTO.text = [FMS_Utility formatStringTODateTOString:dictTextFieldData[@"date_to"]];
        }else if (dictTextFieldData[@"MonthFrom"] || dictTextFieldData[@"MonthTo"]) {
            txtDateFrom.text = dictTextFieldData[@"MonthFrom"];
            txtDateTO.text = dictTextFieldData[@"MonthTo"];
        }
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)switchCaseForAutoFilledData{
    switch (viewObj) {
        case 1:
            // whole
            [self filledAutoDate];
            break;
        case 2:
            // ViewMonth
            [self filledAutoMonth];
            break;
        case 3:
            // ViewDate
            [self filledAutoDate];
            break;
        case 9:
            //Date_Loc_Comm
            [self filledAutoDate];
            break;
        case 13:
            //Month_Location_Comm_Dri
            [self filledAutoMonth];
            break;
        case 6:
            //Month_Driver
            [self filledAutoMonth];
            break;
        case 7:
            // Location date
            [self filledAutoDate];

            break;
        case 8:
            // Date Driver
            [self filledAutoDate];
            break;
      
        case 10:
            // Single Month
            [self filledAutoMonth];

            break;
        default:
            break;
    }
    
}

-(void)filledAutoDate{
    // 13 Aug, 15
    // 2015-08-14
    
    [dictTextFieldData setObject:[FMS_Utility formatDateSendTOServer:[NSDate date]] forKey:@"date_from"];
    [dictTextFieldData setObject:[FMS_Utility formatDateSendTOServer:[NSDate date]] forKey:@"date_to"];
    
    
    txtDateFrom.text = [FMS_Utility formatStringTODateTOString:dictTextFieldData[@"date_from"]];
    txtDateTO.text = [FMS_Utility formatStringTODateTOString:dictTextFieldData[@"date_to"]];


}

-(void)filledAutoMonth{

//    [FMS_Utility formatMonth:datePicker.date]
    
    [dictTextFieldData setObject:[FMS_Utility formatMonth:[NSDate date]] forKey:@"MonthFrom"];
    [dictTextFieldData setObject:[FMS_Utility formatMonth:[NSDate date]] forKey:@"MonthTo"];
    
    txtDateFrom.text = [FMS_Utility formatMonth:[NSDate date]];
    [dictTextFieldData setObject:txtDateFrom.text forKey:@"MonthFrom"];

    txtDateTO.text = [FMS_Utility formatMonth:[NSDate date]];
    [dictTextFieldData setObject:txtDateFrom.text forKey:@"MonthTo"];
    
}

- (IBAction)tapGestureClick:(UITapGestureRecognizer *)sender {
    UIButton *btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    btn.tag = 500;
    [self hideViewResponseRequired:FALSE];
}

- (IBAction)btnDoneClick:(UIButton *)sender {

    [self checkDataBeforeViewHide:sender];
    
}

-(void)checkDataBeforeViewHide:(UIButton *)sender
{
    if (sender.tag == 500) {
        
        switch (viewObj) {
            case 1:
            {    // whole
                [self compareLocationwithBlock:^{
                    [self compareDate];
                }];
            }
                break;
            case 2:
            {
                // ViewMonth
                //                [self compareLocationwithBlock:^{
                [self compareMonth];
                //                }];
            }
                break;
            case 3:
                // ViewDate
            {
                //                [self compareLocationwithBlock:^{
                [self compareDate];
                //                }];
            }
                break;
            case 9:
                //Date_Loc_Comm
            {
                [self compareLocationwithBlock:^{
                    [self compareDate];
                }];
            }
                break;
            case 13:
                //Month_Location_Comm_Dri
            {
                // ViewMonth
                [self compareLocationwithBlock:^{
                    [self compareMonth];
                }];
            }
                break;
            case 6:
                //Month_Driver
            {
                // ViewMonth
                //                [self compareLocationwithBlock:^{
                [self compareMonth];
                //                }];
            }
                break;
            case 7:
                // Location date
            {
                [self compareLocationwithBlock:^{
                    [self compareDate];
                }];
            }
                break;
            case 8:
                // Date Driver
            {
                //                [self compareLocationwithBlock:^{
                [self compareDate];
                //                }];
            }
                break;
                //
            case 10:
                [self hideViewResponseRequired:TRUE];
                
                break;
            default:
                [self hideViewResponseRequired:TRUE];
                break;
        }
        
    }else{
        
        txtLocationTO.text = @"";
        txtLocationFrom.text = @"";
        txtDriver.text = @"";
        txtCommodity.text = @"";
        txtDateTO.text = @"";
        txtDateFrom.text = @"";
        
        [dictTextFieldData removeAllObjects];
        
        //                [self switchCaseForAutoFilledData];
        
        
        
    }
    
}

-(void)compareMonth{
    
    
    if ([FMS_Utility checkIfIncomplete:txtDateFrom.text])
    {
        // Fill first
        if ([FMS_Utility checkIfIncomplete:txtDateTO.text])
        {
            NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
            formatter.dateFormat = @"MMMM yy";
            NSDate *monthForm  = [formatter dateFromString:txtDateFrom.text];
            NSDate *monthTo  = [formatter dateFromString:txtDateTO.text];
            
            NSDateComponents* components1 = [[NSCalendar currentCalendar] components:NSMonthCalendarUnit|NSYearCalendarUnit fromDate:monthForm];
            NSDateComponents* components2 = [[NSCalendar currentCalendar] components:NSMonthCalendarUnit|NSYearCalendarUnit fromDate:monthTo];
            if (components1.month > components2.month || components1.year > components2.year) {
                // wrong
                [FMS_Utility showAlert:MonthGT];
            } else {
                // right
                [self hideViewResponseRequired:TRUE];
            }

        }else{
            
            [FMS_Utility showAlert:EnterToMonth];
            
        }
    }else{
        // Fill second
        if ([FMS_Utility checkIfIncomplete:txtDateTO.text])
        {
            [FMS_Utility showAlert:EnterFromMonth];
            
        }else{
            [self hideViewResponseRequired:TRUE];
        }
    }
    


}

-(void)compareDate{
    
    
    if ([FMS_Utility checkIfIncomplete:txtDateFrom.text])
    {
        // Fill first
        if ([FMS_Utility checkIfIncomplete:txtDateTO.text])
        {
            NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
            formatter.dateFormat = @"dd MMM, yy";
            NSDate *dateFrom  = [formatter dateFromString:txtDateFrom.text];
            NSDate *dateTo  = [formatter dateFromString:txtDateTO.text];
            
            
            if ([dateFrom compare:dateTo] == NSOrderedAscending || [dateFrom compare:dateTo] == NSOrderedSame) {
                [self hideViewResponseRequired:TRUE];
                
            }else{
                [FMS_Utility showAlert:DateGT];
            }

        }else{
           
            [FMS_Utility showAlert:EnterToDate];

        }
    }else{
        // Fill second
        if ([FMS_Utility checkIfIncomplete:txtDateTO.text])
        {
            [FMS_Utility showAlert:EnterFromDate];

        }else{
            [self hideViewResponseRequired:TRUE];
        }
    }
    
  

}


-(void)compareLocationwithBlock:(void(^)(void))block
{
    BOOL isFilled = false;
            if ([FMS_Utility checkIfIncomplete:txtLocationFrom.text])
            {
                //isFilled  = true;
                if ([FMS_Utility checkIfIncomplete:txtLocationTO.text])
                {
                    block();
                }else
                {
                  // Alert for first
                    [FMS_Utility showAlert:LocationTO];
                }
            }
            else
            {
                if (isFilled)
                {
                    if ([FMS_Utility checkIfIncomplete:txtLocationTO.text])
                    {
                        block();
                    }
                }
                else
                {
                    if ([FMS_Utility checkIfIncomplete:txtLocationTO.text])
                    {
                        [FMS_Utility showAlert:LocationFrm];
                        
                    }else
                    {
                        block();
                    }
                }   
            }
    


}


-(void)hideViewResponseRequired:(BOOL)aBoolVal
{
    [UIView animateWithDuration:0.5 animations:^{
        self.view.frame = CGRectMake(self.view.frame.origin.x, -1000, self.view.frame.size.width,self.view.frame.size.height);
    } completion:^(BOOL finished) {
        [self.view removeFromSuperview];
    }];
    
    if(aBoolVal && doneFilterBlock)
    {
       doneFilterBlock(dictTextFieldData);
    }
   
}

- (IBAction)btnLocationFromTOClick:(UIButton *)sender {
    NSArray *aArrLocation = [AppDelegate objSharedAppDel].filterBaseObj.data.location;
    if (sender.tag == 100) {
        [[FMS_Utility sharedFMSUtility] addPicker:self onTextField:txtLocationFrom pickerType:@"Simple" withKey:@"location_name" withCompletionBlock:^(id picker, int buttonIndex, int firstindex, int secondindex) {
            [txtLocationFrom resignFirstResponder];
            if (buttonIndex == 1) {
                Location *locationObj = aArrLocation[firstindex];
                
                txtLocationFrom.text = locationObj.locationName;
                [dictTextFieldData setObject:locationObj.locationId forKey:@"location_id_from"];
            }
            
        } withPickerArray:aArrLocation withPickerSecondArray:nil count:1 withTitle:nil];
        
        [txtLocationFrom becomeFirstResponder];

    }else if (sender.tag == 200){
        [[FMS_Utility sharedFMSUtility] addPicker:self onTextField:txtLocationTO pickerType:@"Simple" withKey:@"location_name" withCompletionBlock:^(id picker, int buttonIndex, int firstindex, int secondindex) {
            [txtLocationTO resignFirstResponder];
            if (buttonIndex == 1) {
                
                Location *locationObj = aArrLocation[firstindex];
                
                txtLocationTO.text = locationObj.locationName;

                txtLocationTO.text = locationObj.locationName;
                [dictTextFieldData setObject:locationObj.locationId forKey:@"location_id_to"];

            }
            
        } withPickerArray:aArrLocation withPickerSecondArray:nil count:1 withTitle:nil];
        
        [txtLocationTO becomeFirstResponder];

        
       
        }
        
    }

- (IBAction)btnFromTODateClick:(UIButton *)sender {
    if ([lblDateMonthText.text isEqualToString:@"Filter by Month"]) {
        if (sender.tag == 1000) {
            [[FMS_Utility sharedFMSUtility] addPicker:self onTextField:txtDateFrom pickerType:@"Month" withKey:@"" withCompletionBlock:^(id picker, int buttonIndex, int firstindex, int secondindex) {
                [txtDateFrom resignFirstResponder];
                if (buttonIndex == 1) {
                    MonthPicker *datePicker = (MonthPicker*)picker;
                    txtDateFrom.text = [FMS_Utility formatMonth:datePicker.date];
                    [dictTextFieldData setObject:txtDateFrom.text forKey:@"MonthFrom"];
                    
                }
                
            } withPickerArray:nil withPickerSecondArray:nil count:0 withTitle:nil];
            
            [txtDateFrom becomeFirstResponder];
        }else if(sender.tag == 2000){
        
                [[FMS_Utility sharedFMSUtility] addPicker:self onTextField:txtDateTO pickerType:@"Month" withKey:@"" withCompletionBlock:^(id picker, int buttonIndex, int firstindex, int secondindex) {
                    [txtDateTO resignFirstResponder];
                    if (buttonIndex == 1) {
                        
                        MonthPicker *datePicker = (MonthPicker*)picker;
                        txtDateTO.text = [FMS_Utility formatMonth:datePicker.date];
                        [dictTextFieldData setObject:txtDateTO.text forKey:@"MonthTo"];
                        
                    }
                    
                } withPickerArray:nil withPickerSecondArray:nil count:0 withTitle:nil];
                
                [txtDateTO becomeFirstResponder];
            
        }
    }else{
        if (sender.tag == 1000) {
            [[FMS_Utility sharedFMSUtility] addPicker:self onTextField:txtDateFrom pickerType:@"Date" withKey:@""  withCompletionBlock:^(id picker, int buttonIndex, int firstindex, int secondindex) {
                [txtDateFrom resignFirstResponder];
                if (buttonIndex == 1) {
                    
                    UIDatePicker *datePicker = (UIDatePicker*)picker;
                    txtDateFrom.text = [FMS_Utility formatDateComingFromServer:datePicker.date];
                    [dictTextFieldData setObject:[FMS_Utility formatDateSendTOServer:datePicker.date] forKey:@"date_from"];
                    
                }
                
            } withPickerArray:nil withPickerSecondArray:nil count:0 withTitle:nil];
            
            [txtDateFrom becomeFirstResponder];
        }else if(sender.tag == 2000){
            {
                [[FMS_Utility sharedFMSUtility] addPicker:self onTextField:txtDateTO pickerType:@"Date" withKey:@"" withCompletionBlock:^(id picker, int buttonIndex, int firstindex, int secondindex) {
                    [txtDateTO resignFirstResponder];
                    if (buttonIndex == 1) {
                        
                        UIDatePicker *datePicker = (UIDatePicker*)picker;
                        txtDateTO.text = [FMS_Utility formatDateComingFromServer:datePicker.date];
                        [dictTextFieldData setObject:[FMS_Utility formatDateSendTOServer:datePicker.date] forKey:@"date_to"];
                        
                    }
                    
                } withPickerArray:nil withPickerSecondArray:nil count:0 withTitle:nil];
                
                [txtDateTO becomeFirstResponder];
            }
        }
    }
}

- (IBAction)btnCommodityClick:(UIButton *)sender {
    NSArray *aArrCommodity = [AppDelegate objSharedAppDel].filterBaseObj.data.commodity;
    
    [[FMS_Utility sharedFMSUtility] addPicker:self onTextField:txtCommodity pickerType:@"Simple" withKey:@"commodity_name" withCompletionBlock:^(id picker, int buttonIndex, int firstindex, int secondindex) {
        [txtCommodity resignFirstResponder];
        if (buttonIndex == 1) {
            Commodity *commObj = aArrCommodity[firstindex];
            
            txtCommodity.text = commObj.commodityName;
            [dictTextFieldData setObject:commObj.commodityId forKey:@"commodity_id"];

        }
        
    } withPickerArray:aArrCommodity withPickerSecondArray:nil count:1 withTitle:nil];
    
    [txtCommodity becomeFirstResponder];
}

- (IBAction)btnDriversClick:(UIButton *)sender {
    NSArray *aArrDriver = [AppDelegate objSharedAppDel].filterBaseObj.data.driver;

    [[FMS_Utility sharedFMSUtility] addPicker:self onTextField:txtDriver pickerType:@"Simple" withKey:@"driver_name" withCompletionBlock:^(id picker, int buttonIndex, int firstindex, int secondindex) {
        [txtDriver resignFirstResponder];
        if (buttonIndex == 1) {
                Driver *driverObj = aArrDriver[firstindex];
                
                txtCommodity.text = driverObj.driverName;
                txtDriver.text = driverObj.driverName;
                [dictTextFieldData setObject:driverObj.driverId forKey:@"driver_id"];
                
        }
        
    } withPickerArray:aArrDriver withPickerSecondArray:nil count:1 withTitle:nil];
    
    [txtDriver becomeFirstResponder];
}




@end
