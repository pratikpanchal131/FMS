//
//  FMS_LeaderBoardCell.h
//  FMS
//
//  Created by indianic on 20/08/15.
//  Copyright (c) 2015 indianic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FMS_LeaderBoardCell : UITableViewCell
@property (weak, nonatomic) IBOutlet CustomImageView *imgVWThumb;
@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UILabel *lblRank;
@property (weak, nonatomic) IBOutlet UILabel *lblMiles;
@property (weak, nonatomic) IBOutlet UILabel *lblMilesTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblCommitmentLoads;
@property (weak, nonatomic) IBOutlet UILabel *lblCommitmentTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblDeliveredTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblDelivered;


@end
