//
//  FMS_ForgotPWDVC.m
//  FMS
//
//  Created by indianic on 07/08/15.
//  Copyright (c) 2015 indianic. All rights reserved.
//

#import "FMS_ForgotPWDVC.h"

@interface FMS_ForgotPWDVC ()

@end

@implementation FMS_ForgotPWDVC

#pragma mark View lifecycle

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self.navigationController setNavigationBarHidden:FALSE];
    [self setNavigationBarWithTitle:@"Forgot Password" withBack:TRUE];
    [self.txtFldEmail setTintColor:FMS_WhiteColor];
    
    //    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    //    [_txtFldEmail setValue:FMS_GreenColor forKeyPath:@"_placeholderLabel.textColor"];
    //    _txtFldEmail.leftView = paddingView;
    //    _txtFldEmail.leftViewMode = UITextFieldViewModeAlways;
    //    [_txtFldEmail.layer setBorderColor:[[UIColor colorWithRed:131.0/255.0 green:132.0/255.0 blue:132.0/255.0 alpha:1.0] CGColor]];
    //    [_txtFldEmail.layer setBorderWidth:1.0];
    
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

-(IBAction)btnSendClick:(UIButton*)sender
{
    if(![FMS_Utility isEmptyText:self.txtFldEmail.text])
    {
        if([FMS_Utility validateEmail:self.txtFldEmail.text])
        {
            NSDictionary *aDictObj = [[NSDictionary alloc] initWithObjectsAndKeys:self.txtFldEmail.text,@"email",[UserDefaults objectForKey:FMS_LoginUserType],@"role", nil];
            
            Webservice *WebserviceObj = [[Webservice alloc] init];
            [WebserviceObj callWebserviceWithURL:[NSString stringWithFormat:@"%@/users/forgot_password",FMS_WSURL] withSilentCall:FALSE withParams:aDictObj forViewController:self  withCompletionBlock:^(NSDictionary *responseData)
             {
                 if([responseData[@"status"] intValue]==1)
                 {
                     UIStoryboard *aStoryBoardObj = [UIStoryboard storyboardWithName:FMS_StoryboardSecondary bundle:nil];
                     fMS_ForgotAlertVCObj =  [aStoryBoardObj instantiateViewControllerWithIdentifier:@"FMS_ForgotAlertVC"];
                     [fMS_ForgotAlertVCObj view].alpha = 0.0;
                     [[AppDelegate objSharedAppDel].window addSubview:[fMS_ForgotAlertVCObj view]];
                     [fMS_ForgotAlertVCObj.lblEmail setText:self.txtFldEmail.text];
                     __weak __typeof(fMS_ForgotAlertVCObj)weakFMS_Alert = fMS_ForgotAlertVCObj;
                     __weak __typeof(self)weakSelf = self;
                     
                     [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                         
                         [fMS_ForgotAlertVCObj view].alpha = 1.0;
                         
                     } completion:nil];
                     
                     [fMS_ForgotAlertVCObj setCompletion:^{
                         [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                             [weakFMS_Alert view].alpha = 0.0;
                         } completion:^(BOOL finished){
                             
                             [weakFMS_Alert.view removeFromSuperview];
                             [weakSelf.navigationController popViewControllerAnimated:YES];
                         }];
                         
                     }];
                 }
                 else
                 {
                     [FMS_Utility showAlert:responseData[@"message"]];
                 }
             }withFailureBlock:^(NSError *error)
             {
             }];
        }
        else
        {
            [FMS_Utility showAlert:EnterValidEmail];
        }
    }
    else
    {
        [FMS_Utility showAlert:EnterEmail];
    }
}

#pragma mark OtherMethods

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
