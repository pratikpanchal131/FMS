//
//  FMS_SettingsVC.m
//  FMS
//
//  Created by indianic on 07/08/15.
//  Copyright (c) 2015 indianic. All rights reserved.
//

#import "FMS_SettingsVC.h"

@interface FMS_SettingsVC ()

@end

@implementation FMS_SettingsVC

#pragma mark View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setNavigationBarWithTitle:@"Setting" withBack:false];
    [self setSwitchStatus];
    if (![FMS_Utility isLoginFromDriver])
    {
        [viewAlert setHidden:YES];
        [viewNotification setFrame:viewAlert.frame];
        [viewPassword setFrame:CGRectMake(viewPassword.frame.origin.x, viewNotification.frame.origin.y + viewNotification.frame.size.height+20, viewPassword.frame.size.width, viewPassword.frame.size.height)];
    }
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

- (IBAction)btnContactClicked:(UIButton *)sender
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:FMS_Setting_LocationURL]];
}
- (IBAction)btnAlertSwitch:(UISwitch *)sender
{    
    if (sender.isOn)
    {
        [switchNotification setOn:sender.isOn];
    }
    [self changeAlertNotificationStatus];
}
- (IBAction)btnNotificationSwitch:(UISwitch *)sender {
    
    if (!sender.isOn)
    {
       [switchAlert setOn:sender.isOn];
    }
    [self changeAlertNotificationStatus];
}

- (IBAction)btnNotificationText:(UISwitch *)sender {
    if (sender.isOn)
    {
        [switchNotification setOn:sender.isOn];
    }
    [self changeAlertNotificationStatus];
}

- (IBAction)btnNotificationEmail:(UISwitch *)sender {
    if (sender.isOn)
    {
        [switchNotification setOn:sender.isOn];
    }
    [self changeAlertNotificationStatus];
}

#pragma mark OtherMethods

-(void)setSwitchStatus
{
    if ([[UserDefaults objectForKey:FMS_LoginAlertEnabled] isEqualToString:@"0"])
    {
        [switchAlert setOn:NO];
    }
    else
    {
        [switchAlert setOn:YES];
    }
    if ([[UserDefaults objectForKey:FMS_LoginPushEnabled] isEqualToString:@"0"])
    {
        [switchNotification setOn:NO];
    }
    else
    {
        [switchNotification setOn:YES];
    }
    
    if ([[UserDefaults objectForKey:FMS_LoginPushText] isEqualToString:@"0"])
    {
        [switchText setOn:NO];
    }
    else
    {
        [switchText setOn:YES];
    }
    
    if ([[UserDefaults objectForKey:FMS_LoginPushEmail] isEqualToString:@"0"])
    {
        [switchEmail setOn:NO];
    }
    else
    {
        [switchEmail setOn:YES];
    }
    
}

-(void)changeAlertNotificationStatus
{
    NSDictionary *aDictObj = [[NSDictionary alloc] initWithObjectsAndKeys:[UserDefaults objectForKey:FMS_LoginUserType],@"role",[UserDefaults objectForKey:FMS_LoginUserToken],@"token",[NSString stringWithFormat:@"%i",switchAlert.isOn],@"alerts",[NSString stringWithFormat:@"%i",switchNotification.isOn],@"push_notification",
                              [NSString stringWithFormat:@"%i",switchText.isOn],@"text",
                              [NSString stringWithFormat:@"%i",switchEmail.isOn],@"email",
                              nil];
    
//    [aDictObj setValue:[NSString stringWithFormat:@"%i",switchText.isOn] forKey:@"text"];
//    [aDictObj setValue:[NSString stringWithFormat:@"%i",switchEmail.isOn] forKey:@"email"];

    
    
    Webservice *WebserviceObj = [[Webservice alloc] init];
    [WebserviceObj callWebserviceWithURL:[NSString stringWithFormat:@"%@/users/update_settings",FMS_WSURL] withSilentCall:FALSE withParams:aDictObj forViewController:self  withCompletionBlock:^(NSDictionary *responseData)
     {
         if([responseData[@"status"] intValue]==1)
         {
             [UserDefaults setObject:[NSString stringWithFormat:@"%i",switchAlert.isOn] forKey:FMS_LoginAlertEnabled];
             [UserDefaults setObject:[NSString stringWithFormat:@"%i",switchNotification.isOn] forKey:FMS_LoginPushEnabled];
             
             [UserDefaults setObject:[NSString stringWithFormat:@"%i",switchText.isOn] forKey:FMS_LoginPushText];
             [UserDefaults setObject:[NSString stringWithFormat:@"%i",switchEmail.isOn] forKey:FMS_LoginPushEmail];
             
         }
         else
         {
             [FMS_Utility showAlert:responseData[@"message"]];
         }
         [self setSwitchStatus];
         
     }withFailureBlock:^(NSError *error)
     {
        [self setSwitchStatus];
     }];
}
@end
