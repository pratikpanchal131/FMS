//
//  FMS_RegisterVC.m
//  FMS
//
//  Created by indianic on 12/01/16.
//  Copyright © 2016 indianic. All rights reserved.
//

#import "FMS_RegisterVC.h"
#import "MultipleSelectionViewController.h"
#import "SingleSelectionViewController.h"


@interface FMS_RegisterVC ()
{
    NSMutableArray *mutArrDataTrailers;
    NSArray *arrAlternateTrailerTypeSelectedIndexes;
    NSString *indexAlternateTrailerType,*indexPrimaryTrailerType;
    NSNumber *PrimaryTrailerTypeSelectedIndex;

}
@end

@implementation FMS_RegisterVC

#pragma mark View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    mutArrDataTrailers = [[NSMutableArray alloc] init];
    [self setUI];

    isTextNotification = NO;
    isEmailNotification = NO;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
    
    [super viewWillAppear:animated];
    [self getAPICALL];

}

-(void)viewDidAppear:(BOOL)animated{
    
}

-(void)getAPICALL{
    
    
    Webservice *WebserviceObj = [[Webservice alloc] init];    
    [WebserviceObj callWebserviceWithGET:[NSString stringWithFormat:@"%@/users/trailers",FMS_WSURL] withSilentCall:NO withParams:NO forViewController:self withCompletionBlock:^(NSDictionary *responseData) {
        
        NSLog(@"Repons is %@",responseData);
        
        
        if([responseData[@"status"] intValue]==1)
        {
            for(NSDictionary*aDictObj in responseData[@"data"])
            {
                NSMutableDictionary *aMutDict = [[NSMutableDictionary alloc] init];
                [aMutDict setObject:aDictObj[@"name"] forKey:@"name"];
                [aMutDict setObject:aDictObj[@"id"] forKey:@"id"];
                
                
              
                [mutArrDataTrailers addObject:aMutDict];
            }
            NSLog(@"Array is %@",mutArrDataTrailers);
            [UserDefaults setObject:mutArrDataTrailers forKey:FMS_arrGetTrailerData];
            [UserDefaults synchronize];
            
        }
        else
        {
            [FMS_Utility showAlert:responseData[@"message"]];
        }
        
    } withFailureBlock:^(NSError *error) {
        
    }];
    

    

}



#pragma mark Events

- (IBAction)btnEditProfileImage:(UIButton *)sender {
    
    [[FMS_Utility sharedFMSUtility]openCamera:self isRoundCrop:YES withCompletionBlock:^(UIImage *img) {
        
        if (img != nil)
        {
            [imgViewProfile setImage:img];
            isProfilePicChange = YES;
        }
    }];
}

- (IBAction)btnRegister:(UIButton *)sender {
    
    [self registerUser];
}

- (IBAction)btnPusTextClicked:(UIButton *)sender {
    
    if (sender.selected) {
        //code here
        sender.selected=NO;
        isTextNotification = NO;
    }
    else{
        //code here
        sender.selected=YES;
        isTextNotification = YES;
    }
}

- (IBAction)btnPusEmailClicked:(UIButton *)sender {
    
    if (sender.selected) {
        //code here
        sender.selected=NO;
        isEmailNotification = NO;
    }
    else{
        //code here
        sender.selected=YES;
        isEmailNotification = YES;
    }
}



- (IBAction)btnPrimaryTrailerTypeClicked:(id)sender {
 
    
    
        SingleSelectionViewController *aVC = [self.storyboard instantiateViewControllerWithIdentifier:@"SingleSelectionViewController"];
        aVC.arrAllOptions = mutArrDataTrailers;
        aVC.preSelectedOptionIndex = PrimaryTrailerTypeSelectedIndex;

        __weak typeof(aVC) weakaVC = aVC;
        
        aVC.completionBlockSelectedOptionsIndex = ^(NSNumber* aSelectedIndex){
            NSLog(@"Selected index:%@ ",aSelectedIndex);

            PrimaryTrailerTypeSelectedIndex = aSelectedIndex;

            indexPrimaryTrailerType = [NSString stringWithFormat:@"%@", aSelectedIndex];
            
            [btnPrimaryTrailerType setTitleColor: [UIColor colorWithRed:95.0/255.0 green:179.0/255.0 blue:54.0/255.0 alpha:1.0] forState:UIControlStateNormal];
            NSInteger selectedIndedx = [aSelectedIndex integerValue];
            [btnPrimaryTrailerType setTitle:[NSString stringWithFormat:@"%@",[mutArrDataTrailers[selectedIndedx] valueForKey:@"name"]] forState:UIControlStateNormal];

            [weakaVC removeFromParent];
        };
        
    [self.navigationController.view addSubview:aVC.view];
    [self.navigationController addChildViewController:aVC];
}


