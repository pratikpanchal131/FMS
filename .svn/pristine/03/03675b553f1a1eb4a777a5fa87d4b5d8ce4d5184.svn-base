//
//  SingleSelectionViewController.h
//  CustomMultipleChoiceDemo
//
//  Created by indianic on 27/02/17.
//  Copyright © 2017 workgroup. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SingleSelectionViewController : UIViewController

@property (strong,nonatomic) void(^completionBlockSelectedOptionsIndex)(NSNumber*);
@property (strong,nonatomic) NSArray *arrAllOptions;
@property (strong, nonatomic) IBOutlet UITableView *tblOptions;

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *constTblHeight;
@property (strong,nonatomic) NSNumber *preSelectedOptionIndex;

-(void)removeFromParent;

@end
