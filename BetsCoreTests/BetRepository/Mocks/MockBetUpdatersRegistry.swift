//
//  MockBetUpdatersRegistry.swift
//  Bets
//
//  Created by Spyridon Skordos on 20/11/24.
//

@testable import BetsCore

class MockBetUpdatersRegistry: BetUpdatersRegistry {
    var updaters: [BetName: BetUpdater] = [:]

    func getUpdater(for betName: BetName) -> BetUpdater {
        return updaters[betName] ?? DefaultBetUpdater()
    }
}
