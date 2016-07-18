// Copyright 2013 Google Inc.

#import <Foundation/Foundation.h>

#import <GoogleCast/GCKDefines.h>

@protocol GCKLoggerDelegate;
@class GCKLoggerFilter;

/**
 * A singleton object used for logging by the framework. If a delegate is assigned, the formatted
 * log messages are passed to the delegate. Otherwise, the messages are written using
 * <a href="https://goo.gl/EwUYP8"><b>NSLog()</b></a> in debug builds and are discarded otherwise.
 *
 * See GCKLoggerDelegate for the delegate protocol.
 */
GCK_EXPORT
@interface GCKLogger : NSObject

/** The delegate to pass log messages to. */
@property(nonatomic, weak) id<GCKLoggerDelegate> delegate;

/**
 * The filter to apply to log messages.
 *
 * @since 3.0
 */
@property(nonatomic, strong) GCKLoggerFilter *filter;

/**
 * Returns the GCKLogger singleton instance.
 */
+ (GCKLogger *)sharedInstance;

/**
 * Logs a message.
 *
 * @param function The calling function, normally <code>__func__</code>.
 * @param format The format string.
 */
- (void)logFromFunction:(const char *)function
                message:(NSString *)format, ... NS_FORMAT_FUNCTION(2, 3);

@end

/**
 * The GCKLogger delegate protocol.
 */
GCK_EXPORT
@protocol GCKLoggerDelegate <NSObject>

@optional

/**
 * Logs a message.
 *
 * @deprecated Use GCKLoggerDelegate::logMessage:fromFunction: instead.
 *
 * @param function The calling function, normally <code>__func__</code>.
 * @param message The log message.
 */
- (void)logFromFunction:(const char *)function
                message:(NSString *)message
    GCK_DEPRECATED("Use -[GCKLoggerDelegate logMessage:fromFunction:]");

/**
 * Logs a message.
 *
 * @param function The calling function, normally obtained from <code>__func__</code>.
 * @param message The log message.
 */
- (void)logMessage:(NSString *)message fromFunction:(NSString *)function;

@end

/**
 * @macro GCKLog
 *
 * A convenience macro for logging to the GCKLogger singleton. This is a drop-in replacement
 * for <a href="https://goo.gl/EwUYP8"><b>NSLog()</b></a>.
 */
#define GCKLog(FORMAT, ...) \
  [[GCKLogger sharedInstance] logFromFunction:__func__ message:FORMAT, ##__VA_ARGS__]

/**
 * @macro GCKDebugLog
 *
 * A convenience macro for using GCKLog in performance sensitive code intended only to be triggered
 * in diagnostic debug builds. This should be used only sparingly since this macro completely
 * removes GCKLog in release builds.  This is useful for eliminating extra logging calls, but
 * sacrifices the ability to configure logging in a release build.
 */
#ifdef DEBUG
#define GCKDebugLog GCKLog
#else
#define GCKDebugLog
#endif
