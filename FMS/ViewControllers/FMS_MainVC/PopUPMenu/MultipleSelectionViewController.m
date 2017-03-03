//
//  CustomMultipleSelectionViewController.m
//  CustomMultipleChoiceDemo
//
//  Created by indianic on 27/02/17.
//  Copyright © 2017 workgroup. All rights reserved.
//

#import "MultipleSelectionViewController.h"

@interface MultipleSelectionViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *arrSelectedOptions,*arrContentData;
    BOOL isSelectAll;
}
@end

@implementation MultipleSelectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    arrSelectedOptions =  [[NSMutableArray alloc]init];
    arrContentData =  [[NSMutableArray alloc]init];
    isSelectAll = NO;
    
    if(_preSelectedOptionsIndexes){
        arrSelectedOptions = [_preSelectedOptionsIndexes mutableCopy];
        
        for (int i = 0; i<arrSelectedOptions.count; i++){
            NSMutableDictionary *aMutDict = [[NSMutableDictionary alloc] init];
            int aIndex = (int)[arrSelectedOptions[i] integerValue];
            
            [aMutDict setObject:_arrAllOptions[aIndex][@"name"] forKey:@"name"];
            [aMutDict setObject:_arrAllOptions[aIndex][@"id"] forKey:@"id"];
            
            [arrContentData addObject: aMutDict];
        }
        
        if(arrSelectedOptions.count == _arrAllOptions.count){
            _imgSelectAll.image = [UIImage imageNamed:@"imgCheck"];
            isSelectAll = !isSelectAll;
        }
    }
    
    
    
//    _viewTblBack.layer.cornerRadius = 10;
    
    self.view.alpha = 0;
    
    [UIView animateWithDuration:0.3 animations:^{
        self.view.alpha = 1;
    }];
    // Do any additional setup after loading the view from its nib.
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *aCell = [tableView dequeueReusableCellWithIdentifier:@"reuseCell"];
    
    UIImageView *aImgView = (UIImageView*)[aCell viewWithTag:101];
    
    NSString *aStrImg = [arrSelectedOptions containsObject:[NSNumber numberWithInteger:indexPath.row]] ? @"imgCheck" : @"imgUncheck";
    aImgView.image = [UIImage imageNamed:aStrImg];
    
    UILabel *aLblOptionTitle = (UILabel*)[aCell viewWithTag:100];
    aLblOptionTitle.text = [_arrAllOptions[indexPath.row] valueForKey:@"name"];
    
    
    return aCell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _arrAllOptions.count;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
//    if([arrSelectedOptions containsObject:[NSNumber numberWithInteger:indexPath.row]]){
//        [arrSelectedOptions removeObject:[NSNumber numberWithInteger:indexPath.row]];
//    }else{
//        [arrSelectedOptions addObject:[NSNumber numberWithInteger:indexPath.row]];
//        
//        NSMutableDictionary *aMutDict = [[NSMutableDictionary alloc] init];
//        
//        [aMutDict setObject:[_arrAllOptions[indexPath.row] valueForKey:@"name"] forKey:@"name"];
//        [aMutDict setObject:[_arrAllOptions[indexPath.row] valueForKey:@"id"] forKey:@"id"];
//        
//        
//        [arrContentData addObject: aMutDict];
//    }
//    
//    if(isSelectAll){
//        _imgSelectAll.image = [UIImage imageNamed:@"imgUncheck"];
//        isSelectAll = !isSelectAll;
//    }
//    
//    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
    
    
    NSMutableDictionary *aMutDict = [[NSMutableDictionary alloc] init];
    
    [aMutDict setObject:[_arrAllOptions[indexPath.row] valueForKey:@"name"] forKey:@"name"];
    [aMutDict setObject:[_arrAllOptions[indexPath.row] valueForKey:@"id"] forKey:@"id"];
    
    if([arrSelectedOptions containsObject:[NSNumber numberWithInteger:indexPath.row]]){
        [arrSelectedOptions removeObject:[NSNumber numberWithInteger:indexPath.row]];
        
        [arrContentData removeObject:aMutDict];
    }else{
        [arrSelectedOptions addObject:[NSNumber numberWithInteger:indexPath.row]];
        
        [arrContentData addObject: aMutDict];
    }
    
    if(isSelectAll && arrSelectedOptions.count != _arrAllOptions.count){
        _imgSelectAll.image = [UIImage imageNamed:@"imgUncheck"];
        isSelectAll = !isSelectAll;
    }else if(arrSelectedOptions.count == _arrAllOptions.count){
        _imgSelectAll.image = [UIImage imageNamed:@"imgCheck"];
        isSelectAll = !isSelectAll;
    }
    
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];

    
    
}
- (IBAction)btnDoneAction:(id)sender {
    _completionBlockSelectedOptionsIndex(arrSelectedOptions,arrContentData);
    [self removeFromParent];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self removeFromParent];
}

-(void)removeFromParent{
    
    [UIView animateWithDuration:0.3 animations:^{
        self.view.alpha = 0;
    } completion:^(BOOL finished) {
        [self.view removeFromSuperview];
        [self removeFromParentViewController];
    }];
    
}

- (IBAction)btnSelectAllAction:(id)sender {
    [arrSelectedOptions removeAllObjects];
    [arrContentData removeAllObjects];
    
    if(!isSelectAll){
        for (int i = 0; i< _arrAllOptions.count; i++){
            [arrSelectedOptions addObject:[NSNumber numberWithInteger:i]];
            
            NSMutableDictionary *aMutDict = [[NSMutableDictionary alloc] init];
            
            [aMutDict setObject:[_arrAllOptions[i] valueForKey:@"name"] forKey:@"name"];
            [aMutDict setObject:[_arrAllOptions[i] valueForKey:@"id"] forKey:@"id"];
            
            [arrContentData addObject: aMutDict];
        }
    }
    
    NSString *aStrImg = !isSelectAll ? @"imgCheck" : @"imgUncheck";
    _imgSelectAll.image = [UIImage imageNamed:aStrImg];
    
    isSelectAll = !isSelectAll;
    [_tblOptions reloadData];
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
