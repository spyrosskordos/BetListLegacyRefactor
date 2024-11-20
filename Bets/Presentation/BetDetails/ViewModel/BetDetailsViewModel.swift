//
//  BetDetailsViewModel.swift
//  Bets
//
//  Created by Spyridon Skordos on 20/11/24.
//
import BetsCore
import SwiftUI
@MainActor
@Observable class BetDetailsViewModel {
    let bet: Bet
    
    init(bet: Bet) {
        self.bet = bet
    }
}
