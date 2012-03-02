//
//  PageController.m
//  CoreTextWrapper
//
//  Created by Adrian on 7/8/10.
//  Copyright 2010 akosma software. All rights reserved.
//

#import "PageController.h"
#import "AKOMultiPageTextView.h"
#import "NSString+BundleExtensions.h"
#import "UIFont+CoreTextExtensions.h"

@interface PageController ()

@property (nonatomic) CGFloat previousScale;
@property (nonatomic) CGFloat fontSize;

@end


@implementation PageController

@synthesize multiPageView = _multiPageView;
@synthesize label = _label;
@synthesize previousScale = _previousScale;
@synthesize fontSize = _fontSize;

- (void)dealloc 
{
    self.label = nil;
    self.multiPageView = nil;
    [super dealloc];
}

#pragma mark -
#pragma mark UIViewController methods

- (void)viewDidLoad 
{
    [super viewDidLoad];
    self.label.text = @"News of the Day";
    self.label.font = [UIFont fontWithName:@"Polsku" size:34.0];
    self.label.shadowColor = [UIColor lightGrayColor];
    self.label.shadowOffset = CGSizeMake(2, 2);
    

    self.fontSize = 24.0;
    
    self.multiPageView.dataSource = self;
     self.multiPageView.columnInset = CGPointMake(50, 30);
    self.multiPageView.text = [NSString stringFromFileNamed:@"lorem_ipsum.txt"];
    self.multiPageView.font = [UIFont fontWithName:@"Georgia" size:self.fontSize];
    self.multiPageView.columnCount = UIInterfaceOrientationIsPortrait(self.interfaceOrientation) ? 2 : 3;

    UIPinchGestureRecognizer *pinchRecognizer = [[[UIPinchGestureRecognizer alloc] initWithTarget:self 
                                                                                           action:@selector(changeTextSize:)] autorelease];
    [self.multiPageView addGestureRecognizer:pinchRecognizer];
}

- (UIView*)akoMultiColumnTextView:(AKOMultiColumnTextView*)textView viewForColumn:(NSInteger)column onPage:(NSInteger)page
{
    if (page == 0 && column == 1)
    {
        UIView *view = [[[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 200)] autorelease];
        view.backgroundColor = [UIColor redColor];
        return view;
    }
        
    return nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation 
{
    return YES;
}

- (void)didReceiveMemoryWarning 
{
    [super didReceiveMemoryWarning];
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation 
                                         duration:(NSTimeInterval)duration
{
    if (UIInterfaceOrientationIsPortrait(interfaceOrientation))
    {
        self.multiPageView.columnCount = 2;
    }
    else
    {
        self.multiPageView.columnCount = 3;
    }
    [self.multiPageView setNeedsDisplay];
    [self.label setNeedsDisplay];
}

#pragma mark -
#pragma mark Gesture recognizer methods

- (void)changeTextSize:(UIPinchGestureRecognizer *)recognizer
{
    if (recognizer.state == UIGestureRecognizerStateBegan)
    {
        self.previousScale = recognizer.scale;
    }
    else if (recognizer.state == UIGestureRecognizerStateChanged)
    {
        if (recognizer.scale > self.previousScale)
        {
            if (self.fontSize < 48.0)
            {
                self.fontSize += 0.25;
            }
        }
        else 
        {
            if (self.fontSize > 12.0)
            {
                self.fontSize -= 0.25;
            }
        }
        
        self.multiPageView.font = [UIFont fontWithName:@"Georgia" size:self.fontSize];
        self.previousScale = recognizer.scale;
    }
}

@end

