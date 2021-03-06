//
//  FMS_LoginVC.m
//  FMS
//
//  Created by indianic on 07/08/15.
//  Copyright (c) 2015 indianic. All rights reserved.
//

#import "FMS_LoginVC.h"
#import "FMS_LeftVC.h"
#import "FMS_ProfileVC.h"
@interface FMS_LoginVC ()

@end

@implementation FMS_LoginVC

#pragma mark View lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    colorSelected=[UIColor colorWithRed:43.0/255.0 green:47.0/255.0 blue:48.0/255.0 alpha:1.0];
    colorUnSelected=[UIColor colorWithRed:34.0/255.0 green:38.0/255.0 blue:39.0/255.0 alpha:1.0];
    
    [txtFldEmail setTintColor:FMS_WhiteColor];
    [txtFldPWD setTintColor:FMS_WhiteColor];
    
    UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureRecognizerCalled:)];
    [recognizer setNumberOfTapsRequired:1];
    [recognizer setNumberOfTouchesRequired:1];
    [scrVWCOntent addGestureRecognizer:recognizer];
    
 
    
    // Do any additional setup after loading the view.
}

- (void)someMethodWhereYouSetUpYourObserver
{
    // This could be in an init method.
    
}
- (void)keyboardHide:(NSNotification*)notification
{
    scrVWCOntent.contentOffset = CGPointZero;
}
- (void)keyboardShow:(NSNotification*)notification
{
 
    CGRect keyboardBounds;
    [[notification.userInfo valueForKey:UIKeyboardFrameEndUserInfoKey] getValue: &keyboardBounds];
    NSNumber *duration = [notification.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    NSNumber *curve = [notification.userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey];
    
    // Need to translate the bounds to account for rotation.
    keyboardBounds = [self.view convertRect:keyboardBounds toView:nil];

    
    // animations settings
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:[duration doubleValue]];
    [UIView setAnimationCurve:[curve intValue]];
    
    float aFloatKeyboardYpos = keyboardBounds.origin.y;
    float aFloatViewArea = vwContainer.frame.origin.y+150;

    if(aFloatKeyboardYpos<aFloatViewArea)
    {
        scrVWCOntent.contentOffset = CGPointMake(0,aFloatViewArea-aFloatKeyboardYpos);
    }
    else
    {
        
    }
    [UIView commitAnimations];
    
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self refreshBadge];
    
    [self.navigationController setNavigationBarHidden:TRUE];
    
    //UIKeyboardWillHideNotification
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardHide:) name:UIKeyboardWillHideNotification object:nil];
    
    
    if(![UserDefaults objectForKey:FMS_LoginUserType])
    {
        UIButton *aBtnRef=(UIButton *) [self.view viewWithTag:101];
        [self btnOptionClicked:aBtnRef];
    }
    else
    {
        if([[UserDefaults objectForKey:FMS_LoginUserType] isEqualToString:FMS_Driver])
        {
            UIButton *aBtnRef=(UIButton *) [self.view viewWithTag:101];
            [self btnOptionClicked:aBtnRef];
            
        }
        else
        {
            UIButton *aBtnRef=(UIButton *) [self.view viewWithTag:1];
            [self btnOptionClicked:aBtnRef];
        }
    }
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark Orientation
#pragma mark ViewTouch


#pragma mark Events