- (IBAction)btnAlternateTrailerTypeClicked:(id)sender {
    
    
    MultipleSelectionViewController *aVC = [self.storyboard instantiateViewControllerWithIdentifier:@"MultipleSelectionViewController"];
    
    aVC.arrAllOptions = mutArrDataTrailers;
    aVC.preSelectedOptionsIndexes = arrAlternateTrailerTypeSelectedIndexes;

    __weak typeof(aVC) weakaVC = aVC;
    
    
    aVC.completionBlockSelectedOptionsIndex = ^(NSArray* aSelectedIndex,NSArray* aContentData) {
        
        arrAlternateTrailerTypeSelectedIndexes = aSelectedIndex;

        NSString *strAlternateTrailerType = [[aContentData valueForKey:@"name"] componentsJoinedByString:@","];
        indexAlternateTrailerType = [[aContentData valueForKey:@"id"] componentsJoinedByString:@","];
        [btnAlternateTrailerType setTitleColor: [UIColor colorWithRed:95.0/255.0 green:179.0/255.0 blue:54.0/255.0 alpha:1.0] forState:UIControlStateNormal];
        [btnAlternateTrailerType setTitle:[NSString stringWithFormat:@"%@",strAlternateTrailerType] forState:UIControlStateNormal];
        [weakaVC removeFromParent];
        
    };
    [self.navigationController.view addSubview:aVC.view];
    [self.navigationController addChildViewController:aVC];
    
    
}


#pragma mark OtherMethods

-(void)setUI
{
    [txtFName setTintColor:FMS_WhiteColor];
    [txtFEmailId setTintColor:FMS_WhiteColor];
    [txtFMobileNo setTintColor:FMS_WhiteColor];
    [txtFInsurancePolicyName setTintColor:FMS_WhiteColor];
    [txtFInsurancePolicyNo setTintColor:FMS_WhiteColor];
    [txtFInsurancePolicyExpDate setTintColor:FMS_WhiteColor];
    
    //New Added
    [txtBusinessName setTintColor:FMS_WhiteColor];
    [txtHaulerID setTintColor:FMS_WhiteColor];
    [txtGeneralExpirationDate setTintColor:FMS_WhiteColor];
    [txtAutoLiabilityExDate setTintColor:FMS_WhiteColor];
    [txtCargoInsuranceExDate setTintColor:FMS_WhiteColor];
    [txtPrimaryPhoneNo setTintColor:FMS_WhiteColor];
    [txtAlternatePhoneNo setTintColor:FMS_WhiteColor];
    [txtPrimaryTrailerType setTintColor:FMS_WhiteColor];
    [txtAlternateTrailerType setTintColor:FMS_WhiteColor];
    [txtPakingAddress setTintColor:FMS_WhiteColor];
    

//    txtBusinessName;
//    txtHaulerID;
//    txtGeneralExpirationDate
//    txtAutoLiabilityExDate;
//    txtCargoInsuranceExDate;
//    txtPrimaryPhoneNo;
//    txtAlternatePhoneNo;
//    txtPrimaryTrailerType;
//    txtAlternateTrailerType;
//    txtPakingAddress;
    
   

    
    
    
    [self.navigationController setNavigationBarHidden:FALSE];
    [self setNavigationBarWithTitle:@"Register" withBack:true];
    if (self.isRegisterDriver)
    {
         [objScrollview setContentSize:CGSizeMake([UIScreen mainScreen].bounds.size.width, btnRegister.frame.size.height+btnRegister.frame.origin.y+20)];
    }
    
    [txtFInsurancePolicyExpDate setTintColor:[UIColor clearColor]];
    [[FMS_Utility sharedFMSUtility]addPicker:self onTextField:txtFInsurancePolicyExpDate pickerType:@"Date" withKey:@"" withCompletionBlock:^(id picker, int buttonIndex, int firstindex, int secondindex) {
        
        [txtFInsurancePolicyExpDate resignFirstResponder];
        if (buttonIndex == 1) {
            
            UIDatePicker *datePicker = (UIDatePicker*)picker;
            NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
            [formatter setDateFormat:@"MM/dd/yyyy"];
            txtFInsurancePolicyExpDate.text = [NSString stringWithFormat:@"%@",[formatter stringFromDate:datePicker.date]];
        }
    } withPickerArray:nil withPickerSecondArray:nil count:0 withTitle:@""];
    
    
    [[FMS_Utility sharedFMSUtility]addPicker:self onTextField:txtGeneralExpirationDate pickerType:@"Date" withKey:@"" withCompletionBlock:^(id picker, int buttonIndex, int firstindex, int secondindex) {
        
        [txtGeneralExpirationDate resignFirstResponder];
        if (buttonIndex == 1) {
            
            UIDatePicker *datePicker = (UIDatePicker*)picker;
            NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
            [formatter setDateFormat:@"yyyy/MM/dd"];
            txtGeneralExpirationDate.text = [NSString stringWithFormat:@"%@",[formatter stringFromDate:datePicker.date]];
        }
    } withPickerArray:nil withPickerSecondArray:nil count:0 withTitle:@""];
  
    
    [[FMS_Utility sharedFMSUtility]addPicker:self onTextField:txtCargoInsuranceExDate pickerType:@"Date" withKey:@"" withCompletionBlock:^(id picker, int buttonIndex, int firstindex, int secondindex) {
        
        [txtCargoInsuranceExDate resignFirstResponder];
        if (buttonIndex == 1) {
            
            UIDatePicker *datePicker = (UIDatePicker*)picker;
            NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
            [formatter setDateFormat:@"yyyy/MM/dd"];
            txtCargoInsuranceExDate.text = [NSString stringWithFormat:@"%@",[formatter stringFromDate:datePicker.date]];
        }
    } withPickerArray:nil withPickerSecondArray:nil count:0 withTitle:@""];
  
    [[FMS_Utility sharedFMSUtility]addPicker:self onTextField:txtAutoLiabilityExDate pickerType:@"Date" withKey:@"" withCompletionBlock:^(id picker, int buttonIndex, int firstindex, int secondindex) {
        
        [txtAutoLiabilityExDate resignFirstResponder];
        if (buttonIndex == 1) {
            
            UIDatePicker *datePicker = (UIDatePicker*)picker;
            NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
            [formatter setDateFormat:@"yyyy/MM/dd"];
            txtAutoLiabilityExDate.text = [NSString stringWithFormat:@"%@",[formatter stringFromDate:datePicker.date]];
        }
    } withPickerArray:nil withPickerSecondArray:nil count:0 withTitle:@""];
}

