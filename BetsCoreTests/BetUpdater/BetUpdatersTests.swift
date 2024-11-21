//
//  BetsUpdaters.swift
//  Bets
//
//  Created by Spyridon Skordos on 20/11/24.
//

import Testing

@testable import BetsCore

@Suite("BetUpdaterTests related tests")
struct BetUpdaterTests {
    @Test(
        "Test DefaultBetUpdater behavior",
        arguments: defaultBetUpdaterTestCases
    )
    func testDefaultBetUpdaterBehavior(
        testCase: BetUpdaterTestCase
    ) {
        // Call the reusable assertion logic for each test case
        assertUpdate(for: testCase, betUpdater: DefaultBetUpdater())
    }

    @Test(
        "Test PlayerPerformanceBetUpdater behavior",
        arguments: playerPerformanceTestCases
    )
    func testPlayerPerformanceBetUpdaterBehavior(
        testCase: BetUpdaterTestCase
    ) {
        // Call the reusable assertion logic for each test case
        assertUpdate(for: testCase, betUpdater: PlayerPerformanceBetUpdater())
    }

    @Test(
        "Test TotalScoreBetUpdater behavior",
        arguments: totalScoreTestCases
    )
    func testTotalScoreBetUpdaterBehavior(
        testCase: BetUpdaterTestCase
    ) {
        // Call the reusable assertion logic for each test case
        assertUpdate(for: testCase, betUpdater: TotalScoreBetUpdater())
    }

    @Test("Test WinningTeamBetUpdater does not manipulate the bet")
    func testWinningTeamBetUpdaterBehavior() {
        // Call the reusable assertion logic for each test case
        assertUpdate(
            for: (
                initialSellIn: 15, initialQuality: 30, expectedSellIn: 15, expectedQuality: 30,
                description: "winning team bet"
            ),
            betUpdater: WinningTeamBetUpdater()
        )
    }

    // Reusable assertion logic
    func assertUpdate(for testCase: BetUpdaterTestCase, betUpdater: BetUpdater) {
        // Arrange: Create a bet with the provided initial values
        var bet = Bet(
            name: .cornerKicks,
            sellIn: testCase.initialSellIn,
            quality: testCase.initialQuality
        )

        // Act: Update the bet using betUpdater
        betUpdater.update(bet: &bet)

        // Assert: Verify the outcomes with clear error messages
        #expect(
            bet.sellIn == testCase.expectedSellIn,
            "Expected sellIn to be \(testCase.expectedSellIn) but got \(bet.sellIn) for \(testCase.description)"
        )
        #expect(
            bet.quality == testCase.expectedQuality,
            "Expected quality to be \(testCase.expectedQuality) but got \(bet.quality) for \(testCase.description)"
        )
    }
}
