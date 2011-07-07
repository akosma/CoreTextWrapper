//
//  AKOMultiColumnTextViewDataSource.h
//  CoreTextWrapper
//
//  Created by Christian Menschel on 12.05.11.
//  Copyright 2011 akosma software. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AKOMultiColumnTextView;

@protocol AKOMultiColumnTextViewDataSource <NSObject>

@optional

- (UIView*)akoMultiColumnTextView:(AKOMultiColumnTextView*)textView viewForColumn:(NSInteger)column onPage:(NSInteger)page;


@end