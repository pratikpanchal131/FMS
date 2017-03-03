//
//  FMS_MainVC.m
//  FMS
//
//  Created by indianic on 12/01/16.
//  Copyright © 2016 indianic. All rights reserved.
//

#import "FMS_MainVC.h"
#import "FMS_RegisterVC.h"

@interface FMS_MainVC ()

@end

@implementation FMS_MainVC

#pragma mark View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    if (!slideToCancel) {
        // Create the slider
        slideToCancel = [[SlideToCancelViewController alloc] init];
        slideToCancel.delegate = self;
        [self.view addSubview:slideToCancel.view];
    }
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    slideToCancel.enabled = YES;
    [self.navigationController setNavigationBarHidden:TRUE];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Events

- (IBAction)btnRegisterClick:(UIButton *)sender
{
    UIStoryboard *aStoryBoardObj = [UIStoryboard storyboardWithName:FMS_StoryboardSecondary bundle:nil];
    FMS_RegisterVC *objFMS_RegisterVC =  [aStoryBoardObj instantiateViewControllerWithIdentifier:@"FMS_RegisterVC"];
    objFMS_RegisterVC.isRegisterDriver = YES;
    [self.navigationController pushViewController:objFMS_RegisterVC animated:YES];
}

#pragma mark OtherMethods

- (void) cancelled
{
    // Disable the slider and re-enable the button
    slideToCancel.enabled = NO;
    UIStoryboard *aStoryBoardObj = [UIStoryboard storyboardWithName:FMS_StoryboardSecondary bundle:nil];
    UIViewController *aVCObj = [aStoryBoardObj instantiateViewControllerWithIdentifier:@"FMS_LoginlessVC"];
    [self.navigationController pushViewController:aVCObj animated:false];
}

@end
