// Copyright 2015 Google Inc.

#import <Foundation/Foundation.h>

#import <GoogleCast/GCKCommon.h>
#import <GoogleCast/GCKDefines.h>

@class GCKCastOptions;
@class GCKDiscoveryManager;
@class GCKDeviceProvider;
@class GCKSessionManager;

/**
 * The <code>userInfo</code> key for the new Cast state in a Cast state change notification.
 *
 * @memberof GCKCastContext
 */
GCK_EXTERN NSString *const kGCKNotificationKeyCastState;

/**
 * The name of the notification that will be published when the Cast state changes.
 *
 * @memberof GCKCastContext
 */
GCK_EXTERN NSString *const kGCKCastStateDidChangeNotification;

/**
 * The name of the notification that will be published when the expanded media controls should be
 * presented to users.
 *
 * @memberof GCKUICastContainerViewController
 */
GCK_EXTERN NSString *const kGCKExpandedMediaControlsTriggeredNotification;

/**
 * A class containing global objects and state for the framework. The context must be initialized
 * early in the application's lifecycle via a call to @ref setSharedInstanceWithOptions:.
 *
 * @since 3.0
 */
GCK_EXPORT
@interface GCKCastContext : NSObject

/**
 * The current casting state for the application. Changes to this property can be monitored with
 * KVO or by listening for @ref kGCKCastStateDidChangeNotification notifications.
 */
@property(nonatomic, assign, readonly) GCKCastState castState;

/**
 * The discovery manager. This object handles the discovery of receiver devices.
 */
@property(nonatomic, strong, readonly) GCKDiscoveryManager *discoveryManager;

/**
 * The session manager. This object manages the interaction with receiver devices.
 */
@property(nonatomic, strong, readonly) GCKSessionManager *sessionManager;

/**
 * Sets the shared instance, supplying a Cast options object. If the shared instance is already
 * initialized, an exception will be thrown.
 */
+ (void)setSharedInstanceWithOptions:(GCKCastOptions *)options;

/**
 * Returns the singleton instance. If a shared instance has not yet been initialized, an exception
 * will be thrown.
 */
+ (instancetype)sharedInstance;

/**
 * Registers a device provider, which adds support for a new type of (non-Cast) device.
 *
 * @param deviceProvider An instance of a GCKDeviceProvider subclass for managing the devices.
 */
- (void)registerDeviceProvider:(GCKDeviceProvider *)deviceProvider;

/**
 * Unregisters the device provider for a given device category.
 *
 * @param category A string that uniquely identifies the type of device.
 */
- (void)unregisterDeviceProviderForCategory:(NSString *)category;

@end
