//
//  MockBetUpdater.swift
//  Bets
//
//  Created by Spyridon Skordos on 20/11/24.
//
@testable import BetsCore

class MockBetUpdater: BetUpdater {
    
    private let updateClosure: (inout Bet) -> Void
    
    init(updateClosure: @escaping (inout Bet) -> Void) {
        self.updateClosure = updateClosure
    }
    
    func update(bet: inout Bet) {
        updateClosure(&bet)
    }
}
