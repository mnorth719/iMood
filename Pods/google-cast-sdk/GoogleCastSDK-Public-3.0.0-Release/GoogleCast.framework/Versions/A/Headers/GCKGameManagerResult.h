// Copyright 2014 Google Inc.

/** @cond ENABLE_FEATURE_GAME_MANAGER */

#import <Foundation/Foundation.h>

/**
 * @file GCKGameManagerResult.h
 * GCKGameManagerResult definition.
 */

/**
 * The result of a Game Manager request.
 */
GCK_EXPORT
@interface GCKGameManagerResult : NSObject

/**
 * The request ID associated with this response.
 */
@property(nonatomic, assign, readonly) NSInteger requestID;

/**
 * The player ID associated with this response.
 */
@property(nonatomic, copy, readonly) NSString *playerID;

/**
 * Extra message data stored as part of this response.
 */
@property(nonatomic, copy, readonly) id extraData;

@end

/** @endcond */
