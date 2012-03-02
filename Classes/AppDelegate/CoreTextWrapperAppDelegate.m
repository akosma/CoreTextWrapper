//
//  CoreTextWrapperAppDelegate.m
//  CoreTextWrapper
//
//  Created by Adrian on 7/8/10.
//  Copyright akosma software 2010. All rights reserved.
//

#import "CoreTextWrapperAppDelegate.h"
#import "PageController.h"

@implementation CoreTextWrapperAppDelegate

@synthesize window = _window;
@synthesize pageController = _pageController;


#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions 
{
    self.window.rootViewController = self.pageController;
    [self.window makeKeyAndVisible];
	
	return YES;
}

#pragma mark -
#pragma mark Memory management

- (void)dealloc 
{
    [_window release];
    [super dealloc];
}


@end
