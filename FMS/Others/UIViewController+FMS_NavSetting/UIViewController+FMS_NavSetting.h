//
//  UIViewController+FMS_NavSetting.h
//  FMS
//
//  Created by indianic on 06/08/15.
//  Copyright (c) 2015 indianic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (FMS_NavSetting)
-(void)setNavigationBarWithTitle:(NSString*)aStrTitle withBack:(BOOL)backRequired;
-(void)refreshBadge;
@end
