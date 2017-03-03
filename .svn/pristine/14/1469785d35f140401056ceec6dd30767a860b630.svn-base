//
//  SingleSelectionViewController.m
//  CustomMultipleChoiceDemo
//
//  Created by indianic on 27/02/17.
//  Copyright © 2017 workgroup. All rights reserved.
//

#import "SingleSelectionViewController.h"


@interface SingleSelectionViewController ()<UITableViewDelegate,UITableViewDataSource>


@end

@implementation SingleSelectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tblOptions.layer.cornerRadius = 10;
    
    self.view.alpha = 0;
    
    [UIView animateWithDuration:0.3 animations:^{
        self.view.alpha = 1;
    }];
    
    int cellHeight = 44;
    
    _constTblHeight.constant = cellHeight * _arrAllOptions.count;
    [self.view layoutIfNeeded];
    
    if(_preSelectedOptionIndex){
        [[_tblOptions cellForRowAtIndexPath:[NSIndexPath indexPathForRow:[_preSelectedOptionIndex integerValue] inSection:0]]setBackgroundColor:[UIColor colorWithRed:230.0/255.0 green:230.0/255.0 blue:230.0/255.0 alpha:1.0]];
    }
    
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    int cellHeight = 44;
    
    _constTblHeight.constant = cellHeight * _arrAllOptions.count;
    [self.view layoutIfNeeded];
    
    if(_preSelectedOptionIndex){
        [[_tblOptions cellForRowAtIndexPath:[NSIndexPath indexPathForRow:[_preSelectedOptionIndex integerValue] inSection:0]]setBackgroundColor:[UIColor colorWithRed:230.0/255.0 green:230.0/255.0 blue:230.0/255.0 alpha:1.0]];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *aCell = [tableView dequeueReusableCellWithIdentifier:@"reuseCell"];
    
    UILabel *aLblOptionTitle = (UILabel*)[aCell viewWithTag:100];
    aLblOptionTitle.text = [_arrAllOptions[indexPath.row] valueForKey:@"name"];
    
    return aCell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _arrAllOptions.count;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    _completionBlockSelectedOptionsIndex([NSNumber numberWithInteger:indexPath.row]);
}


-(void)removeFromParent{
    
    [UIView animateWithDuration:0.3 animations:^{
        self.view.alpha = 0;
    } completion:^(BOOL finished) {
        [self.view removeFromSuperview];
        [self removeFromParentViewController];
    }];
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self removeFromParent];
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
