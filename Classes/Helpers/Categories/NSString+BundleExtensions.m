//
//  NSString+BundleExtensions.m
//  CoreTextWrapper
//
//  Created by Adrian on 4/28/10.
//  Copyright 2010 akosma software. All rights reserved.
//

#import "NSString+BundleExtensions.h"

@implementation NSString (BundleExtensions)

+ (NSString *)stringFromFileNamed:(NSString *)bundleFileName
{
    NSString *path = [[NSBundle mainBundle] pathForResource:bundleFileName ofType:nil];
    NSString *text = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    return text;
}

@end
