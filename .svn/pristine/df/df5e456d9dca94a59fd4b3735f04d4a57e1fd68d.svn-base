//
//  CustomTextField.m
//  FMS
//
//  Created by indianic on 10/08/15.
//  Copyright (c) 2015 indianic. All rights reserved.
//

#import "CustomTextField.h"

IB_DESIGNABLE
@implementation CustomTextField

- (void) setCornerRadius:(CGFloat)cornerRadius {
    self.layer.cornerRadius = cornerRadius;
}

- (CGFloat) cornerRadius {
    return self.layer.cornerRadius;
}
- (void) setBorderColor:(UIColor *)borderColor {
    self.layer.borderColor = borderColor.CGColor;
}
- (UIColor *) borderColor {
    return [UIColor colorWithCGColor:self.layer.borderColor];
}
- (void) setBorderWidth:(CGFloat)borderWidth {
    self.layer.borderWidth = borderWidth;
}
- (CGFloat) borderWidth {
    return self.layer.borderWidth;
}

-(CGRect)textRectForBounds:(CGRect)bounds{
    return CGRectInset(bounds, self.padding, self.padding);
}

-(CGRect)editingRectForBounds:(CGRect)bounds{
    return [self textRectForBounds:bounds];
}

- (void) setPlaceHolderColor:(UIColor *)placeHolderColor
{
    [self setValue:placeHolderColor forKeyPath:@"_placeholderLabel.textColor"];
}

@end
