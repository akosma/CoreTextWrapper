//
//  AKOMultiColumnTextView.h
//  CoreTextWrapper
//
//  Created by Adrian on 4/24/10.
//  Copyright 2010 akosma software. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreText/CoreText.h>
#import "AKOMultiColumnTextViewDataSource.h"

@interface AKOMultiColumnTextView : UIView 
{
@private
    NSInteger _columnCount;
    UIFont *_font;
    NSString *_text;
    NSArray *_texts;
    NSMutableAttributedString *_attributedString;
    NSMutableArray *_attributedStrings;
    UIColor *_color;
    CFMutableArrayRef _columnPaths;
    CFMutableArrayRef _frames;
    CFIndex _startIndex;
    CFIndex _finalIndex;
    BOOL _moreTextAvailable;
    
    CTLineBreakMode             _lineBreakMode;
    CTTextAlignment             _textAlignment;
    CGFloat                     _firstLineHeadIndent;
    CGFloat                     _spacing;
    CGFloat                     _topSpacing;
    CGFloat                     _lineSpacing;
    CGPoint                     _columnInset;
    
    NSInteger _page;
    id <AKOMultiColumnTextViewDataSource> _dataSource;
}

@property (nonatomic) NSInteger columnCount;
@property (nonatomic, retain) UIFont *font;
@property (nonatomic, copy) NSString *text;
@property (nonatomic, copy) NSArray *texts;
@property (nonatomic, retain) UIColor *color;
@property (nonatomic) CFIndex startIndex;
@property (nonatomic, readonly) CFIndex finalIndex;
@property (nonatomic, readonly) BOOL moreTextAvailable;

@property (nonatomic, assign) CTLineBreakMode   lineBreakMode;
@property (nonatomic, assign) CTTextAlignment   textAlignment;
@property (nonatomic, assign) CGFloat           firstLineHeadIndent;
@property (nonatomic, assign) CGFloat           spacing;
@property (nonatomic, assign) CGFloat           topSpacing;
@property (nonatomic, assign) CGFloat           lineSpacing;
@property (nonatomic, assign) CGPoint           columnInset;

@property (nonatomic, assign)     id <AKOMultiColumnTextViewDataSource> dataSource;

@end


