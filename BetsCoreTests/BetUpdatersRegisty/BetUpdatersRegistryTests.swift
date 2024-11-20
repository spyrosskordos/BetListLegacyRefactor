//
//  BetsUpdaterRegistryTests.swift
//  Bets
//
//  Created by Spyridon Skordos on 20/11/24.
//

import Testing
import XCTest

@testable import BetsCore

@Suite("BetUpdateStrategyFactory related tests")
final class BetsUpdaterRegistryTests {
    private var sut: BetUpdatersRegistryImpl

    init() {
        sut = BetUpdatersRegistryImpl()
    }

    @Test("Test all updater types",
          arguments: zip(["Total score", "Player performance", "Winning team", "Uknown bet"],
                         [
                             TotalScoreBetUpdater.self, PlayerPerformanceBetUpdater.self, WinningTeamBetUpdater.self,
                             DefaultBetUpdater.self,
                         ]))
    func testGetUpdaterForBet(name: String, expectedType: BetUpdater.Type) {
        // Call the reusable assertion logic for each test case
        assertOutputType(name: name, expectedType: expectedType)
    }

    func assertOutputType(name: String, expectedType: BetUpdater.Type) {
        // Act: Retrieve the updater for the given name
        let updater = sut.getUpdater(for: name)

        // Assert: Verify the correct updater type is returned
        #expect(
            type(of: updater) == expectedType,
            "Expected \(expectedType) for '\(name)', but got \(type(of: updater))"
        )
    }
}
