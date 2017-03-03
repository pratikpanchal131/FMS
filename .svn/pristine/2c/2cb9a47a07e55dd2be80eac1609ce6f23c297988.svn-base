//
//  TabBarControllerVC.m
//  Chooser
//
//  Created by Indianic on 07/04/14.
//  Copyright (c) 2014 indianic. All rights reserved.
//

#import "FMS_TabBarVC.h"




@interface FMS_TabBarVC ()

@end

@implementation FMS_TabBarVC


#pragma mark - View lifecycle

- (void)viewDidLoad
{
    @try {
        [super viewDidLoad];
        
        

        //[self.tabBar setBackgroundImage:[UIImage imageNamed:@"TabBG"]];
        [self setupTabBar];
    
    }
    @catch (NSException *exception) {
        NSLog(@"viewDidLoad TabBarControllerVC:%@",exception);
    }
    @finally {
    }
}


#pragma mark - Other Methods

-(void)setupTabBar
{
    @try {

        UIStoryboard *aStoryBoardObj = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        NSArray *aArrItems;
        NSArray *aArrItemImages;
        NSArray *aArrItemImagesIPhone6;
        
        if([[FMS_Utility sharedFMSUtility] checkForAcceptLoadPermission])
        {
            
            // If accept_load permission is there for driver or logged in user is contractor then show available tab.
            
            aArrItems = @[[aStoryBoardObj instantiateViewControllerWithIdentifier:@"FMS_tabNavCtrlDashboard"],[aStoryBoardObj instantiateViewControllerWithIdentifier:@"FMS_tabNavCtrlAvailable"],[aStoryBoardObj instantiateViewControllerWithIdentifier:@"FMS_tabNavCtrlAssigned"],[aStoryBoardObj instantiateViewControllerWithIdentifier:@"FMS_tabNavCtrlDelivered"],[aStoryBoardObj instantiateViewControllerWithIdentifier:@"FMS_tabNavCtrlMissed"]];
            
            aArrItemImages = @[@{@"SelImage":@"dashboard-selected" , @"UnSelImage":@"dashboard"},@{@"SelImage":@"available-selected" , @"UnSelImage":@"available"},@{@"SelImage":@"assigned-selected" , @"UnSelImage":@"assigned"},@{@"SelImage":@"delivered-selected" , @"UnSelImage":@"delivered"},@{@"SelImage":@"missed-selected" ,@"UnSelImage":@"missed"}];
            
            aArrItemImagesIPhone6 = @[@{@"SelImage":@"dashboard-selected_6@2x.png" , @"UnSelImage":@"dashboard_6@2x.png"},@{@"SelImage":@"available-selected_6@2x.png" , @"UnSelImage":@"available_6@2x.png"},@{@"SelImage":@"assigned-selected_6@2x.png" , @"UnSelImage":@"assigned_6@2x.png"},@{@"SelImage":@"delivered-selected_6@2x.png" , @"UnSelImage":@"delivered_6@2x.png"},@{@"SelImage":@"missed-selected_6@2x.png" ,@"UnSelImage":@"missed_6@2x.png"}];
        }
        else
        {
            aArrItems = @[[aStoryBoardObj instantiateViewControllerWithIdentifier:@"FMS_tabNavCtrlDashboard"],[aStoryBoardObj instantiateViewControllerWithIdentifier:@"FMS_tabNavCtrlAssigned"],[aStoryBoardObj instantiateViewControllerWithIdentifier:@"FMS_tabNavCtrlDelivered"],[aStoryBoardObj instantiateViewControllerWithIdentifier:@"FMS_tabNavCtrlMissed"]];
            
            aArrItemImages = @[@{@"SelImage":@"dashboard-selected_4tab" , @"UnSelImage":@"dashboard_4tab"},@{@"SelImage":@"assigned-selected_4tab" , @"UnSelImage":@"assigned_4tab"},@{@"SelImage":@"delivered-selected_4tab" , @"UnSelImage":@"delivered_4tab"},@{@"SelImage":@"missed-selected_4tab" ,@"UnSelImage":@"missed_4tab"}];
            
            aArrItemImagesIPhone6 = @[@{@"SelImage":@"dashboard-selected_4tab_6@2x.png" , @"UnSelImage":@"dashboard_4tab_6@2x.png"},@{@"SelImage":@"assigned-selected_4tab_6@2x.png" , @"UnSelImage":@"assigned_4tab_6@2x.png"},@{@"SelImage":@"delivered-selected_4tab_6@2x.png" , @"UnSelImage":@"delivered_4tab_6@2x.png"},@{@"SelImage":@"missed-selected_4tab_6@2x.png" ,@"UnSelImage":@"missed_4tab_6@2x.png"}];

        }
        
        
        [self setViewControllers:aArrItems];
       
        for(int i = 0 ; i < aArrItems.count ; i++)
        {
            NSDictionary *aDictRef = IS_IPHONE_6? aArrItemImagesIPhone6[i] : aArrItemImages[i];
            
            [self setTabbarImage:[UIImage imageNamed:aDictRef[@"SelImage"]] imgUnSelected:[UIImage imageNamed:aDictRef[@"UnSelImage"]] intTag:i strTitle:@""];
            
        }

        
        
        
//        for(int i=0;i<[self.tabBar.items count];i++)
//        {
//
//            if(i==0)
//            {
//                
//                if(IS_IPHONE_6)
//                {
//                   [self setTabbarImage:[UIImage imageNamed:@"dashboard-selected_6@2x.png"] imgUnSelected:[UIImage imageNamed:@"dashboard_6@2x.png"] intTag:i strTitle:@""];
//                }
//                else
//                [self setTabbarImage:[UIImage imageNamed:@"dashboard-selected"] imgUnSelected:[UIImage imageNamed:@"dashboard"] intTag:i strTitle:@""];
//            }
//            else if(i==1)
//            {
//                if(IS_IPHONE_6)
//                {
//                    [self setTabbarImage:[UIImage imageNamed:@"available-selected_6@2x.png"] imgUnSelected:[UIImage imageNamed:@"available_6@2x.png"] intTag:i strTitle:@""];
//                }
//                else
//                [self setTabbarImage:[UIImage imageNamed:@"available-selected"] imgUnSelected:[UIImage imageNamed:@"available"] intTag:i strTitle:@""];
//            }
//            else if(i==2)
//            {
//                if(IS_IPHONE_6)
//                {
//                    [self setTabbarImage:[UIImage imageNamed:@"assigned-selected_6@2x.png"] imgUnSelected:[UIImage imageNamed:@"assigned_6@2x.png"] intTag:i strTitle:@""];
//                }
//                else
//                [self setTabbarImage:[UIImage imageNamed:@"assigned-selected"] imgUnSelected:[UIImage imageNamed:@"assigned"] intTag:i strTitle:@""];
//            }
//            else if(i==3)
//            {
//                if(IS_IPHONE_6)
//                {
//                    [self setTabbarImage:[UIImage imageNamed:@"delivered-selected_6@2x.png"] imgUnSelected:[UIImage imageNamed:@"delivered_6@2x.png"] intTag:i strTitle:@""];
//                }
//                else
//                [self setTabbarImage:[UIImage imageNamed:@"delivered-selected"] imgUnSelected:[UIImage imageNamed:@"delivered"] intTag:i strTitle:@""];
//            }
//            else if(i==4)
//            {
//                if(IS_IPHONE_6)
//                {
//                     [self setTabbarImage:[UIImage imageNamed:@"missed-selected_6@2x.png"] imgUnSelected:[UIImage imageNamed:@"missed_6@2x.png"] intTag:i strTitle:@""];
//                }
//                else
//                [self setTabbarImage:[UIImage imageNamed:@"missed-selected"] imgUnSelected:[UIImage imageNamed:@"missed"] intTag:i strTitle:@""];
//            }
////            else if(i==3)
////            {
////                [self setTabbarImage:[UIImage imageNamed:@"assist-icon-selected.png"] imgUnSelected:[UIImage imageNamed:@"assist-icon.png"] intTag:i strTitle:@"Assist"];
////            }
//        }
        
    }
    @catch (NSException *exception) {
        NSLog(@"setupTabBar :%@",exception);
    }
    @finally {
    }
}

-(void)setTabbarImage:(UIImage *)aImgSelected imgUnSelected:(UIImage *)aImgUnSelected intTag:(int)aIntTag strTitle:(NSString *)aStrtitle
{
    @try {
        UIImage *aImgTabSel = aImgSelected;
        UIImage *aImgTabUnSel = aImgUnSelected;
        
        UITabBarItem *aTabBarItem = [[self.tabBar items] objectAtIndex:aIntTag];
         aTabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);
        //aTabBarItem.titlePositionAdjustment = UIOffsetMake(0.0, -3.0);
        
        //[[UITabBarItem appearance] setTitleTextAttributes:@{ NSForegroundColorAttributeName : [UIColor colorWithRed:233.0/255.0 green:99.0/255.0 blue:0.0 alpha:1.0] } forState:UIControlStateSelected];
       

        aTabBarItem.title=@"";
        aImgTabSel = [aImgTabSel imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        aImgTabUnSel = [aImgTabUnSel imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        aTabBarItem.selectedImage=aImgTabSel;
        aTabBarItem.image=aImgTabUnSel;

    }
    @catch (NSException *exception) {
        NSLog(@"setTabbarImage :%@",exception);
    }
    @finally {
    }
}

#pragma mark - Memory Management Methods

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}



@end
