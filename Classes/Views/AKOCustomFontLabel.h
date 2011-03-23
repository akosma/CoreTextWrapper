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
    UIColor *_shadowColor;
    CGSize _shadowOffset;
    AKOCustomFontLabel *_shadowSubview;
}

@property (nonatomic, copy) NSString *text;
@property (nonatomic, retain) UIColor *textColor;
@property (nonatomic, retain) UIColor *shadowColor;
@property (nonatomic, assign) CGSize shadowOffset;

- (CTFontRef)font;
- (void)setFont:(CTFontRef)customFont;

@end
