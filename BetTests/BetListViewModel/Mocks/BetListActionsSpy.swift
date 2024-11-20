//
//  BetListActionsSpy.swift
//  Bets
//
//  Created by Spyridon Skordos on 20/11/24.
//
@testable import Bets
@testable import BetsCore

class BetListActionsSpy: BetListActions {
    var betCalled: Bet?
    func betTapped(bet: Bet) {
        self.betCalled = bet
    }
}
