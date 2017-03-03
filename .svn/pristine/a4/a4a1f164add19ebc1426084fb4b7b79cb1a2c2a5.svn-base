//
//  FMS_CreateMessageVC.m
//  FMS
//
//  Created by indianic on 06/08/15.
//  Copyright (c) 2015 indianic. All rights reserved.
//

#import "FMS_CreateMessageVC.h"

@interface FMS_CreateMessageVC ()

@end

@implementation FMS_CreateMessageVC

#pragma mark View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationBarWithTitle:@"Create Message" withBack:TRUE];
    // Do any additional setup after loading the view.
    
    arrMutEmp = [NSMutableArray array];
    [self setUpUI];
    
    [self callWS];
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

- (IBAction)btnSendClick:(UIButton *)sender
{
    [self createMessage];
}

- (IBAction)btnSelectTo:(UIButton *)sender
{
    [[FMS_Utility sharedFMSUtility]addPicker:self onTextField:txtFTo pickerType:@"Simple" withKey:@"name" withCompletionBlock:^(id picker, int buttonIndex, int firstindex, int secondindex) {
        
        [txtFTo resignFirstResponder];
        if (buttonIndex == 1)
        {
            txtFTo.text = arrMutEmp[firstindex][@"name"];
            strEmployeeId =arrMutEmp[firstindex][@"id"];
        }
    } withPickerArray:arrMutEmp withPickerSecondArray:nil count:1 withTitle:@""];
    [txtFTo becomeFirstResponder];
}


-(void)callWS
{
    Webservice *WebserviceObj = [[Webservice alloc] init];
    
    NSDictionary *aDictObj = @{@"token":[UserDefaults objectForKey:FMS_LoginUserToken],
                               @"role":[UserDefaults objectForKey:FMS_LoginUserType]};
    [WebserviceObj callWebserviceWithURL:[NSString stringWithFormat:@"%@/users/get_employee_list",FMS_WSURL] withSilentCall:TRUE  withParams:aDictObj forViewController:nil withCompletionBlock:^(NSDictionary *responseData)
     {
         
         if([responseData[@"status"] intValue]==1)
         {
             arrMutEmp = responseData[@"data"];
         }
         
     }
      withFailureBlock:^(NSError *error)
     {
     }];
    
    
}
#pragma mark OtherMethods

- (void)setUpUI {
    
    [textView setTintColor:FMS_WhiteColor];
    textView.isScrollable = NO;
    textView.minNumberOfLines = 1;
    textView.maxNumberOfLines = 6;
    textView.maxHeight = 200.0f;
    textView.font = [UIFont fontWithName:@"Roboto-Light" size:15.0f];
    textView.delegate = self;
    textView.backgroundColor = [UIColor clearColor];
    [textView setTextColor:[UIColor whiteColor]];
    textView.placeholder = @"Write your message.....";
    [textView.layer setCornerRadius:5.0];
    textView.returnKeyType = UIReturnKeyDefault;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [textView resignFirstResponder];
    [txtFTo resignFirstResponder];
}

- (void)growingTextView:(HPGrowingTextView *)growingTextView willChangeHeight:(float)height
{
    float diff = (growingTextView.frame.size.height - height);
    CGRect r = containerView.frame;
    r.size.height -= diff;
    containerView.frame = r;
}

- (BOOL)growingTextViewShouldReturn:(HPGrowingTextView *)growingTextView
{
    [textView resignFirstResponder];
    return YES;
}

-(void)createMessage
{
    NSString *strMessage = textView.text;
    textView.text = @"";
    [textView resignFirstResponder];
    
    if (![FMS_Utility isEmptyText:strMessage])
    {
        NSDictionary *aDictObj = [[NSDictionary alloc] initWithObjectsAndKeys:[UserDefaults objectForKey:FMS_LoginUserType],@"role",[UserDefaults objectForKey:FMS_LoginUserToken],@"token",strMessage,@"message",strEmployeeId,@"employee_id",@"0",@"thread_id", nil];
        
        Webservice *WebserviceObj = [[Webservice alloc] init];
        [WebserviceObj callWebserviceWithURL:[NSString stringWithFormat:@"%@/users/send_message",FMS_WSURL] withSilentCall:FALSE  withParams:aDictObj forViewController:self withCompletionBlock:^(NSDictionary *responseData)
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

@end
