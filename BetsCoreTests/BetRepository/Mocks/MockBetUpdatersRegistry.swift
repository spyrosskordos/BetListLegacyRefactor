//
//  MockBetUpdatersRegistry.swift
//  Bets
//
//  Created by Spyridon Skordos on 20/11/24.
//

@testable import BetsCore

class MockBetUpdatersRegistry: BetUpdatersRegistry {
    var updaters: [String: BetUpdater] = [:]

    func getUpdater(for betName: String) -> BetUpdater {
        return updaters[betName] ?? DefaultBetUpdater()
    }
}
