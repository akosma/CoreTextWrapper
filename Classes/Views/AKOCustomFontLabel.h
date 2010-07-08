//
//  AKOCustomFontView.h
//  CoreTextWrapper
//
//  Created by Adrian on 6/19/10.
//  Copyright 2010 akosma software. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreText/CoreText.h>

@interface AKOCustomFontLabel : UIView 
{
@private
    CTFontRef _font;
    NSString *_text;
    UIColor *_textColor;
}

@property (nonatomic, copy) NSString *text;
@property (nonatomic, retain) UIColor *textColor;

- (CTFontRef)font;
- (void)setFont:(CTFontRef)customFont;

@end
