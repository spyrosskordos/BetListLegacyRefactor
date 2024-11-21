//
//  BetUpdatersRegistry.swift
//  Bets
//
//  Created by Spyridon Skordos on 20/11/24.
//

public protocol BetUpdatersRegistry {
    /// Retrieve an updater for a given bet name
    func getUpdater(for betName: BetName) -> BetUpdater
}
