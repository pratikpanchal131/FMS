//
//  FMS_MessageDetailVC.m
//  FMS
//
//  Created by indianic on 12/08/15.
//  Copyright (c) 2015 indianic. All rights reserved.
//

#import "FMS_MessageDetailVC.h"
#import "FMS_MessageDetailCell.h"

@interface FMS_MessageDetailVC ()

@end

@implementation FMS_MessageDetailVC

#pragma mark View lifecycle

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setNavigationBarWithTitle:@"Message Detail" withBack:TRUE];
    
    isloadPreviousData = YES;
    strLastMessageId = @"";
    [self setUpUI];
    tblViewMessageDetail.sectionHeaderHeight = 0;
    tblViewMessageDetail.sectionFooterHeight = 0;
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification 
                                               object:nil];
    
    mutArrayMessages = [[NSMutableArray alloc]init];
    [self getThreadMessage];
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

- (IBAction)btnReplyClick:(CustomButton *)sender {
    
    [self replyInThreadWithMessage:textView.text];
    [textView setText:@""];
    [textView resignFirstResponder];
}

- (IBAction)btnLoadPrevious:(UIButton *)sender {
   
    if (isloadPreviousData) {
       
        FMS_GetThreadMessage *aFMS_GetThreadMessageObj = mutArrayMessages[0];
        strLastMessageId = aFMS_GetThreadMessageObj.msgId;
        [self getThreadMessage];
    }
}

#pragma mark OtherMethods

- (void)updateTableContentInset {
    
    NSInteger numRows = [self tableView:tblViewMessageDetail numberOfRowsInSection:0];
    CGFloat contentInsetTop = tblViewMessageDetail.bounds.size.height;
    for (NSInteger i = 0; i < numRows; i++) {
        contentInsetTop -= [self tableView:tblViewMessageDetail heightForRowAtIndexPath:[NSIndexPath indexPathForItem:i inSection:0]];
        if (contentInsetTop <= 0) {
            contentInsetTop = 0;
            break;
        }
    }
    tblViewMessageDetail.contentInset = UIEdgeInsetsMake(contentInsetTop, 0, 0, 0);
    [tblViewMessageDetail scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:mutArrayMessages.count-1 inSection:0] atScrollPosition:UITableViewScrollPositionBottom animated:NO];
}

- (void)setUpUI {

    textView.isScrollable = NO;
    textView.minNumberOfLines = 1;
    textView.maxNumberOfLines = 6;
    textView.maxHeight = 100.0f;
    textView.font = [UIFont fontWithName:@"Roboto-Light" size:15.0f];
    textView.delegate = self;
    textView.internalTextView.scrollIndicatorInsets = UIEdgeInsetsMake(5, 0, 5, 0);
    textView.backgroundColor = [UIColor clearColor];
    [textView setTextColor:[UIColor whiteColor]];
    textView.placeholder = @"Enter Message";
    [textView.layer setBorderWidth:1.0];
    [textView.layer setBorderColor:[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.5].CGColor];
     textView.returnKeyType = UIReturnKeyDefault;
    [textView setTintColor:FMS_WhiteColor];
}

//Code from Brett Schumann
-(void) keyboardWillShow:(NSNotification *)note{
    // get keyboard size and loctaion
    CGRect keyboardBounds;
    [[note.userInfo valueForKey:UIKeyboardFrameEndUserInfoKey] getValue: &keyboardBounds];
    NSNumber *duration = [note.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    NSNumber *curve = [note.userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey];
    
    // Need to translate the bounds to account for rotation.
    keyboardBounds = [self.view convertRect:keyboardBounds toView:nil];

    // animations settings
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:[duration doubleValue]];
    [UIView setAnimationCurve:[curve intValue]];
    
    // set views with new info
    [objScrollView setContentOffset:CGPointMake(0, keyboardBounds.size.height)];
    
    // commit animations
    [UIView commitAnimations];
}

-(void) keyboardWillHide:(NSNotification *)note{
    NSNumber *duration = [note.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    NSNumber *curve = [note.userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey];
    
    // animations settings
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:[duration doubleValue]];
    [UIView setAnimationCurve:[curve intValue]];
    
    // set views with new info
    [objScrollView setContentOffset:CGPointMake(0, 0)];
    
    // commit animations
    [UIView commitAnimations];
}

- (void)growingTextView:(HPGrowingTextView *)growingTextView willChangeHeight:(float)height
{
    float diff = (growingTextView.frame.size.height - height);
    
    CGRect r = containerView.frame;
    r.size.height -= diff;
    r.origin.y += diff;
    containerView.frame = r;
    
    tblViewMessageDetail.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height- 64 - containerView.frame.size.height);
}

- (BOOL)growingTextViewShouldReturn:(HPGrowingTextView *)growingTextView
{
    [textView resignFirstResponder];
    return YES;
}

-(float)getHeightForControl:(UILabel*)lblRef forString:(NSString*)aStr
{
    CGRect textRect = [aStr boundingRectWithSize:CGSizeMake(lblRef.frame.size.width, 999.0)
                                         options:NSStringDrawingUsesLineFragmentOrigin
                                      attributes:@{NSFontAttributeName:lblRef.font}
                                         context:nil];
    return textRect.size.height;
}

