//
//  AKOMultiPageTextView.h
//  CoreTextWrapper
//
//  Created by Adrian on 4/28/10.
//  Copyright 2010 akosma software. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AKOMultiColumnTextViewDataSource.h"
#import <CoreText/CoreText.h>

@interface AKOMultiPageTextView : UIView <UIScrollViewDelegate>
{
@private
    NSMutableArray *_pages;
    NSString *_text;
    UIFont *_font;
    UIColor *_color;
    UIScrollView *_scrollView;
    NSInteger _columnCount;
    UIPageControl *_pageControl;
    BOOL _pageControlUsed;
    BOOL _scrollEnabled;
    
    CTLineBreakMode             _lineBreakMode;
    CTTextAlignment             _textAlignment;
    CGFloat                     _firstLineHeadIndent;
    CGFloat                     _spacing;
    CGFloat                     _topSpacing;
    CGFloat                     _lineSpacing;
    CGPoint                     _columnInset;
    
    id <AKOMultiColumnTextViewDataSource> _dataSource;
}

@property (nonatomic, copy) NSString *text;
@property (nonatomic, retain) UIFont *font;
@property (nonatomic, retain) UIColor *color;
@property (nonatomic) NSInteger columnCount;
@property (nonatomic, assign)  BOOL scrollEnabled;

@property (nonatomic, assign, getter=getCurrentPageIndex) NSInteger currentPageIndex;
@property (nonatomic, assign, getter=getLastPageIndex) NSInteger lastPageIndex;

@property (nonatomic, retain) UIPageControl     *pageControl;
@property (nonatomic, assign) CTLineBreakMode   lineBreakMode;
@property (nonatomic, assign) CTTextAlignment   textAlignment;
@property (nonatomic, assign) CGFloat           firstLineHeadIndent;
@property (nonatomic, assign) CGFloat           spacing;
@property (nonatomic, assign) CGFloat           topSpacing;
@property (nonatomic, assign) CGFloat           lineSpacing;
@property (nonatomic, assign) CGPoint           columnInset;

@property (nonatomic, assign)     id <AKOMultiColumnTextViewDataSource> dataSource;
@end
