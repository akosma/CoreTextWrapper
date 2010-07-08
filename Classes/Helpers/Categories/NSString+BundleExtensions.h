//
//  NSString+BundleExtensions.h
//  CoreTextWrapper
//
//  Created by Adrian on 4/28/10.
//  Copyright 2010 akosma software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (BundleExtensions)

+ (NSString *)stringFromFileNamed:(NSString *)bundleFileName;

@end
