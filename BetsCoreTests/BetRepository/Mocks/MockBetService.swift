//
//  MockBetService.swift
//  Bets
//
//  Created by Spyridon Skordos on 20/11/24.
//

@testable import BetsCore

class MockBetService: BetService {
    var mockBets: [Bet] = []
    var saveBetsCalled = false
    var loadError: Error?
    var saveError: Error?
    
    func loadBets() async throws -> [Bet] {
        if let loadError {
            throw loadError
        }
        return mockBets
    }
    
    func saveBets(_ bets: [Bet]) async throws {
        if let saveError {
            throw saveError
        }
        saveBetsCalled = true
    }
}


