//
//  FMS_LoginVC.h
//  FMS
//
//  Created by indianic on 07/08/15.
//  Copyright (c) 2015 indianic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FMS_LoginVC : UIViewController<UITextFieldDelegate>
{
    UIButton *btnPrevSelected;
    UIColor *colorSelected,*colorUnSelected;
    __weak IBOutlet UITextField *txtFldEmail;
    __weak IBOutlet UITextField *txtFldPWD;
    __weak IBOutlet UIView *vcBG;
    __weak IBOutlet UIScrollView *scrVWCOntent;
    __weak IBOutlet UIView *vwContainer;
}
- (IBAction)btnSignInClicked:(UIButton *)sender;
- (IBAction)btnOptionClicked:(UIButton *)sender;
- (IBAction)btnWithOutloginClicked:(UIButton *)sender;
- (IBAction)btnForgotPWDClicked:(UIButton *)sender;
- (IBAction)btnBackClick:(UIButton *)sender;

@end
