//
//  FMS_DeliveredHistoryCell.h
//  FMS
//
//  Created by indianic on 09/09/15.
//  Copyright (c) 2015 indianic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FMS_DeliveredHistoryCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lblDate;
@property (weak, nonatomic) IBOutlet UILabel *lblStatus;
@property (weak, nonatomic) IBOutlet UIImageView *imgVWTimeIndicator;
@property (weak, nonatomic) IBOutlet UIImageView *imgVWDollar;

@end
