//
//  BetListCoordinatorTests.swift
//  Bets
//
//  Created by Spyridon Skordos on 20/11/24.
//

import Testing
import UIKit

@testable import Bets
@testable import BetsCore

@MainActor
@Suite("BetListCoordinatorTests related tests")
struct BetListCoordinatorTests {
    private var navigationController: UINavigationController
    private var mockBetListFactory: MockBetListFactory
    private var mockBetRepository: MockBetRepository
    private var coordinator: BetListCoordinator

    init() {
        navigationController = UINavigationController()
        mockBetListFactory = MockBetListFactory()
        mockBetRepository = MockBetRepository(response: .mockResponse([]))
        coordinator = BetListCoordinator(
            navigation: navigationController,
            betListFactory: mockBetListFactory,
            betRepository: mockBetRepository
        )
    }

    @Test("Test start sets up initial ViewController")
    func testStart_SetsUpInitialViewController() {
        // Act: Start the Bet List Coordinator
        coordinator.start()

        // Assert: Verify that `makeModule` was called to create the Bet List module
        #expect(mockBetListFactory.didCallMakeModule, "`makeModule` should be called.")
        #expect(
            navigationController.viewControllers.count == 1,
            "There should be one view controller in the navigation stack."
        )
        #expect(
            navigationController.viewControllers.first == mockBetListFactory.mockModule,
            "The initial view controller should be the one created by `makeModule`."
        )
        #expect(
            navigationController.navigationBar.prefersLargeTitles,
            "The navigation bar should prefer large titles."
        )
    }

    @Test("Test betTapped navigate to Details")
    func testBetTapped_NavigatesToBetDetails() {
        // Arrange: Prepare a mock bet
        let mockBet = Bet(name: .halfTimeScore, sellIn: 10, quality: 20)

        // Act: Simulate a bet being tapped
        coordinator.betTapped(bet: mockBet)

        // Assert: Verify that `makeBetDetails` was called to create the details screen
        #expect(mockBetListFactory.didCallMakeBetDetails, "`makeBetDetails` should be called.")
        #expect(
            mockBetListFactory.receivedBet == mockBet,
            "The bet passed to `makeBetDetails` should match the tapped bet."
        )
        #expect(
            navigationController.viewControllers.count == 1,
            "Bet details should be pushed to the navigation stack."
        )
        #expect(
            navigationController.viewControllers.last == mockBetListFactory.mockBetDetails,
            "The last view controller should be the bet details view."
        )
    }
}