- (IBAction)btnSignInClicked:(UIButton *)sender
{
    [self.view endEditing:YES];
    if([[txtFldEmail.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length]>0)
    {
        if([FMS_Utility validateEmail:txtFldEmail.text])
        {
            if([[txtFldPWD.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length]>0)
            {
                NSDictionary *aDictObj = [[NSDictionary alloc] initWithObjectsAndKeys:txtFldEmail.text,@"email",[UserDefaults objectForKey:FMS_LoginUserType],@"role",txtFldPWD.text,@"password", nil];
                
                Webservice *WebserviceObj = [[Webservice alloc] init];
                [WebserviceObj callWebserviceWithURL:[NSString stringWithFormat:@"%@/users/login",FMS_WSURL] withSilentCall:FALSE  withParams:aDictObj forViewController:self withCompletionBlock:^(NSDictionary *responseData)
                 {
                     if([responseData[@"status"] intValue]==1)
                     {
                         [[FMS_Utility sharedFMSUtility] updateUserPermission:responseData];
                         
                         
                         
                         NSDictionary *aDictObj = responseData[@"data"][0];
                         
                         [UserDefaults setObject:aDictObj[@"user_id"] forKey:FMS_LoginUserId];
                         [UserDefaults setObject:aDictObj[@"role"] forKey:FMS_LoginUserType];
                         [UserDefaults setObject:aDictObj[@"name"] forKey:FMS_LoginUserName];
                         [UserDefaults setObject:aDictObj[@"token"] forKey:FMS_LoginUserToken];
                         [UserDefaults setObject:aDictObj[@"avatar"] forKey:FMS_LoginUserAvtar];
                         [UserDefaults setObject:aDictObj[@"is_alert_enabled"] forKey:FMS_LoginAlertEnabled];
                         [UserDefaults setObject:aDictObj[@"is_push_enabled"] forKey:FMS_LoginPushEnabled];
                         [UserDefaults setObject:aDictObj[@"is_text_enabled"] forKey:@"is_text_enabled"];
                         [UserDefaults setObject:aDictObj[@"is_email_enabled"] forKey:@"is_email_enabled"];

                         
                         [UserDefaults setObject:responseData[@"profile_status"] forKey:FMS_LoginProfileStatus];

                         
                         UDSetObject(aDictObj[@"profile_status"], FMS_LoginProfileStatus);
                         [UserDefaults synchronize];
                         
                         NSLog(@"Profile Status %@",aDictObj[@"profile_status"]);
                         
                         // For Check All Profile Details is Filled or not
                         if ([aDictObj[@"profile_status"] isEqualToString:@"0"]) {
                             [[FMS_Utility sharedFMSUtility] setDrawerToUse];
                             
                         }else{
                             [FMS_Utility showAlert:@"Please complete your profile."];

                            [[FMS_Utility sharedFMSUtility] setDrawerToUseProfile];
                         }
                         [self.navigationController pushViewController:[AppDelegate objSharedAppDel].drawerController animated:TRUE];

                         
                         
                         // Call WS for Filter Data
                         //[FMS_Utility loads_filtersData:nil withCompletionBlock:^(NSDictionary *responseData) {
                             
//                                                    
//                         } withFailureBlock:^(NSError *error) {
//                             
//                         }];

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
            else
            {
                [FMS_Utility showAlert:EnterPassword];
            }
            
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

- (IBAction)btnOptionClicked:(UIButton *)sender
{
    if(sender.tag==101)
    {
        [UserDefaults setObject:FMS_Driver forKey:FMS_LoginUserType];
    }
    else
    {
        [UserDefaults setObject:FMS_Contractor forKey:FMS_LoginUserType];
    }
    [UserDefaults synchronize];
    
    if(btnPrevSelected && btnPrevSelected!=sender)
    {
        btnPrevSelected.selected=FALSE;
        [btnPrevSelected setBackgroundColor:colorUnSelected];
    }
    sender.selected=TRUE;
    [sender setBackgroundColor:colorSelected];
    //[vcBG setBackgroundColor:colorSelected];
    btnPrevSelected=sender;
}

- (IBAction)btnWithOutloginClicked:(UIButton *)sender
{
    //email,password,type(driver,contractor)
    UIStoryboard *aStoryBoardObj = [UIStoryboard storyboardWithName:FMS_StoryboardSecondary bundle:nil];
    UIViewController *aVCObj = [aStoryBoardObj instantiateViewControllerWithIdentifier:@"FMS_LoginlessVC"];
    [self.navigationController pushViewController:aVCObj animated:TRUE];
}

- (IBAction)btnForgotPWDClicked:(UIButton *)sender
{
}

- (IBAction)btnBackClick:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark OtherMethods

-(void)tapGestureRecognizerCalled:(UITapGestureRecognizer*)aRecognizerObj
{

    [self.view endEditing:TRUE];
}

#pragma mark TextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}


@end