-(void)registerUser
{
    if ([self checkAllFields])
    {
        NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
        [formatter setDateFormat:@"MM/dd/yyyy"];
        NSDate *date = [formatter dateFromString:txtFInsurancePolicyExpDate.text];
        [formatter setDateFormat:@"yyyy/MM/dd"];
        NSString *strDate = [formatter stringFromDate:date];
        
        NSMutableDictionary *aMutDictObj = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                            txtFName.text,@"name",
                                            txtFMobileNo.text,@"contact_number",
                                            txtFEmailId.text,@"email",
                                            txtFInsurancePolicyName.text,@"ins_policyname",
                                            txtFInsurancePolicyNo.text,@"ins_policyno",
                                            strDate,@"ins_policy_expdate",
                                            nil];
        
        [aMutDictObj setObject:@"avatar" forKey:@"ParamName1"];
        [aMutDictObj setObject:imgViewProfile.image forKey:@"Image1"];
        
        [aMutDictObj setObject:txtBusinessName.text forKey:@"buisness_name"];
        [aMutDictObj setObject:txtHaulerID.text forKey:@"hauler_id"];
        [aMutDictObj setObject:txtGeneralExpirationDate.text forKey:@"genral_exp_date"];
        [aMutDictObj setObject:txtAutoLiabilityExDate.text forKey:@"auto_exp_date"];
        [aMutDictObj setObject:txtCargoInsuranceExDate.text forKey:@"cargo_exp_date"];
        [aMutDictObj setObject:txtPrimaryPhoneNo.text forKey:@"primary_no"];
        [aMutDictObj setObject:txtAlternatePhoneNo.text forKey:@"alternate_no"];
        [aMutDictObj setObject:[NSString stringWithFormat:@"%@",indexAlternateTrailerType] forKey:@"alternate_trailer_type"];
        [aMutDictObj setObject:[NSString stringWithFormat:@"%@",indexPrimaryTrailerType] forKey:@"primary_trailer_type"];
        [aMutDictObj setObject:txtPakingAddress.text forKey:@"parking_address"];
        [aMutDictObj setObject:[NSNumber numberWithBool:isTextNotification]  forKey:@"is_text_notification"];
        [aMutDictObj setObject:[NSNumber numberWithBool:isEmailNotification] forKey:@"is_email_notification"];

      
        
        Webservice *WebserviceObj = [[Webservice alloc] init];
        
        [WebserviceObj callWebserviceToUploadImageWithURL:[NSString stringWithFormat:@"%@/users/driver_reg",FMS_WSURL] withSilentCall:NO withParams:aMutDictObj forViewController:self withCompletionBlock:^(NSDictionary *responseData) {
            
            if([responseData[@"status"] intValue] == 1 )
            {
                [[FMS_Utility sharedFMSUtility]showAlertWithTarget:self WithMessage:responseData[@"message"] withCancelButton:@"OK" WithCompletionBlock:^(int index) {
                   
                    [self.navigationController popViewControllerAnimated:YES];
                   
                } withOtherButtons:nil];
                
            }
            else
            {
                [FMS_Utility showAlert:responseData[@"message"]];
            }
            
            
        } withFailureBlock:^(NSError *error) {
            
        }];
    }
    else
    {
        //[FMS_Utility showAlert:@"Name can not be blank."];
    }
}

