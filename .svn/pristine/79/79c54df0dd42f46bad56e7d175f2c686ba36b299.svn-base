//
//  FMS_MessageDetailVC.h
//  FMS
//
//  Created by indianic on 12/08/15.
//  Copyright (c) 2015 indianic. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HPGrowingTextView.h"
#import "FMS_GetThreadList.h"
#import "FMS_GetThreadMessage.h"

@interface FMS_MessageDetailVC : UIViewController<UITableViewDataSource,UITableViewDelegate,HPGrowingTextViewDelegate>
{
   __weak IBOutlet UIView *containerView;
    __weak IBOutlet HPGrowingTextView *textView;
    __weak IBOutlet CustomButton *btnReply;
    __weak IBOutlet UITableView *tblViewMessageDetail;
    __weak IBOutlet UIScrollView *objScrollView;
    
    NSString *strLastMessageId;
    BOOL isloadPreviousData;

    NSMutableArray *mutArrayMessages;
}
@property(strong,nonatomic)FMS_GetThreadList *fMS_GetThreadListObj;

- (IBAction)btnReplyClick:(CustomButton *)sender;
- (IBAction)btnLoadPrevious:(UIButton *)sender;

@end
