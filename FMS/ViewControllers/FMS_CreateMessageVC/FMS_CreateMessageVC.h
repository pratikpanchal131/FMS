//
//  FMS_CreateMessageVC.h
//  FMS
//
//  Created by indianic on 06/08/15.
//  Copyright (c) 2015 indianic. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HPGrowingTextView.h"
#import "CustomTextField.h"

@interface FMS_CreateMessageVC : UIViewController<HPGrowingTextViewDelegate>
{
    __weak IBOutlet CustomTextField *txtFTo;
    __weak IBOutlet HPGrowingTextView *textView;
    __weak IBOutlet UIView *containerView;
    NSString *strEmployeeId;
    
    NSMutableArray *arrMutEmp;
}
- (IBAction)btnSendClick:(UIButton *)sender;
- (IBAction)btnSelectTo:(UIButton *)sender;
@end
