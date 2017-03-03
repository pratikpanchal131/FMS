//
//  SlideToCancelViewController.m
//  SlideToCancel
//
// The slider track and thumb images were made from a screen shot of the iPhone's home
// screen. Apple may object to use of these images in an app. I have not yet had an app
// approved (or rejected either) using these images. Use at your own risk.


#import <QuartzCore/QuartzCore.h>
#import "SlideToCancelViewController.h"

@interface SlideToCancelViewController()

@end

@implementation SlideToCancelViewController

@synthesize delegate;

// Implement the "enabled" property
- (BOOL) enabled
{
    return slider.enabled;
}

- (void) setEnabled:(BOOL)enabled
{
    slider.enabled = enabled;
    label.enabled = enabled;
    if (enabled) {
        slider.value = 0.0;
        label.alpha = 1.0;
        imgView.alpha = 1.0;
        touchIsDown = NO;
    }
}

- (UILabel *)label
{
    // Access the view, which will force loadView to be called
    // if it hasn't already been, which will create the label
    (void)[self view];
    return label;
}

- (UIImageView *)imgView
{
    // Access the view, which will force loadView to be called
    // if it hasn't already been, which will create the label
    (void)[self view];
    return imgView;
}

// Implement loadView to create a view hierarchy programmatically, without using a nib.

- (void)loadView
{
    UIView *mainView = [[UIView alloc] initWithFrame:CGRectMake(0, [AppDelegate objSharedAppDel].window.frame.size.height-80, [AppDelegate objSharedAppDel].window.frame.size.width, 30)];
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(30, 0, [AppDelegate objSharedAppDel].window.frame.size.width-60, 30)];
    [view setBackgroundColor:[UIColor blackColor]];
    [view.layer setCornerRadius:15.0];
    [view setAlpha:0.7];
    
    // Add the slider with correct geometry centered over the track
    slider = [[UISlider alloc] initWithFrame:CGRectMake(40, 0, [AppDelegate objSharedAppDel].window.frame.size.width-100, 30)];
    slider.backgroundColor = [UIColor clearColor];
    [slider setMinimumTrackImage:[UIImage imageNamed:@"sliderMaxMin"] forState:UIControlStateNormal];
    [slider setMaximumTrackImage:[UIImage imageNamed:@"sliderMaxMin"] forState:UIControlStateNormal];
    UIImage *thumbImage = [UIImage imageNamed:@"ic-truck-green"];
    [slider setThumbImage:thumbImage forState:UIControlStateNormal];
    slider.minimumValue = 0.0;
    slider.maximumValue = 1.0;
    slider.continuous = YES;
    slider.value = 0.0;
    
    // Set the slider action methods
    [slider addTarget:self action:@selector(sliderUp:) forControlEvents:UIControlEventTouchUpInside];
    [slider addTarget:self action:@selector(sliderDown:) forControlEvents:UIControlEventTouchDown];
    [slider addTarget:self action:@selector(sliderChanged:) forControlEvents:UIControlEventValueChanged];
    
    // Create the label with the actual size required by the text
    // If you change the text, font, or font size by using the "label" property,
    // you may need to recalculate the label's frame.
    NSString *labelText = @"Drive right to skip login";
    CGSize labelSize = [labelText boundingRectWithSize:CGSizeMake(320, 15) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont fontWithName:@"Roboto-Regular" size:12.0] } context:nil].size;
    label = [[UILabel alloc] initWithFrame:CGRectMake((mainView.frame.size.width-labelSize.width)/2, (mainView.frame.size.height-labelSize.height)/2, labelSize.width, labelSize.height)];

    // Set other label attributes and add it to the view
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont fontWithName:@"Roboto-Regular" size:12.0];
    label.text = labelText;
    
    imgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ic-arrow"]];
    [imgView setFrame:CGRectMake(mainView.frame.size.width -50, (mainView.frame.size.height-imgView.frame.size.height)/2, imgView.frame.size.width, imgView.frame.size.height)];
    [imgView clipsToBounds];
    
    [mainView addSubview:view];
    [mainView addSubview:imgView];
    [mainView addSubview:label];
    [mainView addSubview:slider];
    
    // This property is set to NO (disabled) on creation.
    // The caller must set it to YES to animate the slider.
    // It should be set to NO (disabled) when the view is not visible, in order
    // to turn off the timer and conserve CPU resources.
    self.enabled = NO;
    
    // Set the view controller's view property to all of the above

    self.view = mainView;
    
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

// UISlider actions

- (void) sliderUp: (UISlider *) sender
{
    //filter out duplicate sliderUp events
    if (touchIsDown) {
        touchIsDown = NO;
        
        if (slider.value < 0.75)  //if the value is not the max, slide this bad boy back to zero
        {
            [slider setValue: 0 animated: YES];
            label.alpha = 1.0;
            //imgView.alpha = 1.0;
        }
        else
        {
            //tell the delagate we are slid all the way to the right
            [delegate cancelled];
        }
    }
}

- (void) sliderDown: (UISlider *) sender
{
    touchIsDown = YES;
}

- (void) sliderChanged: (UISlider *) sender
{
    // Fade the text as the slider moves to the right. This code makes the
    // text totally dissapear when the slider is 35% of the way to the right.
    label.alpha = MAX(0.0, 1.0 - (slider.value * 1.0));
    //imgView.alpha = MAX(0.0, 1.0 - (slider.value * 1.0));

    
    // Stop the animation if the slider moved off the zero point
    if (slider.value != 0) {
      
        [label.layer setNeedsDisplay];
        //[imgView.layer setNeedsDisplay];
    }
}

@end
