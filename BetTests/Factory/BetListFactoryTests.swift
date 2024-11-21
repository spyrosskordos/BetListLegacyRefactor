//
//  BetListFactoryTests.swift
//  Bets
//
//  Created by Spyridon Skordos on 20/11/24.
//

import SwiftUI
import Testing

@testable import Bets
@testable import BetsCore

@MainActor
@Suite("BetListFactory related tests")
struct BetListFactoryTests {
    private var factory: BetListFactory
    private var mockBetRepository: MockBetRepository
    private var mockDelegate: BetListActionsSpy

    init() {
        factory = BetListFactoryImpl()  // The implementation being tested
        mockBetRepository = MockBetRepository(response: .mockResponse([]))  // Mock repository
        mockDelegate = BetListActionsSpy()  // Mock delegate
    }

    @Test("Test makeModule creates betList module")
    func testMakeModule_CreatesBetListModule() {
        // Act: Call the factory method to create the Bet List module
        let viewController = factory.makeModule(with: mockBetRepository, delegate: mockDelegate)

        // Assert: Verify that the returned view controller is a UIHostingController wrapping BetListView
        #expect(
            viewController is UIHostingController<BetListView>,
            "The returned view controller should be a UIHostingController wrapping `BetListView`."
        )
        #expect(viewController.title == "Odds", "The view controller's title should be 'Odds'.")

    }
    @Test("Test makeBetDetails creates betDetails module")
    func testMakeBetDetails_CreatesBetDetailsModule() {
        // Arrange: Create a mock Bet instance to pass into the factory
        let mockBet = Bet(name: .hatTrick, sellIn: 5, quality: 10)

        // Act: Call the factory method to create the Bet Details module
        let viewController = factory.makeBetDetails(with: mockBet)

        // Assert: Verify that the returned view controller is a UIHostingController wrapping BetDetailsView
        #expect(
            viewController is UIHostingController<BetDetailsView>,
            "The returned view controller should be a UIHostingController wrapping `BetDetailsView`."
        )
        #expect(
            viewController.title == BetName.hatTrick.rawValue,
            "The view controller's title should match the bet's name."
        )

    }
}
