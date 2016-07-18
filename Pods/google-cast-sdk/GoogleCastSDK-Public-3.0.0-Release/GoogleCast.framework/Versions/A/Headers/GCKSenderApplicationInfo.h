// Copyright 2013 Google Inc.

#import <Foundation/Foundation.h>

#import <GoogleCast/GCKDefines.h>

/**
 * @file GCKSenderApplicationInfo.h
 */

/**
 * @enum GCKSenderApplicationInfoPlatform
 * Sender application platforms.
 */
typedef NS_ENUM(NSInteger, GCKSenderApplicationInfoPlatform) {
  /** Android. */
  GCKSenderApplicationInfoPlatformAndroid = 1,
  /** iOS. */
  GCKSenderApplicationInfoPlatformiOS = 2,
  /** Chrome. */
  GCKSenderApplicationInfoPlatformChrome = 3,
  /** Mac OS X. */
  GCKSenderApplicationInfoPlatformOSX = 4,
};

/**
 * Information about a sender application.
 */
GCK_EXPORT
@interface GCKSenderApplicationInfo : NSObject <NSCopying>

/** The sender application's platform. */
@property(nonatomic, readonly) GCKSenderApplicationInfoPlatform platform;

/** The sender application's unique identifier (app ID). */
@property(nonatomic, copy, readonly) NSString *appIdentifier;

/** The sender application's launch URL (URL scheme). */
@property(nonatomic, strong, readonly) NSURL *launchURL;

@end
