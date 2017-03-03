//
//  FMS_LeaderBoard.h
//  FMS
//
//  Created by indianic on 10/08/15.
//  Copyright (c) 2015 indianic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FMS_LeaderBoardVC : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    __weak IBOutlet CustomTextField *txtFSelectedCreteria;
    __weak IBOutlet UILabel *lblNoInfo;
    __weak IBOutlet UITableView *tblViewLeaderBoard;
    NSString *strSelectCriteria;
    NSMutableDictionary *dictMutFillData;
    NSMutableArray *mutLeaderBoard;
}
- (IBAction)btnFilterClick:(UIButton *)sender;
- (IBAction)btnSelectRankingCreteria:(UIButton *)sender;

@end
