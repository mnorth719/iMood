// Copyright 2016 Google Inc.

/** @cond ENABLE_FEATURE_GUI */

#if TARGET_OS_IPHONE

#import <UIKit/UIKit.h>

#import <GoogleCast/GCKCastContext.h>
#import <GoogleCast/GCKCommon.h>
#import <GoogleCast/GCKDefines.h>

@class GCKUICastContainerViewController;
@class GCKUIMiniMediaControlsViewController;
@protocol GCKUIImageCache;
@protocol GCKUIImagePicker;

/**
 * A category on GCKCastContext containing UI-specific APIs.
 *
 * @since 3.0
 */
@interface GCKCastContext (UI)

/**
 * The image cache implementation that will be used by the framework to fetch images that are
 * referenced in media metadata. A default implementation will be used if one is not provided by the
 * application. May be set to <code>nil</code> to reinstate the default image cache.
 */
@property(nonatomic, strong, readwrite) id<GCKUIImageCache> imageCache;

/**
 * The image picker implementation that will be used to select an image for a specific purpose.
 * A default implementation will be used if one is not provided by the application. May be set to
 * <code>nil</code> to reinstate the default image picker.
 */
@property(nonatomic, strong, readwrite) id<GCKUIImagePicker> imagePicker;

/**
 * Displays the Cast dialog.
 */
- (void)presentCastDialog;

/**
 * Constructs a GCKUICastContainerViewController that embeds the given view controller.
 */
- (GCKUICastContainerViewController *)createCastContainerControllerForViewController:
    (UIViewController *)viewController;

/**
 * Constructs a GCKUIMiniMediaControlsViewController.
 */
- (GCKUIMiniMediaControlsViewController *)createMiniMediaControlsViewController;

/**
 * If it has not been shown before, presents a fullscreen modal view controller that calls attention
 * to the Cast button and displays some brief instructional text about its use.
 *
 * @return <code>YES</code> if the view controller was shown, <code>NO</code> if it was not shown
 * because it had already been shown before.
 */
- (BOOL)presentCastInstructionsViewControllerOnce;

/**
 * Clears the persistent flag that tracks whether the Cast instructions modal view controller has
 * been shown.
 */
- (void)clearCastInstructionsShownFlag;

@end

#endif  // TARGET_OS_IPHONE

/** @endcond */
