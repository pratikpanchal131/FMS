//
//  FMS_MyDriversCell.h
//  FMS
//
//  Created by indianic on 12/08/15.
//  Copyright (c) 2015 indianic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FMS_MyDriversCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imgViewProfilePic;
@property (weak, nonatomic) IBOutlet UILabel *lblUserName;
@property (weak, nonatomic) IBOutlet UILabel *lblUserRank;
@property (weak, nonatomic) IBOutlet UIButton *btnViewProfile;
@property (weak, nonatomic) IBOutlet UIButton *btnViewReportCard;
@end
