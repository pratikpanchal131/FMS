//
//  FMS_AvailableCell.h
//  FMS
//
//  Created by indianic on 12/08/15.
//  Copyright (c) 2015 indianic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FMS_AvailableCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lblDate;
@property (weak, nonatomic) IBOutlet UILabel *lblSourceLoc;
@property (weak, nonatomic) IBOutlet UILabel *lblLoads;
@property (weak, nonatomic) IBOutlet UILabel *lblCommodity;
@property (weak, nonatomic) IBOutlet UILabel *lblDestLoc;
@property (weak, nonatomic) IBOutlet UILabel *lblAmount;
@end
