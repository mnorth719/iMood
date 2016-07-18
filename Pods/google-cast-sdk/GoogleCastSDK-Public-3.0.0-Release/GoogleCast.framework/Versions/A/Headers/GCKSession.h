// Copyright 2015 Google Inc.

#import <GoogleCast/GCKCommon.h>
#import <GoogleCast/GCKDefines.h>

@class GCKDevice;
@class GCKMediaMetadata;
@class GCKSessionTraits;

/**
 * An abstract base class representing a session with a receiver device. Subclasses must implement
 * the @ref start, @ref endAndStopCasting:, @ref suspendWithReason:, and @ref resume methods, and
 * must call the appropriate notifier methods (for example, @ref notifyDidStartWithSessionID:) to
 * indicate corresponding changes in the session state. Subclasses may also implement
 * @ref setDeviceVolume: and @ref setDeviceMuted: if the device supports such operations.
 *
 * A session is created and controlled using the session methods in GCKSessionManager, which uses
 * the appropriate GCKDeviceProvider to create the session, and then delegates session requests to
 * that GCKSession object.
 *
 * @since 3.0
 */
GCK_EXPORT
@interface GCKSession : NSObject

/** The device that this session is associated with. */
@property(nonatomic, strong, readonly) GCKDevice *device;

/** The current session ID, if any. */
@property(nonatomic, copy, readonly) NSString *sessionID;

/** The current session connection state. */
@property(nonatomic, assign, readonly) GCKConnectionState connectionState;

/** A flag indicating whether the session is currently suspended. */
@property(nonatomic, assign, readonly) BOOL suspended;

/** The current device status text. */
@property(nonatomic, copy, readonly) NSString *deviceStatusText;

/** The session traits. */
@property(nonatomic, copy, readonly) GCKSessionTraits *traits;

/** The current device volume, in the range [0.0, 1.0]. */
@property(nonatomic, assign, readonly) float currentDeviceVolume;

/** The current device mute state. */
@property(nonatomic, assign, readonly) BOOL currentDeviceMuted;

/**
 * The current media metadata, if any. Will be <code>nil</code> if the session does not support the
 * media namespace or if no media is currently loaded on the receiver.
 */
@property(nonatomic, strong, readonly) GCKMediaMetadata *mediaMetadata;

/**
 * Initializes a new session object for the given device.
 *
 * @param device The device.
 * @param traits The session traits.
 * @param sessionID The session ID of an existing session, if this object will be used to resume a
 * session; otherwise <code>nil</code> if it will be used to start a new session.
 */
- (instancetype)initWithDevice:(GCKDevice *)device
                        traits:(GCKSessionTraits *)traits
                     sessionID:(NSString *)sessionID;

/**
 * Sets the device's volume. This is an asynchronous operation. The default implementation is a
 * no-op.
 *
 * @param volume The new volume.
 */
- (void)setDeviceVolume:(float)volume;

/**
 * Sets the device's mute state. This is an asynchronous operation. The default implementation is a
 * no-op.
 *
 * @param muted The new mute state.
 */
- (void)setDeviceMuted:(BOOL)muted;

@end
