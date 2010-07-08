//
//  CoreTextWrapperAppDelegate.h
//  CoreTextWrapper
//
//  Created by Adrian on 7/8/10.
//  Copyright akosma software 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PageController;

@interface CoreTextWrapperAppDelegate : NSObject <UIApplicationDelegate> 
{
@private
    UIWindow *_window;
    PageController *_pageController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet PageController *pageController;

@end

