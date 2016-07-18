// Copyright 2015 Google Inc.

#import <GoogleCast/GCKDefines.h>

@class GCKLaunchOptions;

/**
 * Options that affect the discovery of Cast devices and the behavior of Cast sessions.
 *
 * @since 3.0
 */
GCK_EXPORT
@interface GCKCastOptions : NSObject <NSCopying>

/**
 * Constructs a new GCKCastOptions object with the specified receiver application ID.
 *
 * @param applicationID The ID of the receiver application which must be supported by discovered
 * Cast devices, and which will be launched when starting a new Cast session.
 */
- (instancetype)initWithReceiverApplicationID:(NSString *)applicationID;

/**
 * Constructs a new GCKCastOptions object with the specified list of namespaces.
 *
 * @param namespaces A list of namespaces which must be supported by the currently running receiver
 * application on each discovered Cast device.
 */
- (instancetype)initWithSupportedNamespaces:(NSArray<NSString *> *)namespaces;

/**
 * The receiver launch options to use when starting a Cast session.
 */
@property(nonatomic, copy, readwrite) GCKLaunchOptions *launchOptions;

@end
