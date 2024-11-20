//
//  BetService+Protocol.swift
//  Bets
//
//  Created by Spyridon Skordos on 20/11/24.
//

public protocol BetService {
    func loadBets() async throws -> [Bet]
    func saveBets(_ bets: [Bet]) async throws
}
