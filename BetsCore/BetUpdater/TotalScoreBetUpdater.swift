//
//  TotalScoreBetUpdate.swift
//  Bets
//
//  Created by Spyridon Skordos on 20/11/24.
//

/// A struct that implements the `BetUpdater` protocol and provides an implementation
/// for updating the properties of a `Bet` based on specific rules for bet with name total score.
struct TotalScoreBetUpdater: BetUpdater {
    func update(bet: inout Bet) {
        if bet.quality < 50 {
            bet.quality += 1
        }

        if bet.sellIn < 11,
           bet.quality < 50
        {
            bet.quality += 1
        }

        if bet.sellIn < 6,
           bet.quality < 50
        {
            bet.quality += 1
        }

        bet.sellIn -= 1

        if bet.sellIn < 0 {
            bet.quality = 0
        }
    }
}