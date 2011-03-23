//
//  AKOCustomFontView.m
//  CoreTextWrapper
//
//  Created by Adrian on 6/19/10.
//  Copyright 2010 akosma software. All rights reserved.
//

#import "AKOCustomFontLabel.h"
#import "UIFont+CoreTextExtensions.h"

@interface AKOCustomFontLabel ()

- (void)setup;

@end


@implementation AKOCustomFontLabel

@dynamic text;
@dynamic textColor;
@dynamic shadowOffset;
@dynamic shadowColor;

#pragma mark -
#pragma mark Init and dealloc

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if ((self = [super initWithCoder:aDecoder]))
    {
        [self setup];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame 
{
    if ((self = [super initWithFrame:frame])) 
    {
        [self setup];
    }
    return self;
}

- (void)setup
{
    self.font = [UIFont systemFontOfSize:17.0].CTFont;
    self.textColor = [UIColor blackColor];
    self.text = @"";
    self.shadowColor = [UIColor whiteColor];
    self.shadowOffset = CGSizeMake(0,0);
}

- (void)dealloc 
{
    self.text = nil;
    self.textColor = nil;
    self.font = nil;
    self.shadowColor = nil;
    [super dealloc];
}

#pragma mark -
#pragma mark UIView methods

- (void)drawRect:(CGRect)rect 
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGAffineTransform shadowFlip = CGAffineTransformMake(1.0, 0.0, 0.0, -1.0, 0.0, self.frame.size.height);
    CGContextConcatCTM(context, shadowFlip);
    
    if ((_shadowOffset.width != 0) || (_shadowOffset.height != 0)) {
        // Initialize string, font, and context
        CFStringRef shadowKeys[] = { kCTFontAttributeName, kCTForegroundColorAttributeName };
        CFTypeRef shadowValues[] = { self.font, self.shadowColor.CGColor };
        
        CFDictionaryRef shadowAttributes =
        CFDictionaryCreate(kCFAllocatorDefault, (const void**)&shadowKeys,
                           (const void**)&shadowValues, sizeof(shadowKeys) / sizeof(shadowKeys[0]),
                           &kCFTypeDictionaryKeyCallBacks,
                           &kCFTypeDictionaryValueCallBacks);
        
        CFAttributedStringRef shadowAttrString = CFAttributedStringCreate(kCFAllocatorDefault, (CFStringRef)self.text, shadowAttributes);
        CFRelease(shadowAttributes);
        
        CTLineRef shadowLine = CTLineCreateWithAttributedString(shadowAttrString);
        CFRelease(shadowAttrString);
        
        // Set text position and draw the line into the graphics context
        CGContextSetTextPosition(context, _shadowOffset.width, 20.0-_shadowOffset.height);
        CTLineDraw(shadowLine, context);
    }
   


    // Initialize string, font, and context
    CFStringRef keys[] = { kCTFontAttributeName, kCTForegroundColorAttributeName };
    CFTypeRef values[] = { self.font, self.textColor.CGColor };
    
    CFDictionaryRef attributes =
    CFDictionaryCreate(kCFAllocatorDefault, (const void**)&keys,
                       (const void**)&values, sizeof(keys) / sizeof(keys[0]),
                       &kCFTypeDictionaryKeyCallBacks,
                       &kCFTypeDictionaryValueCallBacks);
    
    CFAttributedStringRef attrString = CFAttributedStringCreate(kCFAllocatorDefault, (CFStringRef)self.text, attributes);
    CFRelease(attributes);
    
    CTLineRef line = CTLineCreateWithAttributedString(attrString);
    CFRelease(attrString);
    
    // Set text position and draw the line into the graphics context
    CGContextSetTextPosition(context, 0.0, 20.0);
    CTLineDraw(line, context);
    CFRelease(line);
}

#pragma mark -
#pragma mark Setters and getters

- (NSString *)text
{
    return _text;
}

- (void)setText:(NSString *)newText
{
    if (![self.text isEqualToString:newText])
    {
        [_text release];
        _text = [newText copy];
        
        [self setNeedsDisplay];
    }
}

- (UIColor *)textColor
{
    return _textColor;
}

- (void)setTextColor:(UIColor *)newColor
{
    if (newColor != self.textColor)
    {
        [_textColor release];
        _textColor = [newColor retain];
        
        [self setNeedsDisplay];
    }
}

- (CTFontRef)font
{
    return _font;
}

- (void)setFont:(CTFontRef)newFont
{
    if (_font != NULL)
    {
        CFRelease(_font);
    }
    _font = CFRetain(newFont);
    [self setNeedsDisplay];
}


- (UIColor *)shadowColor
{
    return _shadowColor;
}

- (void)setShadowColor:(UIColor *)newColor
{
    if (newColor != self.shadowColor)
    {
        [_shadowColor release];
        _shadowColor = [newColor retain];
        _shadowSubview.textColor = _shadowColor;
        
        [self setNeedsDisplay];
    }
}

- (CGSize)shadowOffset
{
    return _shadowOffset;
}

- (void)setShadowOffset:(CGSize)newShadowOffset
{
    _shadowOffset = newShadowOffset;
    [self setNeedsDisplay];
}

@end
