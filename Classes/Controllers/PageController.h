//
//  PageController.h
//  CoreTextWrapper
//
//  Created by Adrian on 7/8/10.
//  Copyright 2010 akosma software. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AKOMultiColumnTextViewDataSource.h"


@class AKOMultiPageTextView;

@interface PageController : UIViewController  <AKOMultiColumnTextViewDataSource>
{
@private
    AKOMultiPageTextView *_multiPageView;
    UILabel *_label;
    CGFloat _previousScale;
    CGFloat _fontSize;
}

@property (nonatomic, retain) IBOutlet UILabel *label;
@property (nonatomic, retain) IBOutlet AKOMultiPageTextView *multiPageView;

@end
