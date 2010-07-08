//
//  PageController.h
//  CoreTextWrapper
//
//  Created by Adrian on 7/8/10.
//  Copyright 2010 akosma software. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AKOMultiPageTextView;
@class AKOCustomFontLabel;

@interface PageController : UIViewController 
{
@private
    AKOMultiPageTextView *_multiPageView;
    AKOCustomFontLabel *_label;
    CGFloat _previousScale;
    CGFloat _fontSize;
}

@property (nonatomic, retain) IBOutlet AKOCustomFontLabel *label;
@property (nonatomic, retain) IBOutlet AKOMultiPageTextView *multiPageView;

@end
