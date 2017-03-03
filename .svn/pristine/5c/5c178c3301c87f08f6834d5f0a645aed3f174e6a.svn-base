//
//  CustomMultipleSelectionViewController.h
//  CustomMultipleChoiceDemo
//
//  Created by indianic on 27/02/17.
//  Copyright © 2017 workgroup. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MultipleSelectionViewController : UIViewController
@property (strong,nonatomic) NSArray *arrAllOptions;
@property (strong,nonatomic) void(^completionBlockSelectedOptionsIndex)(NSArray*,NSArray*);
@property (strong,nonatomic) NSArray *preSelectedOptionsIndexes;
@property (strong, nonatomic) IBOutlet UITableView *tblOptions;
@property (strong, nonatomic) IBOutlet UIButton *btnDone;
@property (strong, nonatomic) IBOutlet UIImageView *imgSelectAll;
@property (strong, nonatomic) IBOutlet UIView *viewTblBack;

-(void)removeFromParent;
@end

