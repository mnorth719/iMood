// Copyright 2015 Google Inc.

#import <Foundation/Foundation.h>

/**
 * A category on <a href="https://goo.gl/0wgZmj"><b>NSTimer</b></a> that adds some useful
 * enhancements.
 */
@interface NSTimer (GCKAdditions)

/**
 * Constructs an <a href="https://goo.gl/0wgZmj"><b>NSTimer</b></a> with a weak target. Avoids a
 * retain loop between the timer and its target. The timer will be automatically invalidated if the
 * target has been released when the timer fires.
 */
+ (NSTimer *)gck_scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                     weakTarget:(id)target
                                       selector:(SEL)selector
                                       userInfo:(id)userInfo
                                        repeats:(BOOL)repeats;

@end
