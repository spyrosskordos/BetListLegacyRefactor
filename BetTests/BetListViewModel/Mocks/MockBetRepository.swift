//
//  MockBetRepository.swift
//  Bets
//
//  Created by Spyros Skordos on 20/11/24.
//
@testable import Bets
@testable import BetsCore

class MockBetRepository: BetRepository {
    enum Response {
        case error(Error)
        case mockResponse([Bet])
    }

    var response: Response

    // Tracks whether `updateOdds` was called
    private(set) var isUpdateOddsCalled = false
    private(set) var updateOddsCallCount = 0

    init(response: Response) {
        self.response = response
    }

    func updateOdds() async throws -> [Bet] {
        isUpdateOddsCalled = true
        updateOddsCallCount += 1

        switch response {
        case .error(let error):
            throw error
        case .mockResponse(let array):
            return array
        }
    }
}
