import Testing

//
//  BetListViewModelTests.swift
//  Bets
//
//  Created by Spyridon Skordos on 20/11/24.
//
@testable import Bets
@testable import BetsCore

@MainActor
@Suite("BetListViewModel Related tests")
struct BetListViewModelTests {

    /// Creates a new instance of the `BetListViewModel` with a mock repository.
    /// - Parameter response: The desired response behavior for the mock repository.
    /// - Returns: BetListViewModel.
    private func makeSUT(response: MockBetRepository.Response, actions: BetListActions? = nil) -> (
        sut: BetListViewModel, mockRepository: MockBetRepository
    ) {
        let mockRepository = MockBetRepository(response: response)
        let sut = BetListViewModel(betRepository: mockRepository, betListActions: actions)
        return (sut, mockRepository)
    }

    @Test("Test initial state is loading")
    func test_initialState_isLoading() {
        // Arrange: Create the SUT
        let (sut, _) = makeSUT(response: .mockResponse([]))

        // Assert: Verify the initial state is `.loading`
        if case .loading = sut.state {
            return  // Pass the test if the state is .loading
        }

        Issue.record("Expected state to be .loading, but got \(sut.state)")
    }

    @Test("Test getOdds success updates state to loaded")
    func test_getOdds_success_updatesStateToLoaded() async {
        // Arrange: Define expected bets and create the SUT
        let expectedBets = [
            Bet(name: .cornerKicks, sellIn: 1, quality: 5),
            Bet(name: .offsides, sellIn: 2, quality: 4),
        ]
        let (sut, mockRepository) = makeSUT(response: .mockResponse(expectedBets))

        // Act: Fetch odds
        await sut.getOdds()

        // Assert: Verify the state transitions to `.loaded` with the correct data
        if case let .loaded(bets) = sut.state {
            #expect(bets == expectedBets)  // Pass if the loaded bets match the expected
        } else {
            Issue.record("Expected state to be .loaded with bets, but got \(sut.state)")
        }

        // Verify that `updateOdds` was called once
        #expect(mockRepository.isUpdateOddsCalled == true)
        #expect(mockRepository.updateOddsCallCount == 1)
    }

    @Test("Test getOdds failure updates state to error")
    func test_getOdds_failure_updatesStateToError() async {
        // Arrange: Define the error and create the SUT
        let expectedError = NSError(
            domain: "TestError",
            code: 123,
            userInfo: [NSLocalizedDescriptionKey: "Failed to fetch odds"]
        )
        let (sut, mockRepository) = makeSUT(response: .error(expectedError))

        // Act: Fetch odds
        await sut.getOdds()

        // Assert: Verify the state transitions to `.error` with the correct error message
        if case let .error(message) = sut.state {
            #expect(message == expectedError.localizedDescription)  // Pass if the error message matches
        } else {
            Issue.record("Expected state to be .error, but got \(sut.state)")
        }

        // Verify that `updateOdds` was called once
        #expect(mockRepository.isUpdateOddsCalled == true)
        #expect(mockRepository.updateOddsCallCount == 1)
    }

    @Test("Test bet tapped triggers actions delegate")
    func test_betTapped_triggers_actionsDelegate() async {
        // Arrange: Define the error and create the SUT
        let spy = BetListActionsSpy()
        let expectedBet = Bet(name: .firstGoalScorer, sellIn: 1, quality: 1)
        let (sut, _) = makeSUT(response: .mockResponse([expectedBet]), actions: spy)

        // Act: bet tapped
        sut.betTapped(bet: expectedBet)

        // Assert: Verify that betTapped delegate function was called
        #expect(spy.betCalled == expectedBet)
    }
}
