//
//  FMS_ShareVC.m
//  FMS
//
//  Created by indianic on 11/08/15.
//  Copyright (c) 2015 indianic. All rights reserved.
//

#import "FMS_ShareVC.h"

@interface FMS_ShareVC ()

@end

@implementation FMS_ShareVC
@synthesize completion;

#pragma mark View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Events

- (IBAction)btnShareViaText:(UIButton *)sender {
    
    if (completion) {
        completion(0);
    }
}

- (IBAction)btnShareViaEmail:(UIButton *)sender {
    
    if (completion) {
        completion(1);
    }
}

- (IBAction)tapGesture:(UITapGestureRecognizer *)sender {
    
    if (completion) {
        completion(2);
    }
}

#pragma mark OtherMethods

@end
