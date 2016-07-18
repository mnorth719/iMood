// Copyright 2014 Google Inc.

/** @cond ENABLE_FEATURE_GAME_MANAGER */

#import <Foundation/Foundation.h>

#import <GoogleCast/GCKGameplayState.h>
#import <GoogleCast/GCKLobbyState.h>
#import <GoogleCast/GCKPlayerInfo.h>
#import <GoogleCast/GCKPlayerState.h>

/**
 * @file GCKGameManagerState.h
 */

/**
 * A representation of the state of the Game Manager running on the receiver device.
 */
GCK_EXPORT
@interface GCKGameManagerState : NSObject

/**
 * The lobby state. See GCKLobbyState for valid values.
 */
@property(nonatomic, readonly) GCKLobbyState lobbyState;

/**
 * The gameplay state. See GCKGameplayState for valid values.
 */
@property(nonatomic, readonly) GCKGameplayState gameplayState;

/**
 * The game specific data. Will be either an object that can be serialized to JSON using
 * NSJSONSerialization, or <code>nil</code>.
 */
@property(nonatomic, copy, readonly) id gameData;

/**
 * The game status text.
 */
@property(nonatomic, copy, readonly) NSString *gameStatusText;

/**
 * The list of all players in the game.
 */
@property(nonatomic, readonly) NSArray<GCKPlayerInfo *> *players;

/**
 * The list of all the players created by this sender device.
 */
@property(nonatomic, readonly) NSArray<GCKPlayerInfo *> *controllablePlayers;

/**
 * The list of players in a connected state. A player is considered to be in a connected state if
 * the associated GCKPlayerInfo::playerState is one of @ref GCKPlayerStateAvailable,
 * @ref GCKPlayerStateReady, @ref GCKPlayerStateIdle, or @ref GCKPlayerStatePlaying.
 */
@property(nonatomic, readonly) NSArray<GCKPlayerInfo *> *connectedPlayers;

/**
 * The list of players in a connected state that were also created on this sender device. A player
 * is considered to be in a connected state if the associated GCKPlayerInfo::playerState is
 * one of @ref GCKPlayerStateAvailable, @ref GCKPlayerStateReady, @ref GCKPlayerStateIdle, or
 * @ref GCKPlayerStatePlaying.
 */
@property(nonatomic, readonly) NSArray<GCKPlayerInfo *> *connectedControllablePlayers;

/**
 * The application name. Returns <code>nil</code> if the GCKGameManagerChannel is not yet connected
 * to the receiver's Game Manager.
 */
@property(nonatomic, copy, readonly) NSString *applicationName;

/**
 * The maximum number of players as defined by the receiver. Returns 0 if the GCKGameManagerChannel
 * is not yet connected to the receiver's Game Manager.
 */
@property(nonatomic, readonly) NSInteger maxPlayers;

/**
 * Returns the GCKPlayerInfo for the specified player ID or <code>nil</code> if the player does not
 * exist.
 *
 * @param playerID The player ID.
 */
- (GCKPlayerInfo *)getPlayer:(NSString *)playerID;

/**
 * Returns a list of players that are in the specified player state.
 *
 * @param playerState The player state.
 */
- (NSArray<GCKPlayerInfo *> *)getPlayersInState:(GCKPlayerState)playerState;

/**
 * Returns whether the lobby state is different between this object and the specified game manager
 * state.
 *
 * @param otherState The game manager state to compare to.
 */
- (BOOL)hasLobbyStateChanged:(GCKGameManagerState *)otherState;

/**
 * Returns whether the gameplay state is different between this object and the specified game
 * manager state.
 *
 * @param otherState The game manager state to compare to.
 */
- (BOOL)hasGameplayStateChanged:(GCKGameManagerState *)otherState;

/**
 * Returns whether the game data is different between this object and the specified game manager
 * state.
 *
 * @param otherState The game manager state to compare to.
 */
- (BOOL)hasGameDataChanged:(GCKGameManagerState *)otherState;

/**
 * Returns whether game status text is different between this object and the specified game manager
 * state.
 *
 * @param otherState The game manager state to compare to.
 */
- (BOOL)hasGameStatusTextChanged:(GCKGameManagerState *)otherState;

/**
 * Returns whether the player with the specified player ID has changed between this object and the
 * specified game manager state.
 *
 * @param playerId The player ID.
 * @param otherState The game manager state to compare to.
 */
- (BOOL)hasPlayerChanged:(NSString *)playerId otherState:(GCKGameManagerState *)otherState;

/**
 * Returns whether the player state of the player with the specified player ID has changed between
 * this object and the specified game manager state.
 *
 * @param playerId The player ID.
 * @param otherState The game manager state to compare to.
 */
- (BOOL)hasPlayerStateChanged:(NSString *)playerId otherState:(GCKGameManagerState *)otherState;

/**
 * Returns whether the player data of the player with the specified player ID has changed between
 * this object and the specified game manager state.
 *
 * @param playerId The player ID.
 * @param otherState The game manager state to compare to.
 */
- (BOOL)hasPlayerDataChanged:(NSString *)playerId otherState:(GCKGameManagerState *)otherState;

/**
 * Returns a list of player IDs that are different between this object and the specified game
 * manager state. This includes players that were added, removed, or have changed in any way.
 *
 * @param otherState The game manager state to compare to.
 */
- (NSArray<NSString *> *)getListOfChangedPlayers:(GCKGameManagerState *)otherState;

@end

/** @endcond */