-(void)getThreadMessage
{
    NSDictionary *aDictObj = [[NSDictionary alloc] initWithObjectsAndKeys:[UserDefaults objectForKey:FMS_LoginUserType],@"role",[UserDefaults objectForKey:FMS_LoginUserToken],@"token",self.fMS_GetThreadListObj.threadId,@"thread_id",strLastMessageId,@"lst_msg_id", nil];
    
    Webservice *WebserviceObj = [[Webservice alloc] init];
    [WebserviceObj callWebserviceWithURL:[NSString stringWithFormat:@"%@/users/get_thread_messages",FMS_WSURL] withSilentCall:FALSE  withParams:aDictObj forViewController:self withCompletionBlock:^(NSDictionary *responseData)
     {
         if([responseData[@"status"] intValue]==1)
         {
             if([strLastMessageId isEqualToString:@""])
             {
                 [mutArrayMessages removeAllObjects];
                 for(NSDictionary*aDictObj in responseData[@"data"])
                 {
                     FMS_GetThreadMessage *aFMS_GetThreadMessageObj = [[FMS_GetThreadMessage alloc] initWithDictionary:aDictObj];
                     [mutArrayMessages addObject:aFMS_GetThreadMessageObj];
                 }
               [tblViewMessageDetail reloadData];
               [self updateTableContentInset];
             }
             else
             {
                 NSArray *aArrTemp = responseData[@"data"];
                 int aIntCount =(int)[aArrTemp count] - 1;
                 if (aIntCount <10)
                 {
                     isloadPreviousData = NO;
                 }
                 for(int aInt= aIntCount; aInt>=0 ;aInt--)
                 {
                     FMS_GetThreadMessage *aFMS_GetThreadMessageObj = [[FMS_GetThreadMessage alloc] initWithDictionary:aArrTemp[aInt]];
                     [mutArrayMessages insertObject:aFMS_GetThreadMessageObj atIndex:0];
                 }
                 [tblViewMessageDetail reloadData];
             }
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

-(void)replyInThreadWithMessage:(NSString*)strMessage
{
    if (![FMS_Utility isEmptyText:strMessage])
    {
        NSDictionary *aDictObj = [[NSDictionary alloc] initWithObjectsAndKeys:[UserDefaults objectForKey:FMS_LoginUserType],@"role",[UserDefaults objectForKey:FMS_LoginUserToken],@"token",strMessage,@"message",self.fMS_GetThreadListObj.employeeId,@"employee_id",self.fMS_GetThreadListObj.threadId,@"thread_id", nil];
        
        Webservice *WebserviceObj = [[Webservice alloc] init];
        [WebserviceObj callWebserviceWithURL:[NSString stringWithFormat:@"%@/users/send_message",FMS_WSURL] withSilentCall:FALSE  withParams:aDictObj forViewController:self withCompletionBlock:^(NSDictionary *responseData)
         {
             if([responseData[@"status"] intValue]==1)
             {
                 for(NSDictionary*aDictObj in responseData[@"data"])
                 {
                     FMS_GetThreadList *aFMS_GetThreadListObj = [[FMS_GetThreadList alloc] initWithDictionary:aDictObj];
                     [mutArrayMessages addObject:aFMS_GetThreadListObj];
                     [tblViewMessageDetail insertRowsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForRow:mutArrayMessages.count-1 inSection:0]] withRowAnimation:UITableViewRowAnimationNone];
                 }
                  [self updateTableContentInset];
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


#pragma mark -----------------------
#pragma mark TableVew Datasource Methods

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return mutArrayMessages.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FMS_MessageDetailCell *aCell = [tableView dequeueReusableCellWithIdentifier:@"FMS_MessageDetailCell"];
    FMS_GetThreadMessage *aFMS_GetThreadMessageObj = mutArrayMessages[indexPath.row];
    
    if (aFMS_GetThreadMessageObj.fromMe == 0)
    {
        [aCell.lblName setText:aFMS_GetThreadMessageObj.employeeName];
    }
    else
    {
        [aCell.lblName setText:@"me"];
    }
    [aCell.lblDate setText:aFMS_GetThreadMessageObj.date];
    [aCell.lblMessage setText:aFMS_GetThreadMessageObj.message];
    
    CGFloat height = [self getHeightForControl:aCell.lblMessage forString:aFMS_GetThreadMessageObj.message];
    [aCell.lblMessage setFrame:CGRectMake(aCell.lblMessage.frame.origin.x, aCell.lblMessage.frame.origin.y, aCell.lblMessage.frame.size.width, height+10)];
    return aCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UILabel *lblMessage = [[UILabel alloc]initWithFrame:CGRectMake(18, 0, self.view.frame.size.width-36, 10)];
    [lblMessage setFont:[UIFont fontWithName:@"Roboto-Regular" size:13.0]];
    FMS_GetThreadMessage *aFMS_GetThreadMessageObj = mutArrayMessages[indexPath.row];
    CGFloat height = [self getHeightForControl:lblMessage forString:aFMS_GetThreadMessageObj.message];
    return height +80;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (isloadPreviousData)
    {
        if (mutArrayMessages.count >=10)
        {
            return 50;
        }
    }
    return 0.1;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (isloadPreviousData)
    {
        if (mutArrayMessages.count >=10)
        {
            UIButton *btnHeader = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, tblViewMessageDetail.frame.size.width, 50)];
            [btnHeader setBackgroundColor:[UIColor clearColor]];
            [btnHeader.titleLabel setFont:[UIFont fontWithName:@"Roboto-Regular" size:13.0]];
            [btnHeader setTitle:@"load previous messages" forState:UIControlStateNormal];
            [btnHeader addTarget:self action:@selector(btnLoadPrevious:) forControlEvents:UIControlEventTouchUpInside];
            return btnHeader;
        }
    }
   
    return nil;
}


@end
