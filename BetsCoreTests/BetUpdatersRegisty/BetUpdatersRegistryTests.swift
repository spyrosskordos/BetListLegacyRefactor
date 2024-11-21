//
//  BetsUpdaterRegistryTests.swift
//  Bets
//
//  Created by Spyridon Skordos on 20/11/24.
//

import Testing
import XCTest

@testable import BetsCore

@Suite("BetUpdatersRegistryImpl related tests")
final class BetUpdatersRegistryImplTests {

    private var sut: BetUpdatersRegistryImpl

    init() {
        sut = BetUpdatersRegistryImpl()
    }

    @Test(
        "Test all updater types",
        arguments: zip(
            [BetName.totalScore, .playerPerformance, .winningTeam, .cleanSheet],
            [
                TotalScoreBetUpdater.self,
                PlayerPerformanceBetUpdater.self,
                WinningTeamBetUpdater.self,
                DefaultBetUpdater.self,
            ]
        )
    )
    func testGetUpdaterForBet(name: BetName, expectedType: BetUpdater.Type) {
        // Call the reusable assertion logic for each test case
        assertOutputType(name: name, expectedType: expectedType)
    }

    func assertOutputType(name: BetName, expectedType: BetUpdater.Type) {
        // Act: Retrieve the updater for the given name
        let updater = sut.getUpdater(for: name)

        // Assert: Verify the correct updater type is returned
        #expect(
            type(of: updater) == expectedType,
            "Expected \(expectedType) for '\(name)', but got \(type(of: updater))"
        )
    }

}
