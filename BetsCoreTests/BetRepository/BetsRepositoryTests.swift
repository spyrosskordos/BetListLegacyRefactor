//
//  BetsRepositoryTests.swift
//  Bets
//
//  Created by Spyridon Skordos on 20/11/24.
//
@testable import BetsCore
import Testing

@Suite("Bets repository related tests")
final class BetRepositoryTests {
    private var betService: MockBetService
    private var betUpdaterRegistry: MockBetUpdatersRegistry
    private var betRepository: BetRepositoryImpl

    init() {
        betService = MockBetService()
        betUpdaterRegistry = MockBetUpdatersRegistry()
        betRepository = BetRepositoryImpl(service: betService, betUpdaterRegistry: betUpdaterRegistry)
    }

    @Test("Test case for successfully updating bets' odds")
    func testUpdateOdds_Success() async throws {
        // Arrange: Setting up mock bets and bet updaters
        let mockBets = [
            Bet(name: "Bet1", sellIn: 10, quality: 20),
            Bet(name: "Bet2", sellIn: 5, quality: 7)
        ]
        betService.mockBets = mockBets
        betUpdaterRegistry.updaters = [
            "Bet1": MockBetUpdater {
                $0.quality += 1
                $0.sellIn -= 1
            },
            "Bet2": MockBetUpdater {
                $0.quality += 10
                $0.sellIn -= 1
            }
        ]

        // Act: Call the updateOdds method
        let updatedBets = try await betRepository.updateOdds()

        // Assert: Verify that the bets were updated correctly and that saveBets was called
        try #require(updatedBets.count == 2)
        #expect(updatedBets[0].name == "Bet1")
        #expect(updatedBets[0].quality == 21)
        #expect(updatedBets[0].sellIn == 9)
        #expect(updatedBets[1].name == "Bet2")
        #expect(updatedBets[1].quality == 17)
        #expect(updatedBets[1].sellIn == 4)
        #expect(betService.saveBetsCalled)
    }

    @Test("Test case for when loading bets fails")
    func testUpdateOdds_LoadBetsFails() async {
        // Arrange: Simulate an error when loading bets
        betService.loadError = MockError.loadError

        // Act & Assert: Ensure that the error is thrown when trying to update odds
        await #expect(throws: MockError.loadError) {
            try await betRepository.updateOdds()
        }
    }

    @Test("Test case for when saving bets fails")
    func testUpdateOdds_SaveBetsFails() async {
        // Arrange: Set up mock bets and simulate an error when saving bets
        let mockBets = [
            Bet(name: "Bet1", sellIn: 10, quality: 20)
        ]
        betService.mockBets = mockBets
        betService.saveError = MockError.saveError
        betUpdaterRegistry.updaters = [
            "Bet1": MockBetUpdater { $0.quality += 1 }
        ]

        // Act & Assert: Ensure that the error is thrown when trying to save odds
        await #expect(throws: MockError.saveError) {
            try await betRepository.updateOdds()
        }
    }

    @Test("Test case for when there are no bets to update")
    func testUpdateOdds_EmptyBets() async throws {
        // Arrange: Set up empty mock bets list
        betService.mockBets = []

        // Act: Call the updateOdds method
        let updatedBets = try await betRepository.updateOdds()

        // Assert: Verify that no bets were updated and saveBets was still called
        #expect(updatedBets.isEmpty)
        #expect(betService.saveBetsCalled)
    }
}
