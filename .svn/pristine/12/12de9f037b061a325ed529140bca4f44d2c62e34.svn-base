//
//  MonthPicker.h
//  FMS
//
//  Created by indianic on 12/08/15.
//  Copyright (c) 2015 indianic. All rights reserved.
//



#import <UIKit/UIKit.h>

#ifndef IBInspectable
#define IBInspectable
#endif

@class MonthPicker;

/**
 Defines a set of optional methods you can use to receive change-related
 messages for MonthPicker objects.  All of the methods in this protocol are
 optional.  Typically, the delegate implements other optional methods to
 respond to new selections.
 */
@protocol MonthPickerDelegate <NSObject>

@optional

/**
 Tells the delegate that a specified date is about to be selected.
 @param monthPicker A month picker object informing the delegate about the
 impending selection.
 */
- (void)monthPickerWillChangeDate:(MonthPicker *)monthPicker;
/**
 Tells the delegate that a specified date has been selected.
 @param monthPicker A month picker object informing the delegate about the
 committed selection.
 */
- (void)monthPickerDidChangeDate:(MonthPicker *)monthPicker;

@end

/**
 The MonthPicker class implements an object that uses multiple rotating
 wheels to allow users to select a month and year.  This is similar to both
 iOS's UIDatePicker set to Date-only mode without the day element and Mobile
 Safari's picker view that appears for an `<input type="month" />` tag.
 
 Unlike UIDatePicker, MonthPicker does inherit from UIPickerView.  It does
 use both UIPickerViewDataSource and UIPickerViewDelegate, but presents a
 monthPickerDelegate property.
 */
@interface MonthPicker : UIPickerView<UIPickerViewDataSource, UIPickerViewDelegate>

/**
 The designated delegate for the month picker.
 @warning **Important:** The delegate property is already used internally for
 UIPickerView's delegate - **please don't read from or assign to it**!
 */
@property (nonatomic, weak) id<MonthPickerDelegate> monthPickerDelegate;

/**
 The date represented by the month picker.
 
 The day component is ignored when written, and set to 1 when read.
 */
@property (nonatomic, strong) IBInspectable NSDate* date;

/// The calendar currently being used
@property (nonatomic, strong, readonly) NSCalendar *calendar;

/// The minimum year that a month picker can show.
@property (nonatomic) IBInspectable NSInteger minimumYear;

/// The maximum year that a month picker can show.
@property (nonatomic) IBInspectable NSInteger maximumYear;

/// A Boolean value that determines whether the year is shown first.
@property (nonatomic) IBInspectable BOOL yearFirst;

/// A Boolean value that determines whether the month wraps
@property (nonatomic) IBInspectable BOOL wrapMonths;

/// A Boolean value that determines whether the current month & year are coloured.
@property (nonatomic) BOOL enableColourRow;

/// en-US alias for `enableColourRow`.
@property (nonatomic, getter = enableColourRow, setter = setEnableColourRow:) IBInspectable BOOL enableColorRow;

/// Font to be used for all rows.  Default: System Bold, size 24.
@property (nonatomic, strong) UIFont *font;

/// Colour to be used for all "non coloured" rows.  Default: Black.
@property (nonatomic, strong) UIColor *fontColour;

/// en-US alias for `fontColour`.
@property (nonatomic, strong, getter = fontColour, setter = setFontColour:) IBInspectable UIColor *fontColor;

/**
 Designated initialiser.
 
 Initializes and returns a newly allocated month picker with the current calendar,
 month & year.
 */
-(id)init;

/**
 Initializes and returns a newly allocated month picker with the specified
 date and current calendar.
 @param date The date to be represented by the month picker -  the day
 component will be ignored.
 */
-(id)initWithDate:(NSDate *)date;

/**
 Initializes and returns a newly allocated month picker with the specified
 date and current calendar.
 @param date The date to be represented by the month picker -  the day
 component will be ignored.
 @param calendar The calendar to used by the date.
 */
-(id)initWithDate:(NSDate *)date calendar:(NSCalendar *)calendar;

@end
