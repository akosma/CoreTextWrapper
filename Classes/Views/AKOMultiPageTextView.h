//
//  AKOMultiPageTextView.h
//  CoreTextWrapper
//
//  Created by Adrian on 4/28/10.
//  Copyright 2010 akosma software. All rights reserved.
//

#import <UIKit/UIKit.h>

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
}

@property (nonatomic, copy) NSString *text;
@property (nonatomic, retain) UIFont *font;
@property (nonatomic, retain) UIColor *color;
@property (nonatomic) NSInteger columnCount;

@end
