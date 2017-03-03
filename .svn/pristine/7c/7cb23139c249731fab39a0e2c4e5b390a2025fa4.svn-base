//
//  FMS_ChangePasswordVC.m
//  FMS
//
//  Created by indianic on 07/08/15.
//  Copyright (c) 2015 indianic. All rights reserved.
//

#import "FMS_ChangePasswordVC.h"

@interface FMS_ChangePasswordVC ()

@end

@implementation FMS_ChangePasswordVC

#pragma mark View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setNavigationBarWithTitle:@"Change Password" withBack:true];
    [txtFNewPassword setTintColor:FMS_WhiteColor];
    [txtFConfirmPassword setTintColor:FMS_WhiteColor];
    [txtFOldPassword setTintColor:FMS_WhiteColor];
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

- (IBAction)btnSaveClick:(UIButton *)sender {
  
    [self.view endEditing:YES];
  if([self checkAllFields])
  {
      NSDictionary *aDictObj = [[NSDictionary alloc] initWithObjectsAndKeys:txtFOldPassword.text,@"current_pwd",txtFNewPassword.text,@"new_pwd",[UserDefaults objectForKey:FMS_LoginUserType],@"role",[UserDefaults objectForKey:FMS_LoginUserToken],@"token", nil];
      
      Webservice *WebserviceObj = [[Webservice alloc] init];
      [WebserviceObj callWebserviceWithURL:[NSString stringWithFormat:@"%@/users/change_pwd",FMS_WSURL] withSilentCall:FALSE withParams:aDictObj forViewController:self  withCompletionBlock:^(NSDictionary *responseData)
       {
           if([responseData[@"status"] intValue] == 1 )
           {
               [FMS_Utility showAlert:responseData[@"message"]];
           }
           else
           {
               [FMS_Utility showAlert:responseData[@"message"]];
           }
           [self resetFields];
           
       }withFailureBlock:^(NSError *error)
       {
        
       }];
  }
}

#pragma mark OtherMethods

-(void)resetFields
{
  txtFOldPassword.text = @"";
  txtFConfirmPassword.text = @"";
  txtFNewPassword.text = @"";
}

-(BOOL)checkAllFields
{
    BOOL isSucceed = YES;
    
    if ([FMS_Utility isEmptyText:txtFOldPassword.text])
    {
        [FMS_Utility showAlert:OldPasswordVaidation];
        isSucceed = NO;
    }
    else if ([FMS_Utility isEmptyText:txtFNewPassword.text])
    {
        [FMS_Utility showAlert:NewPasswordVidation];
        isSucceed = NO;
    }
    else if (![FMS_Utility validatePassword:txtFNewPassword.text])
    {
        [FMS_Utility showAlert:NewPasswordLength];
        isSucceed = NO;
    }
    else if ([FMS_Utility isEmptyText:txtFConfirmPassword.text])
    {
        [FMS_Utility showAlert:ConfirmNewPasswordVidation];
        isSucceed = NO;
    }
    else if (![txtFConfirmPassword.text isEqualToString:txtFNewPassword.text])
    {
        [FMS_Utility showAlert:PasswordMatch];
        isSucceed = NO;
    }
    return isSucceed;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

#pragma mark TextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

@end
