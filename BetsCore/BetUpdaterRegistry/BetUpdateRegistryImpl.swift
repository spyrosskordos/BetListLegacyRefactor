//
//  BetUpdatesRegistryImpl.swift
//  Bets
//
//  Created by Spyridon Skordos on 20/11/24.
//

/// A registry that maps bet names to their corresponding updaters.
public class BetUpdatersRegistryImpl: BetUpdatersRegistry {
    private let updaters: [String: BetUpdater]

    /// Initializes the registry with predefined updaters.
    public init() {
        self.updaters = [
            "Total score": TotalScoreBetUpdater(),
            "Player performance": PlayerPerformanceBetUpdater(),
            "Winning team": WinningTeamBetUpdater()
        ]
    }

    /// Returns the updater for the given bet name, or a default updater if none is found.
    /// - Parameter betName: The name of the bet.
    /// - Returns: A `BetUpdater` instance.
    public func getUpdater(for betName: String) -> BetUpdater {
        return updaters[betName] ?? DefaultBetUpdater()
    }
}
