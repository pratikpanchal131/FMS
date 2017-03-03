//
//  FMS_PaymentReject.m
//  FMS
//
//  Created by indianic on 03/03/17.
//  Copyright © 2017 indianic. All rights reserved.
//

#import "FMS_PaymentReject.h"

@interface FMS_PaymentReject ()

@end

@implementation FMS_PaymentReject

- (void)viewDidLoad {
    [super viewDidLoad];
    

    [self setNavigationBarWithTitle:@"Payment Reject" withBack:TRUE];
    
    
    txtTicketNumber.enabled = false;
    txtTicketNumber.text = @"123";
    
    
    NSLog(@"data is %@",_dictData);
    
    [self setUI];
    

    // Do any additional setup after loading the view.
}


-(void)viewWillDisappear:(BOOL)animated
{
    if (self.navigationController==[AppDelegate objSharedAppDel].navCntrl)
    {
        [[AppDelegate objSharedAppDel].navCntrl setNavigationBarHidden:YES];
        
    }
    [super viewWillDisappear:animated];
}

-(void)setUI{
    
    NSString  *commodityFactor = _dictData[@"commodity"][@"title"];

    lblManualQuanity.text = [NSString stringWithFormat:@"Enter Manual delivered quantity %@",commodityFactor];
    lblCalculateQuantity.text = [NSString stringWithFormat:@"Calculate delivered quantity %@",commodityFactor];
    
    
    BOOL isImageRequired =  _dictData[@"is_image_require"];
    
    if (isImageRequired) {
        viewImage.hidden = TRUE;
    }else{
        viewImage.hidden = TRUE;

    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)bntCalculateClicked:(id)sender {
    
    
    
    int gross  = [txtGrossWeight.text intValue];
    int tare  = [txtTareWeight.text intValue];
    NSNumber *commodity = _dictData[@"commodity"][@"factor"];
    NSString  *commodityFactor = _dictData[@"commodity"][@"title"];
    
 
    
    int calculatedQuantity =  (gross - tare) / [commodity floatValue];
    
    lblCalculatedQuantity.text = [NSString stringWithFormat:@"%d",calculatedQuantity] ;
    
    
    
    
    
}
- (IBAction)btnSaveClicked:(id)sender {
    
    [self.navigationController popViewControllerAnimated:false];
}

-(void)resignAll
{
   
}

- (IBAction)btnTakeTicketImage:(id)sender {
    
    [self resignAll];
    [[FMS_Utility sharedFMSUtility]openCamera:self isRoundCrop:NO withCompletionBlock:^(UIImage *img) {
        
        if (img != nil)
        {
            [imgViewTicketNo setImage:img];
        }
    }];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
