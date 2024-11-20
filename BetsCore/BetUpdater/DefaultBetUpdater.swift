//
//  DefaultBetUpdater.swift
//  Bets
//
//  Created by Spyridon Skordos on 20/11/24.
//

/// A struct that implements the `BetUpdater` protocol and provides a default implementation
/// for updating the properties of a `Bet`.
struct DefaultBetUpdater: BetUpdater {
    func update(bet: inout Bet) {
        if bet.quality > 0 {
            bet.quality -= 1
        }

        bet.sellIn -= 1

        if bet.sellIn < 0,
           bet.quality > 0
        {
            bet.quality -= 1
        }
    }
}
