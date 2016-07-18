// Copyright 2015 Google Inc. All Rights Reserved.

/** @cond ENABLE_FEATURE_GUI */

#import <GoogleCast/GCKDefines.h>

#if TARGET_OS_IPHONE

#import <UIKit/UIKit.h>

@class GCKUIMiniMediaControlsViewController;
@class GCKUINextUpViewController;

/**
 * A view controller which wraps another View Controller and adds a media playback notification
 * area below that controller. The notification can display a "now playing" item
 * that displays a thumbnail, title, and subtitle for the current media item, a stream progress bar,
 * and a play/pause toggle button. The controller shows and hides this item as appropriate
 * based on the current media playback state on the receiver.
 *
 * @since 3.0
 */
GCK_EXPORT
@interface GCKUICastContainerViewController : UIViewController

/** The view controller to be embedded as the content area of this view controller. */
@property(nonatomic, strong, readonly) UIViewController *contentViewController;

/** The "now playing" view controller. */
@property(nonatomic, strong, readonly)
    GCKUIMiniMediaControlsViewController *miniMediaControlsViewController;

/**
 * A flag indicating whether the "now playing" item should be enabled. If enabled, the item will
 * be displayed automatically whenever there is media content loaded or playing on the receiver.
 * The default value is <code>NO</code>.
 */
@property(nonatomic, assign, readwrite) BOOL miniMediaControlsItemEnabled;

@end

#endif  // TARGET_OS_IPHONE

/** @endcond */
