
//
//  WinningTeamBetUpdater.swift
//  Bets
//
//  Created by Spyridon Skordos on 20/11/24.
//

/// A struct that implements the `BetUpdater` protocol and provides an implementation
/// for bets related to the winning team, where no updates to the bet's properties are performed.
struct WinningTeamBetUpdater: BetUpdater {
    func update(bet: inout Bet) {
        // No updates perfomed
    }
}
