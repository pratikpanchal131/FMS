//
//  FMS_CreateAlertVC.m
//  FMS
//
//  Created by indianic on 11/08/15.
//  Copyright (c) 2015 indianic. All rights reserved.
//

#import "FMS_CreateAlertVC.h"

@interface FMS_CreateAlertVC ()

@end


@implementation FMS_CreateAlertVC

#pragma mark View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setNavigationBarWithTitle:@"Create Alert" withBack:true];
    [txtFDistance setTintColor:FMS_WhiteColor];
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


#pragma mark ViewTouch

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [txtFDistance resignFirstResponder];
    [txtFLocation resignFirstResponder];
}

#pragma mark Events

- (IBAction)btnSelectLocation:(UIButton *)sender {
    
    NSArray *aArrLocation = [AppDelegate objSharedAppDel].filterBaseObj.data.location;
    [[FMS_Utility sharedFMSUtility]addPicker:self onTextField:txtFLocation pickerType:@"Simple" withKey:@"location_name" withCompletionBlock:^(id picker, int buttonIndex, int firstindex, int secondindex) {
        
        [txtFLocation resignFirstResponder];
        if (buttonIndex == 1)
        {
            Location *locationObj = aArrLocation[firstindex];
            txtFLocation.text = locationObj.locationName;
            strSelectedLocationId = locationObj.locationId;
        }
    } withPickerArray:aArrLocation withPickerSecondArray:nil count:1 withTitle:@""];
    [txtFLocation becomeFirstResponder];
}

- (IBAction)btnNotifyClick:(UIButton *)sender {
    
    [self callWebservice];
}

-(void)callWebservice
{
    if ([FMS_Utility isEmptyText:txtFLocation.text])
    {
        [FMS_Utility showAlert:SelectLocation];
    }
    else if ([FMS_Utility isEmptyText:txtFDistance.text])
    {
        [FMS_Utility showAlert:EnterDistance];
    }
    else if ([txtFDistance.text isEqualToString:@"0"])
    {
        [FMS_Utility showAlert:@"Minimum miles required to create alert is 1."];
    }
    else
    {
        NSDictionary *aDictObj = [[NSDictionary alloc] initWithObjectsAndKeys:[UserDefaults objectForKey:FMS_LoginUserType],@"role",[UserDefaults objectForKey:FMS_LoginUserToken],@"token",strSelectedLocationId,@"location_id",txtFDistance.text,@"miles", nil];
        
        Webservice *WebserviceObj = [[Webservice alloc] init];
        [WebserviceObj callWebserviceWithURL:[NSString stringWithFormat:@"%@/users/create_alert",FMS_WSURL] withSilentCall:FALSE  withParams:aDictObj forViewController:self withCompletionBlock:^(NSDictionary *responseData)
         {
             if([responseData[@"status"] intValue]==1)
             {
                 [[FMS_Utility sharedFMSUtility]showAlertWithTarget:self WithMessage:responseData[@"message"] withCancelButton:@"Ok" WithCompletionBlock:^(int index) {
                     
                     [self.navigationController popViewControllerAnimated:YES];
                     
                 } withOtherButtons:nil];
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
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (textField == txtFDistance)
    {
        NSString *currentString = [textField.text stringByReplacingCharactersInRange:range withString:string];
        if (currentString.length >3)
        {
            return NO;
        }
    }
    return YES;
}

@end
