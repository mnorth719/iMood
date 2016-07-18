// Copyright 2015 Google Inc.

/** @cond ENABLE_FEATURE_GUI */

#import <UIKit/UIKit.h>

#import <GoogleCast/GCKDefines.h>

/**
 * User interface utility methods.
 *
 * @since 3.0
 */
GCK_EXPORT
@interface GCKUIUtils : NSObject

#if TARGET_OS_IPHONE

/**
 * Returns the currently active view controller, by navigating through the view controller
 * hierarchy beginning with the root view controller.
 */
+ (UIViewController *)currentViewController;

#endif  // TARGET_OS_IPHONE

/** Formats a time interval in MM:SS or H:MM:SS format. */
+ (NSString *)timeIntervalAsString:(NSTimeInterval)timeInterval;

@end

/** @endcond */
