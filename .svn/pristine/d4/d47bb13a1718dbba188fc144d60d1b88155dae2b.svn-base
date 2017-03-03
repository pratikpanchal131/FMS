//
//  SlideToCancelViewController.h
//  SlideToCancel
//

#import <UIKit/UIKit.h>

@protocol SlideToCancelDelegate;

@interface SlideToCancelViewController : UIViewController {
	
    UISlider *slider;
	UILabel *label;
    UIImageView *imgView;
	NSTimer *animationTimer;
	BOOL touchIsDown;
}

@property (nonatomic, assign) id <SlideToCancelDelegate> delegate;


@property (nonatomic) BOOL enabled;

// Access the UILabel, e.g. to change text or color
@property (nonatomic, readonly) UILabel *label;
@property (nonatomic,readonly) UIImageView *imgView;

@end

@protocol SlideToCancelDelegate

@required
- (void) cancelled;

@end