-(BOOL)checkAllFields
{
    BOOL isSucceed = YES;
    
    if ([FMS_Utility isEmptyText:txtBusinessName.text])
    {
        isSucceed = NO;
        [FMS_Utility showAlert:@"Business Name should not be blank."];
    }
    else if ([FMS_Utility isEmptyText:txtHaulerID.text])
    {
        isSucceed = NO;
        [FMS_Utility showAlert:@"Hauler ID should not be blank."];
    }
    else if ([FMS_Utility isEmptyText:txtFName.text])
    {
        isSucceed = NO;
        [FMS_Utility showAlert:@"Driver Name should not be blank."];
    }
    else if ([FMS_Utility isEmptyText:txtFEmailId.text])
    {
        isSucceed = NO;
        [FMS_Utility showAlert:@"Please enter email id."];
    }
    else if ([FMS_Utility isEmptyText:txtFInsurancePolicyName.text])
    {
        isSucceed = NO;
        [FMS_Utility showAlert:@"Please enter policy name."];
    }
    else if ([FMS_Utility isEmptyText:txtFInsurancePolicyNo.text])
    {
        isSucceed = NO;
        [FMS_Utility showAlert:@"Please enter policy number."];
    }
    else if ([FMS_Utility isEmptyText:txtGeneralExpirationDate.text])
    {
        isSucceed = NO;
        [FMS_Utility showAlert:@"Please enter general liability Expiration date."];
    }
    else if ([FMS_Utility isEmptyText:txtAutoLiabilityExDate.text])
    {
        isSucceed = NO;
        [FMS_Utility showAlert:@"Please enter auto liability Expiration date."];
    }
    else if ([FMS_Utility isEmptyText:txtCargoInsuranceExDate.text])
    {
        isSucceed = NO;
        [FMS_Utility showAlert:@"Please enter cargo liability Expiration date."];
    }
    else if ([FMS_Utility isEmptyText:txtPrimaryPhoneNo.text])
    {
        isSucceed = NO;
        [FMS_Utility showAlert:@"Please enter primary mobile no."];
    }
    else if(![FMS_Utility validateMobileNumber:txtPrimaryPhoneNo.text])
    {
        isSucceed = NO;
        [FMS_Utility showAlert:@"Please enter valid primary mobile no."];
        
    }
    else if ([FMS_Utility isEmptyText:txtAlternatePhoneNo.text])
    {
        isSucceed = NO;
        [FMS_Utility showAlert:@"Please enter alternate mobile no."];
    }
    else if(![FMS_Utility validateMobileNumber:txtAlternatePhoneNo.text])
    {
        isSucceed = NO;
        [FMS_Utility showAlert:@"Please enter valid alternate mobile no."];
        
    }

    
//    else if ([FMS_Utility isEmptyText:txtPrimaryTrailerType.text])
//    {
//        isSucceed = NO;
//        [FMS_Utility showAlert:@"Please select primary trailer type."];
//    }
    else if ([btnPrimaryTrailerType.titleLabel.text isEqualToString:@"Select"])
    {
        isSucceed = NO;
        [FMS_Utility showAlert:@"Please select primary trailer type."];
    }
    else if ([btnAlternateTrailerType.titleLabel.text isEqualToString:@"Select"])
    {
        isSucceed = NO;
        [FMS_Utility showAlert:@"Please select alternate trailer type."];
    }
   
    else if ([FMS_Utility isEmptyText:txtPakingAddress.text])
    {
        isSucceed = NO;
        [FMS_Utility showAlert:@"Please enter address."];
    }
    return isSucceed;
}

#pragma mark TextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}


