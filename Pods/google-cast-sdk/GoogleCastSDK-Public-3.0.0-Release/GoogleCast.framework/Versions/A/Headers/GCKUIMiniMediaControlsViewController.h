// Copyright 2016 Google Inc.

/** @cond ENABLE_FEATURE_GUI */

#import <GoogleCast/GCKDefines.h>

/**
 * @file GCKUIMiniMediaControlsViewController.h
 */

#if TARGET_OS_IPHONE

@protocol GCKUIMiniMediaControlsViewControllerDelegate;

/**
 * A view controller which implements the "now playing" control bar. In its default configuration,
 * it displays a thumbnail, title, and subtitle for the current media item, a stream progress bar,
 * and a play/pause toggle button.
 *
 * See GCKUIMiniMediaControlsViewControllerDelegate for the delegate protocol.
 *
 * @since 3.0
 */
GCK_EXPORT
@interface GCKUIMiniMediaControlsViewController : UIViewController

/**
 * The view controller's delgate, typically a full-screen view controller in charge of presenting
 * and hiding this control bar when appropriate.
 */
@property(nonatomic, weak, readwrite) id<GCKUIMiniMediaControlsViewControllerDelegate> delegate;

/**
 * Indicates the display state of the control bar. When <code>YES</code>, there is media being
 * casted which can be controlled by the control bar, and it can be made visible. When
 * <code>NO</code>, the control bar should be hidden.
 */
@property(nonatomic, assign, readonly) BOOL active;

/** The minimal (and preferred) height at which this view should be presented. */
@property(nonatomic, assign, readonly) CGFloat minHeight;

@end

/**
 * The GCKUIMiniMediaControlsViewController delegate protocol.
 *
 * @since 3.0
 */
@protocol GCKUIMiniMediaControlsViewControllerDelegate <NSObject>

/**
 * Notifies about a change in the active state of the control bar.
 *
 * @param miniMediaControlsViewController The now playing view controller instance.
 * @param shouldAppear If <code>YES</code>, the control bar can be displayed. If <code>NO</code>,
 *     the control bar should be hidden.
 */

- (void)miniMediaControlsViewController:
            (GCKUIMiniMediaControlsViewController *)miniMediaControlsViewController
                           shouldAppear:(BOOL)shouldAppear;

@end

#endif  // TARGET_OS_IPHONE

/** @endcond */
