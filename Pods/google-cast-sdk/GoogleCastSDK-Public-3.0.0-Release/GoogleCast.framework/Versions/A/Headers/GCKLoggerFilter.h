// Copyright 2016 Google Inc.

#import <Foundation/Foundation.h>

#import <GoogleCast/GCKDefines.h>

/**
 * A class for filtering log messages that are produced using GCKLogger.
 *
 * @since 3.0
 */
GCK_EXPORT
@interface GCKLoggerFilter : NSObject

/**
 * A flag indicating whether the filter is exclusive (<code>YES</code>) or inclusive
 * (<code>NO</code>). By default filters are inclusive, that is, they accept all log messages that
 * match the filter.
 */
@property(nonatomic, assign, readwrite) BOOL exclusive;

/**
 * Constructs a new GCKLoggerFilter with empty criteria.
 */
- (instancetype)init;

/**
 * Adds a list of class names to be matched by the filter. A class name can be a simple name or the
 * name of an extension, for example, <code>@@"MyClass"</code> or
 * <code>@@"MyClass(MyExtension)"</code>. If an extension is not included in the name, all
 * extensions of the class will be included implicitly.
 */
- (void)addClassNames:(NSArray<NSString *> *)classNames;

/**
 * Adds a list of non-member function names to be matched by the filter.
 */
- (void)addFunctionNames:(NSArray<NSString *> *)functionNames;

/**
 * Adds a list of regular expression patterns for matching the text of the log messages.
 */
- (void)addMessagePatterns:(NSArray<NSString *> *)messagePatterns;

/**
 * Adds a list of regular expression patterns for matching the text of the log messages with
 * optional case-insensitivity.
 */
- (void)addMessagePatterns:(NSArray<NSString *> *)messagePatterns
           caseInsensitive:(BOOL)caseInsensitive;

/**
 * Applies the filter to a function string (as obtained from the <code>__func__</code> preprocessor
 * macro) and the message text.
 *
 * @return <code>YES</code> if either the function or the message matched the filter, otherwise
 * <code>NO</code>; the reverse is returned if the #exclusive property is set to <code>YES</code>.
 */
- (BOOL)matchesFunction:(NSString *)function message:(NSString *)message;

/**
 * Resets the filter; removing all match criteria.
 */
- (void)reset;

@end