-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
  
    if (textField.tag == 100) {
        
        [[FMS_Utility sharedFMSUtility]addPicker:self onTextField:txtGeneralExpirationDate pickerType:@"Date" withKey:@"" withCompletionBlock:^(id picker, int buttonIndex, int firstindex, int secondindex) {
            
            [txtGeneralExpirationDate resignFirstResponder];
            if (buttonIndex == 1) {
                
                UIDatePicker *datePicker = (UIDatePicker *)picker;
                NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
                [formatter setDateFormat:@"yyyy/MM/dd"];
                txtGeneralExpirationDate.text = [NSString stringWithFormat:@"%@",[formatter stringFromDate:datePicker.date]];
            }
        } withPickerArray:nil withPickerSecondArray:nil count:0 withTitle:@""];
        
    }
    else if (textField.tag == 200)
    {
        [[FMS_Utility sharedFMSUtility]addPicker:self onTextField:txtAutoLiabilityExDate pickerType:@"Date" withKey:@"" withCompletionBlock:^(id picker, int buttonIndex, int firstindex, int secondindex) {
            
            [txtAutoLiabilityExDate resignFirstResponder];
            if (buttonIndex == 1) {
                
                UIDatePicker *datePicker = (UIDatePicker *)picker;
                NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
                [formatter setDateFormat:@"yyyy/MM/dd"];
                txtAutoLiabilityExDate.text = [NSString stringWithFormat:@"%@",[formatter stringFromDate:datePicker.date]];
            }
        } withPickerArray:nil withPickerSecondArray:nil count:0 withTitle:@""];
        
    }
    else if (textField.tag == 300)
    {
        [[FMS_Utility sharedFMSUtility]addPicker:self onTextField:txtCargoInsuranceExDate pickerType:@"Date" withKey:@"" withCompletionBlock:^(id picker, int buttonIndex, int firstindex, int secondindex) {
            
            [txtCargoInsuranceExDate resignFirstResponder];
            if (buttonIndex == 1) {
                
                UIDatePicker *datePicker = (UIDatePicker *)picker;
                NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
                [formatter setDateFormat:@"yyyy/MM/dd"];
                txtCargoInsuranceExDate.text = [NSString stringWithFormat:@"%@",[formatter stringFromDate:datePicker.date]];
            }
        } withPickerArray:nil withPickerSecondArray:nil count:0 withTitle:@""];
        
    }
  

    
//    if ([textField isEqual:txtPrimaryTrailerType]) {
//        
//        SingleSelectionViewController *aVC = [self.storyboard instantiateViewControllerWithIdentifier:@"SingleSelectionViewController"];
//        aVC.arrAllOptions = mutArrDataTrailers;
//        
//        __weak typeof(aVC) weakaVC = aVC;
//        
//        aVC.completionBlockSelectedOptionsIndex = ^(NSNumber* aSelectedIndex){
//            NSLog(@"Selected index:%@ ",aSelectedIndex);
//            
//            NSInteger selectedIndedx = [aSelectedIndex integerValue];
//            txtPrimaryTrailerType.text = mutArrDataTrailers[selectedIndedx];
//
//            [weakaVC removeFromParent];
//        };
//        
//        [self.view addSubview:aVC.view];
//        [self addChildViewController:aVC];
//    }
//    
//    
//    if ([textField isEqual:txtAlternateTrailerType]) {
//    
//        MultipleSelectionViewController *aVC = [self.storyboard instantiateViewControllerWithIdentifier:@"MultipleSelectionViewController"];
//        
//        aVC.arrAllOptions = mutArrDataTrailers;
//        
//        __weak typeof(aVC) weakaVC = aVC;
//        
//        aVC.completionBlockSelectedOptionsIndex = ^(NSArray* aSelectedIndex){
//            NSLog(@"Selected index array:%@ ",aSelectedIndex);
//            [weakaVC removeFromParent];
//        };
//        [self.navigationController.view addSubview:aVC.view];
//        [self.navigationController addChildViewController:aVC];
//    }
    
    
 
    
    return YES;
}


- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    BOOL shouldReplace = YES;

    if ([textField isEqual:txtAlternatePhoneNo] || [textField isEqual:txtPrimaryPhoneNo])
    {
        if (textField.text.length >= 10 && string.length > 0)
            shouldReplace = NO;
        
        NSCharacterSet* numberCharSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
        for (int i = 0; i < [string length]; ++i)
        {
            unichar c = [string characterAtIndex:i];
            if (![numberCharSet characterIsMember:c])
            {
                return NO;
            }
        }
        
    }
    return shouldReplace;
}






@end

